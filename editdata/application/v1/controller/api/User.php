<?php
namespace app\v1\controller\api;
use think\Controller;
use think\Request;

use app\v1\controller\main\User as UserC;

use tool\Format;


class User extends Controller{

	protected $request;
	protected $user;

	protected function _initialize(){
		parent::_initialize();
		$this->request = Request::instance();
		$this->user = $this->request->user;
	}

	/**
	 * 获取多个用户数据
	 * @return [type] [description]
	 */
	public function getUsers(){
		$data = $this->request->post();
		$uids = (isset($data['uids'])&&is_array($data['uids']))?$data['uids']:[];
		$userc = new UserC;
		$users = $userc->getUsers($uids);
		foreach ($users as $key => $value) {
			$users[$key] = $this->userOutFormat($value);
		}
		return ['code'=>200,'msg'=>'获取成功','data'=>$users];
	}

	/**
	 * 获取单个用户(通过uid)
	 * @return [type] [description]
	 */
	public function getUser(){
		$data = $this->request->post();
		if(!isset($data['uid'])||!$data['uid']){
			return getOut(9998);
		}
		$uid = $data['uid'];

		$userc = new UserC;
		$user = $userc->getUser($uid);
		if($user){
			$user = $this->userOutFormat($user);
			return ['code'=>200,'msg'=>'获取成功','data'=>$user];
		}else{
			return getOut(1001);
		}
	}

	/**
	 * 修改用户数据
	 * @return [type] [description]
	 */
	public function reviseUser(){
		$data = $this->request->post();
		if(!isset($data['userdata'])){
			return getOut(9998);
		}
		$data = $data['userdata'];
		$data = $this->userInformat($data);
		$userc = new UserC;
		$res = $userc->reviseUser($data);
		if(!$res){
			return getOut(2001);
		}else{
			$user = $userc->getUser($data['uid']);
			$user = $this->userOutFormat($user);
			return ['code'=>200,'msg'=>'修改成功','data'=>$user];
		}
	}

	/**
	 * 重置密码
	 * @return [type] [description]
	 */
	public function resetPass(){
		$data = $this->request->post();
		if(!isset($data['uid'])||!$data['uid']){
			return getOut(9998);
		}
		$uid = $data['uid'];
		$userc = new UserC;
		$res = $userc->resetPass($uid);
		if($res){
			return ['code'=>200,'msg'=>'重置密码成功'];
		}else{
			return getOut(2001);
		}
	}

	/**
	 * 删除用户
	 * @return [type] [description]
	 */
	public function deleteUser(){
		$data = $this->request->post();
		if(!isset($data['uid'])||!$data['uid']){
			return getOut(9998);
		}
		$uid = $data['uid'];
		$userc = new UserC;
		$res = $userc->deleteUser($uid);
		if($res){
			return ['code'=>200,'msg'=>'删除用户成功','data'=>$data['uid']];
		}else{
			return getOut(2001);
		}
	}

	/**
	 * 新增用户
	 */
	public function addUser(){
		$data = $this->request->post();
		if(!isset($data['userdata'])){
			getOut(9998);
		}
		$data = $data['userdata'];
		$data = $this->userInformat($data);
		$userc = new UserC;
		$res = $userc->addUser($data);
		if($res){
			return ['code'=>200,'msg'=>'新增用户成功','data'=>['uid'=>$res]];
		}else{
			return getOut(2001);
		}
	}

	/**
	 * 修改密码
	 * @return [type] [description]
	 */
	public function revisePass(){
		$data = $this->request->post();
		if(!isset($data['oldpass'])||!isset($data['newpass'])){
			return getOut(9998);
		}

		$oldpass = openssl_encrypt($data['oldpass'], config('srecret.en_method'), config('srecret.openssl_key'));
		if($oldpass !== $this->user['pass']){
			return getOut(1002);
		}
		$newpass = openssl_encrypt($data['newpass'], config('srecret.en_method'), config('srecret.openssl_key'));

		$userc = new UserC;
		$res = $userc->revisePass($this->user['uid'], $newpass);
		if($res){
			return ['code'=>200,'msg'=>'修改成功'];
		}else{
			return getOut(2001);
		}
	}

	/**
	 * 修改个人信息
	 * @return [type] [description]
	 */
	public function reviseSelf(){
		$data = $this->request->post();
		if(!isset($data['userdata'])){
			return getOut(9998);
		}
		$data = $data['userdata'];
		$data = $this->userInformat($data);
		$data['uid'] = $this->user['uid'];
		$userc = new UserC;
		$res = $userc->reviseUser($data);
		if(!$res){
			return getOut(2001);
		}else{
			$user = $userc->getUser($this->user['uid']);
			$user = $this->userOutFormat($user);
			return ['code'=>200,'msg'=>'修改成功','data'=>$user];
		}
	}

	/**
	 * 用户数据输出格式化
	 */
	protected function userOutFormat($user,$arr=['pass']){
		foreach ($arr as $key => $value) {
			unset($user[$value]);
		}
		$user['createtime'] = (int)$user['createtime'];
		$user['uid'] = (int)$user['uid'];
		$user['cols'] = arrayInt(unserialize($user['cols']));
		$user['headimg'] = Format::imgOutFormat($user['headimg']);
		$user['identity'] = (int)$user['identity'];
		$user['valid'] = (int)$user['valid'];
		return $user;
	}

	/**
	 * 用户数据输入格式化
	 * @param  [type] $data [description]
	 * @return [type]       [description]
	 */
	protected function userInformat($data){
		if(isset($data['cols'])&&is_array($data['cols'])){
			$data['cols'] = serialize($data['cols']);
		}

		if(isset($data['headimg'])){
			$data['headimg'] = imgInFormat($data['headimg']);
		}

		if(isset($data['uid'])){
			$data['uid'] = (int)$data['uid'];
		}

		if(isset($data['identity'])){
			$data['identity'] = (int)$data['identity'];
		}

		if(isset($data['email'])){
			$data['email'] = filter_var($data['email'], FILTER_VALIDATE_EMAIL);
		}

		if(isset($data['valid'])){
			$data['valid'] = (int)$data['valid'];
		}

		return $data;
	}
}