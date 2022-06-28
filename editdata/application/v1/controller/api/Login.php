<?php
namespace app\v1\controller\api;
use think\Controller;
use think\Request;
use think\Db;

use app\v1\controller\main\User as Userc;

use tool\AuthControl;
use tool\RedisHash;
use tool\Format;

class Login extends Controller{

	protected $request;
	protected $hash;
	protected $user;

	protected function _initialize(){
		parent::_initialize();
		$this->request = Request::instance();
		$this->hash = RedisHash::instance();

	}

	/**
	 * 执行登录操作
	 * 1.判断输入用户信息完整性
	 * 2.查询用户是否存在
	 * 3.判断用户是否被禁用
	 * 4.判断用户是否被临时阻断
	 * 5.判断登录码是否正确
	 * 6.判断密码是否正确
	 * 7.创建token,存储redis
	 * 8.存储登陆日志
	 * 9.返回用户登录凭证等信息
	 * @return [arr] [description]
	 */
	public function login(){
		$logindata = $this->request->only(['user','pass','vercode'],'post');
		if(!$this->checkDataComplate($logindata)){
			return getOut(9998);
		}
		$this->user = $this->getUser($logindata['user']);
		if(!$this->user){
			return getOut(1001);
		}
		if(!$this->isValidUser()){
			return getOut(1003);
		}
		if($this->isForbid()){
			return getOut(1010);
		}
		if(!$this->isLogincodeTrue($logindata['vercode'])){
			// $this->setErrRedis();
			// return getOut(1007);
		}
		if(!$this->isPassTrue($logindata['pass'])){
			$this->setErrRedis();
			return getOut(1002);
		}

		$token = $this->createToken();
		$this->setTokenRedis($token);
		$this->saveLoginlog();
		$this->saveLoginLastInfo();
		$this->zeroErrNum();

		return ['code'=>200,'msg'=>'登录成功','data'=>$token];
	}

	/**
	 * 通过用户名获取用户数据
	 * @param  [type] $username [description]
	 * @return [type]           [description]
	 */
	protected function getUser($username){
		$userc = new Userc;
		return $userc->getUser($username);
	}

	/**
	 * 检查输入数据完整性
	 * @param  [type] $data [description]
	 * @return [type]       [description]
	 */
	protected function checkDataComplate($data){
		if(!isset($data['user'])||!isset($data['pass'])||!isset($data['vercode'])){
			return false;
		}else{
			return true;
		}
	}

	/**
	 * 判断用户是否被禁用
	 * @param  [type]  $user [description]
	 * @return boolean       [description]
	 */
	protected function isValidUser(){
		return $this->user['valid'] ? true : false;
	}

	/**
	 * 对比验证码是否相同
	 * @param  [type]  $logincode [description]
	 * @param  [type]  $truecode  [description]
	 * @return boolean            [description]
	 */
	protected function isLogincodeTrue($vercode){
		$truecode = $this->hash->setTable('u_vercode')->setKey($this->user['uid'])->get('vercode');
		return ($truecode && $vercode === $truecode) ? true : false;
	}

	/**
	 * 判断用户是否被临时禁止
	 * @param  [type]  $uid [description]
	 * @return boolean      [description]
	 */
	protected function isForbid(){
		return $this->hash->setTable('u_f')->setKey($this->user['uid'])->get()?true:false;
	}

	/**
	 * 判断密码是否正确
	 * @param  [type] $pass     [description]
	 * @param  [type] $truepass [description]
	 * @return [type]           [description]
	 */
	protected function isPassTrue($pass){
		$pass = openssl_encrypt($pass, config('srecret.en_method'), config('srecret.openssl_key'));
		return ($this->user['pass'] && $pass === $this->user['pass']) ? true : false;
	}

	/**
	 * 增加错误次数和临时阻断
	 * @param [type] $uid [description]
	 */
	protected function setErrRedis(){
		$uid = $this->user['uid'];
		$errnum = $this->hash->setTable('u_user')->setKey($uid)->get('errnum');
		if($errnum>=4){
			$this->hash->setTable('u_user')->setKey($uid)->set(['errnum'=>0]);
			$this->hash->setTable('u_f')->setKey($uid)->set(['uid'=>$uid],'',true)->setExpire(180);
		}else{
			$this->hash->setTable('u_en')->setKey($uid)->set(['num'=>$errnum+1]);
		}
	}

	/**
	 * 错误次数归零
	 * @param  [type] $uid [description]
	 * @return [type]      [description]
	 */
	protected function zeroErrNum(){
		$this->hash->setTable('u_en')->setKey($this->user['uid'])->set(['num'=>0]);
	}

	/**
	 * 创建token,存储至redis
	 * @return [str]
	 */
	protected function createToken(){
		$data = ['uid'=>$this->user['uid'],'user'=>$this->user['user'],'ip'=>$this->request->ip()];
		$token = AuthControl::getToken($data,config('auth.expire'),config('auth.aud'),config('auth.iss'),config('auth.salt'));
		return $token;
	}

	/**
	 * 将token放入redis
	 * @param [type] $token [description]
	 */
	protected function setTokenRedis($token){
		$this->hash->setTable('u_token')->setKey($this->user['uid'])->set(['token'=>$token]);
	}

	/**
	 * 存储登录日志
	 * @return [bool]
	 */
	protected function saveLoginlog(){
		$res = Db::table('loginlog')->insert([
			'uid'=>$this->user['uid'],
			'date'=>time(),
			'ip'=>$this->request->ip()
		]);
		return $res?true:false;
	}
	
	/**
	 * 存储最后一次登录信息
	 * @param  [type] $user    [description]
	 * @param  [type] $request [description]
	 * @return [bool]          [description]
	 */
	protected function saveLoginLastInfo(){
		return Db::table('user')->where('uid',$this->user['uid'])->update([
			'lastlogintime'=>time(),
			'lastloginip'=>$this->request->ip()
		]);
	}

}