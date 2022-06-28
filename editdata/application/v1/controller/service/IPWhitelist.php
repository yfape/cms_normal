<?php
namespace app\v1\controller\service;
use think\Controller;
use think\Cache;
use think\Db;

use Redis;


class IPWhitelist extends Controller{

	protected $redis;

	protected function _initialize(){
		$this->redis = new Redis;
		$connectarr = config('cache.redis');
		$this->redis->connect( $connectarr['host'], $connectarr['port']);
		$this->redis->select(1);
	}

	/**
	 * 获取IP白名单列表
	 * @return [type] [description]
	 */
	public function getIPWhitelist(){
		$ips = $this->redis->sMembers('ip_wl');
		if(!$ips){
			$ips = $this->reRedis();
		}
		return $ips;
	}

	/**
	 * 刷新ip白名单redis
	 * @return [arr] [ips]
	 */
	public function reRedis(){
		$ips = Db::table('ip_wl')->field('ip')->select();
		foreach ($ips as $key => $value) {
			$this->redis->sAdd('ip_wl',$value['ip']);
		}
		return array_column($ips,'ip');
	}

	/**
	 * 判断指定ip是否在白名单内
	 * @param  [type]  $ip [description]
	 * @return boolean     [description]
	 */
	public function isMember($ip){
		return $this->redis->sismember('ip_wl',$ip);
	}

	/**
	 * 添加新的ip至白名单
	 * @param [type] $ip [description]
	 */
	public function addIP($ip){
		$res = Db::table('ip_wl')->insert(['ip'=>$ip]);
		$this->refleshRedis();
		return $res?true:false;
	}

	/**
	 * 删除ip
	 * @param  [type] $ip [description]
	 * @return [type]     [description]
	 */
	public function deleteIP($ip){
		$res = Db::table('ip_wl')->delete('ip',$ip);
		$this->refleshRedis();
		return $res?true:false;
	}
}