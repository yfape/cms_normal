<?php
namespace app\v1\controller\api;
use think\Controller;
use think\Request;

use app\v1\controller\main\User as UserC;

use tool\QQMailer;
use tool\RedisHash;
use tool\Assist;


class vercode extends Controller{

	protected function _initialize(){
		parent::_initialize();
	}

	/**
	 * 发送验证码
	 * @return [type] [description]
	 */
	public function sendVerCode(){
		$data = Request::instance()->post();
		if(!isset($data['user'])){
			return getOut(9998);
		}
		$user = $data['user'];
		$user = $this->verifyUserExist($user);
		if(!$user){
			return getOut(1001);
		}
		if(!isset($user['email'])||!$user['email']){
			return getOut(1009);
		}
		$vercode = Assist::getRandomStr(6,false);
		$mailer = new QQMailer(true);
		$title = '验证码';
		$content = "<p>您的验证码码为:<span style='font-size:20px;font-weight:bold;color:red'> $vercode </span></p><p>请勿将此码透露给他人,此码将在两分钟内作废。</p>";
		if($this->setRedis($user['uid'],$vercode)){
			return $mailer->send($user['email'], $title, $content) ? ['code'=>200,'msg'=>'发送成功'] : getOut(1008);
		}
	}

	/**
	 * 验证输入用户是否存在
	 * @param  [type] $user [description]
	 * @return [type]           [description]
	 */
	protected function verifyUserExist($user){
		$userc = new UserC;
		$user = $userc->getUser($user);
		return $user?$user:false;
	}

	/**
	 * 刷新Redis用户对应VerCode
	 * @param  [type] $vercode [description]
	 * @return [type]            [description]
	 */
	protected function setRedis($uid,$vercode){
		$hash = RedisHash::instance();
		$res = $hash->setTable('u_vercode')->setKey($uid)->set(['vercode'=>$vercode],'',true)->setExpire(120);
		return $res;
	}

}