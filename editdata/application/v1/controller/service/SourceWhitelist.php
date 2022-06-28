<?php
namespace app\v1\controller\service;
use think\Controller;
use think\Cache;
use think\Db;

use Redis;


class SourceWhitelist extends Controller{

	protected $redis;

	protected function _initialize(){
		$this->redis = new Redis;
		$connectarr = config('cache.redis');
		$this->redis->connect( $connectarr['host'], $connectarr['port']);
		$this->redis->select(1);
	}

	/**
	 * 获取全部白名单列表
	 * @return [type] [description]
	 */
	public function getSourceWhitelist(){
		$wl = $this->redis->sMembers('source_wl');
		if(!$wl){
			$wl = $this->reRedis();
		}
		return $wl;
	}

	/**
	 * 刷新来源白名单
	 * @return [type] [description]
	 */
	public function reRedis(){
		$wl = Db::table('source_wl')->field('source')->select();
		foreach ($wl as $key => $value) {
			$this->redis->sAdd('source_wl',$value['source']);
		}
		return array_column($wl, 'source');
	}

}