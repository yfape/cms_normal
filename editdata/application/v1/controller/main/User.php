<?php
namespace app\v1\controller\main;
use think\Controller;
use think\Cache;
use think\Db;

use app\v1\model\User as UserModel;

use tool\RedisHash;


class User extends Controller{

	protected $hash;

	protected function _initialize(){
		$this->hash = RedisHash::instance();
	}

 	/**
 	 * 刷新user redis
 	 * @return [type] [description]
 	 */
 	public function reRedis(){
 		$users = Db::table('user')->select();
 		foreach ($users as $key => $value) {
 			$this->hash->setTable('u_user')->setKey($value['uid'])->set($value);
 			$this->hash->setTable('u_uid')->setKey($value['user'])->set(['uid'=>$value['uid']]);
 		}
 		return true;
 	}

	/**
	 * 获取单个用户 uid或user均可  redis
	 * @param  [type] $uid [description]
	 * @return [type]      [description]
	 */
	public function getUser($user){
		if((int)$user === 0){
			$user = $this->getUidByUser($user);
		}
		return $this->hash->setTable('u_user')->setKey($user)->get();
	}

	/**
	 * 通过user获取uid
	 * @param  [type] $user [description]
	 * @return [type]       [description]
	 */
	public function getUidByUser($user){
		return $this->hash->setTable('u_uid')->setKey($user)->get('uid');
	}

	/**
	 * 获取多个用户,uidarr空则为全部用户  db
	 * @param  array  $uidarr [description]
	 * @return [type]         [description]
	 */
	public function getUsers($uidarr = []){
		$users = [];
		if(count($uidarr) === 0){
			$users = Db::table('user')->order('uid','asc')->select();
		}else{
			$users = Db::table('user')->where('uid','in',$uidarr)->order('uid','asc')->select();
		}
		return $users;
	}

	/**
	 * 修改用户数据
	 * @param  [type] $data [description]
	 * @return [type]       [description]
	 */
	public function reviseUser($data){
		$uid = 0;
		if(isset($data['uid'])){
			$uid = $data['uid'];
			unset($data['uid']);
		}

		$user = UserModel::get($uid);
		$res = $user->save($data);
		$res&&$this->reRedis();
		return $res;
	}

	/**
	 * 修改密码
	 * @param  [type] $uid  [description]
	 * @param  [type] $pass [description]
	 * @return [type]       [description]
	 */
	public function revisePass($uid,$pass){
		$user = UserModel::get($uid);
		$user->pass = $pass;
		$res = $user->save();
		$this->hash->setTable('u_token')->setKey($uid)->set(['token'=>'']);
		$res&&$this->reRedis();
		return $res;
	}
	
	/**
	 * 重置密码
	 * @param  [type] $uid [description]
	 * @return [type]      [description]
	 */
	public function resetPass($uid){
		$user = UserModel::get($uid);
		$user->pass = openssl_encrypt('123456', config('srecret.en_method'), config('srecret.openssl_key'));
		$res = $user->save();
		$this->hash->setTable('u_token')->setKey($uid)->set(['token'=>'']);
		$res&&$this->reRedis();
		return $res;
	}

	/**
	 * 删除用户
	 * @param  [type] $uid [description]
	 * @return [type]      [description]
	 */
	public function deleteUser($uid){
		$user = UserModel::get($uid);

		$this->hash->setTable('u_user')->deleteByKey($uid);
		$this->hash->setTable('u_uid')->deleteByKey($user->user);
		$this->hash->setTable('u_token')->deleteByKey($uid);

		$userstr = serialize($user);
		$res = Db::table('user_deleted')->insert([
			'uid' => $user->uid,
			'data' => $userstr,
		]);
		if(!$res){
			return false;
		}
		
		$user->delete();
		return true;
	}

	/**
	 * 新增用户
	 * @param [type] $data [description]
	 */
	public function addUser($data){
		$user = new UserModel;
		$data = [
			'user'=>$data['user'],
			'pass'=>openssl_encrypt('123456', config('srecret.en_method'), config('srecret.openssl_key')),
			'nickname'=>$data['nickname']?$data['nickname']:'暂无名称',
			'headimg'=>$data['headimg']?$data['headimg']:'headimg/defaultheadimg.gif',
			'identity'=>$data['identity']?$data['identity']:4,
			'cols'=>$data['cols'],
			'email'=>$data['email'],
			'valid'=>$data['valid'],
			'createtime'=>time()
		];
		$res = $user->save($data);
		$res&&$this->reRedis();
		return $res;
	}

	/**
	 * 通过姓名查uid
	 * @param  [type] $nickname [description]
	 * @return [type]           [description]
	 */
	public function getUidByNickname($nickname){
		$res = Db::table('user')->where('nickname',$nickname)->field('uid')->find();
		if(!$res){
			return false;
		}
		return $res['uid'];
	}
}