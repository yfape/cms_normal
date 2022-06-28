<?php
namespace app\v1\controller\service;
use think\Controller;
use think\Request;
use think\Cache;

use app\v1\controller\main\User as UserC;

use tool\AuthControl;
use tool\RedisHash;

class CheckToken extends Controller{

	protected $request;

	public function run(){
		$this->request = Request::instance();
		$token = $this->request->header('Authorization');
		if(!$token){
			echo json_encode(getOut(1016));exit();
		}
		$res = AuthControl::verToken($token,config('auth.salt'),config('auth.jsclass'));
		if($res['code']!==200){
			echo json_encode($res);exit();
		}
		$tokendata = $res['data'];
		if(!$this->verIP($tokendata->ip)){
			echo json_encode(getOut(1016));exit();
		}
		$user = $this->getUser($tokendata->uid);
		if(!$user){
			echo json_encode(getOut(1001));exit();
		}
		if(!$this->verTokenRedis($user['uid'],$token)){
			echo json_encode(getOut(1015));exit();
		}
		if(!$user['valid']){
			echo json_encode(getOut(1003));exit();
		}
		if(!$this->verIdentity($user['identity'])){
			echo json_encode(getOut(1017));exit();
		}else{
			//身份验证完成
			$this->request->user = $user;
		}
	}

	/**
	 * 获取用户数据
	 * @param  [type] $uid [description]
	 * @return [type]      [description]
	 */
	protected function getUser($uid){
		$userc = new UserC;
		return $userc->getUser($uid);
	}

	/**
	 * 比对tokenip一致性
	 * @param  [type] $ip      [description]
	 * @param  [type] $requset [description]
	 * @return [type]          [description]
	 */
	protected function verIP($ip){
		$requestIP = $this->request->ip();
		return (strcmp($ip,$requestIP) === 0)?true:false;
	}

	/**
	 * 检查redis中的token一致性
	 * @param  [type] $uid   [description]
	 * @param  [type] $token [description]
	 * @return [type]        [description]
	 */
	protected function verTokenRedis($uid,$token){
		$hash = new RedisHash;
		$truetoken = $hash->setTable('u_token')->setKey($uid)->get('token');
		return (($truetoken === $token)&&$truetoken) ? true:false;
	}

	/**
	 * 判断用户权限
	 * @param  [type] $user [description]
	 * @return [type]       [description]
	 */
	protected function verIdentity($identity){
		$urlarr = explode('/',$this->request->url());
		$version = $urlarr[1];
		$controller = $urlarr[2];

		$len = strpos($controller,'?');
		if($len !== false){
			$controller = substr($controller,0,$len);
		}
		$actAuth = config('sys_auth');

		if(!isset($actAuth[$version][$controller])){
			return false;
		}else{
			return ((int)$identity<=(int)$actAuth[$version][$controller])?true:false;
		}
	}
}