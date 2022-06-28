<?php
declare (strict_types = 1);
namespace app\admin\controller;

use think\facade\Request;
use app\admin\model\User as UserModel;

class Login{

	protected $user;
	protected $pass;
	protected $vercode;
	protected $sysuser;

    public function index(){
    	$this->setData();
    	if(!$this->checkDataComplate()){
    		return err('数据不完整');
    	}
    	if(!$this->getUser()){
    		return err('不存在用户');
    	}
      if(!$this->isValidUser()){
        return err('用户已被禁用');
      }
      if(!$this->isForbid()){
        return err('用户已阻断');
      }
      // if(!$this->isVercodeTrue()){
      //   return err('登陆码错误');
      // }
      if(!$this->isPassTrue()){
        return err('用户名或密码错误');
      }
      $token = $this->createToken();
      $this->setTokenRedis($token);
      $this->saveUserLog($token);
      $this->clearVercode();
      $this->resetErrnum();
      $userdata = $this->setUserData();
      return json(['msg'=>'登录成功','data'=>['token'=>$token,'userdata'=>$userdata]]);
    }

    /**
     * 装载数据输入数据
     */
    public function setData(){
    	$data = Request::post(['user','pass','vercode']);
    	$this->user = $data['user'];
    	$this->pass = $data['pass'];
    	$this->vercode = $data['vercode'];
    }

    /**
     * 检查数据完整性
     * @return [type] [description]
     */
   	protected function checkDataComplate(){
   		if($this->user && $this->pass && $this->vercode){
   			return true;
   		}else{
   			return false;
   		}
   	}

   	/**
   	 * 获取用户
   	 * @return [type] [description]
   	 */
   	protected function getUser(){
      $userc = new \app\admin\controller\User;
      $sysuser = $userc->getUser('user', $this->user, false);
   		if($sysuser){
   			$this->sysuser = $sysuser;
   			return true;
   		}else{
   			return false;
   		}
   	}

    /**
     * 判断用户是否被禁用
     * @return boolean [description]
     */
    protected function isValidUser(){

      return $this->sysuser['valid'] ? true : false;
    }

    /**
     * 判断用户是否被临时禁止
     * @param  [type]  $uid [description]
     * @return boolean      [description]
     */
    protected function isForbid(){

      return app('rhash')->setTable('u_forbid')->setKey($this->sysuser['uid'])->get() ? false : true;
    }

    /**
     * 对比验证码是否相同
     * @param  [type]  $logincode [description]
     * @param  [type]  $truecode  [description]
     * @return boolean            [description]
     */
    protected function isVercodeTrue(){
      $truecode = app('rhash')->setTable('u_vercode')->setKey($this->sysuser['uid'])->get('vercode');
      $res = ($truecode && $this->vercode === $truecode) ? true : false;
      !$res && $this->setErrRedis();
      return $res;
    }

    /**
     * 判断密码是否正确
     * @param  [type] $pass     [description]
     * @param  [type] $truepass [description]
     * @return [type]           [description]
     */
    protected function isPassTrue(){
      $pass = openssl_encrypt($this->pass, 'AES-256-ECB', config('admin.loginsalt'));
      $res = ($this->sysuser['pass'] && $pass === $this->sysuser['pass']) ? true : false;
      !$res && $this->setErrRedis();
      return $res;
    }

    /**
     * 增加错误次数和临时阻断
     * @param [type] $uid [description]
     */
    protected function setErrRedis(){
      $uid = $this->sysuser['uid'];
      $errnum = app('rhash')->setTable('u_errnum')->setKey($uid)->get('num');
      if($errnum>=4){
        app('rhash')->setTable('u_errnum')->setKey($uid)->set(['num'=>0]);
        app('rhash')->setTable('u_forbid')->setKey($uid)->set(['uid'=>$uid],'',true)->setExpire(180);
      }else{
        app('rhash')->setTable('u_errnum')->setKey($uid)->set(['num'=>$errnum+1]);
      }
    }

    /**
     * 创建token
     * @return [type] [description]
     */
    protected function createToken(){
    	$config = config('admin.auth');
      $data = [
        'uid'=>$this->sysuser['uid'],
        'user'=>$this->sysuser['user'],
        'ip'=>Request::ip()
      ];
    	$token = app('auth')->getToken($data, $config['expire'], $config['aud'], $config['iss'], $config['salt']);
    	return $token;
    }

    /**
     * 将token放入redis
     * @param [type] $token [description]
     */
    protected function setTokenRedis($token){

      app('rhash')->setTable('u_token')->setKey($this->sysuser['uid'])->set(['token'=>$token]);
    }

    /**
     * 存储用户操作信息
     * @param  [type] $token [description]
     * @return [type]        [description]
     */
    protected function saveUserLog($token){
      $userlog = new \app\admin\model\UserLog;
      $res = $userlog->save([
        'uid' => $this->sysuser['uid'],
        'time' => time(),
        'action' => 'login',
        'token' => $token,
        'ip' => Request::ip()
      ]);
      return $res;
    }

    /**
     * 删除redis vercode
     * @return [type] [description]
     */
    protected function clearVercode(){

      app('rhash')->setTable('u_vercode')->deleteByKey($this->sysuser['uid']);
    }

    /**
     * 重置errnum
     * @return [type] [description]
     */
    protected function resetErrnum(){

      app('rhash')->setTable('u_errnum')->setKey($this->sysuser['uid'])->set(['num'=>0]);
    }

    /**
     * 装载用户数据
     */
    protected function setUserData(){
      $data = [
        'uid' => $this->sysuser['uid'],
        'nickname' => $this->sysuser['nickname'],
        'identity' => $this->sysuser['identity'],
        'headimg' => $this->sysuser['headimg'],
      ];
      return $data;
    }
}
