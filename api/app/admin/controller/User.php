<?php 
namespace app\admin\controller;

use think\facade\Request;
use app\admin\model\User as UserModel;
 
class User{

	/**
	 * 获取全部用户api
	 * @return [type] [description]
	 */
	public function getUsers(){
		$users = UserModel::select()->toArray();
		foreach ($users as $key => $value) {
			unset($users['pass']);
		}
		return suc($users);
	}

	public function api_getUser(){

	}

	/**
	 * 获取自身数据
	 * @return [type] [description]
	 */
	public function getSelf(){
		$user = Request::middleware('user');
		unset($user['pass']);
		return suc($user);
	}

	/**
	 * 获取单个用户 common
	 * @param  string $mode [description]
	 * @param  [type] $arg  [description]
	 * @return [type]       [description]
	 */
	public function getUser($mode = 'uid', $arg , $api=true){
		$user = app('rhash')->setTable('u_'.$mode)->setKey($arg)->get();
		if(!$user){
			$user = UserModel::where($mode, $arg)->find();
			if(!$user){
				return false;
			}else{
				UserModel::reRedis();
			}
		}else{
			$user['uid'] = (int)$user['uid'];
			$user['identity'] = (int)$user['identity'];
			$user['valid'] = (int)$user['valid'];
			$user['createtime'] = (int)$user['createtime'];
			$user['cols'] = explode(',', $user['cols']);
			foreach ($user['cols'] as $key => $value) {
				$user['cols'][$key] = (int)$value;
			}
		}

		return $api ? suc($user) : $user;
	}

	/**
	 * 添加用户
	 */
	public function addUser(){
		$user = new UserModel;
		$data = Request::post(['uid', 'user', 'nickname', 'email', 'identity', 'cols', 'valid', 'headimg']);
		$res = $user->save($data);
		return $res ? suc($user->uid, '新增用户成功') : err('新增用户失败');
	}

	/**
	 * 删除用户
	 * @return [type] [description]
	 */
	public function deleteUser(){
		$uid = Request::post('uid/d');
		$res = UserModel::destroy($uid);
		if($res){
			app('rhash')->setTable('u_token')->deleteByKey($uid);
			app('rhash')->setTable('u_forbid')->deleteByKey($uid);
			app('rhash')->setTable('u_errnum')->deleteByKey($uid);
			return suc('', '删除用户成功');
		}else{
			return err('删除用户失败');
		}
	}


	/**
	 * 修改自身密码 api
	 * @param  [type] $uid  [description]
	 * @param  [type] $pass [description]
	 * @return [type]       [description]
	 */
	public function revisePass(){
		$data = Request::post(['oldpass','newpass']);
		if(!($data['oldpass'] && $data['newpass'])){
			return err('密码不能为空');
		}

		$user = Request::middleware('user');
		$oldpass = openssl_encrypt($data['oldpass'], 'AES-256-ECB', config('admin.loginsalt'));
		if($oldpass !== $user['pass']){
			return err('旧密码不正确');
		}
		$newpass = openssl_encrypt($data['newpass'], 'AES-256-ECB', config('admin.loginsalt'));

		$userm = UserModel::find($user['uid']);
		if(!$userm){
			return err('不存在用户');
		}
		$userm->pass = $newpass;
		$res = $userm->save();
		$res && $this->exitUser($user['uid']);
		return $res ? suc('','密码修改成功') : err('密码修改失败');
	}

	/**
	 * 修改用户数据
	 * @return [type] [description]
	 */
	public function reviseUser(){
		$uid = Request::post('uid/d');
		$valid = Request::post('valid/d');
		$user = UserModel::find($uid);
		$data = Request::post(['user', 'nickname', 'email', 'identity', 'cols', 'valid']);
		$res = $user->save($data);
		!$valid && $this->exitUser($uid);
		return $res ? suc('','修改成功') : err('修改失败');
	}

	/**
	 * 修改自身数据
	 * @return [type] [description]
	 */
	public function reviseSelf(){
		$data = Request::post(['headimg','nickname','email']);
		$user = Request::middleware('user');
		$userm = UserModel::find($user['uid']);
		$res = $userm->save([
			'headimg' => $data['headimg'],
			'nickname' => $data['nickname'],
			'email' => $data['email']
		]);
		$userm = $userm->toArray();
		unset($userm['pass']);
		return $res ? suc($userm,'修改成功') : err('修改失败');
	}

	/**
	 * 重置密码 api
	 * @return [type] [description]
	 */
	public function resetPass(){
		$uid = Request::post('uid/d');
		$user = UserModel::find($uid);
		$user->pass = openssl_encrypt('123456', 'AES-256-ECB', config('admin.loginsalt'));
		$res = $user->save();
		$res && $this->exitUser($uid);
		return $res ? suc('', '重置成功') : err('重置失败');
	}

	/**
	 * 退出用户
	 * @param  [type] $uid [description]
	 * @return [type]      [description]
	 */
	protected function exitUser($uid){

		app('rhash')->setTable('u_token')->deleteByKey($uid);
	}
}