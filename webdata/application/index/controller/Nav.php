<?php
namespace app\index\controller;
use think\Controller;
use think\Cache;
use think\Db;
use think\Request;
use tool\RedisHash;

class Nav extends Controller{

	protected function _initialize(){}

	public function getNav(){
		$isuser = Request::instance()->get('isuser');
		if(!$isuser){
			$this->incUser();
		}

		$nav = Cache::get('nav');
		if(!$nav){
			$data = Db::table('nav')->where('id',1)->find();
			$nav = $data['nav'];
			Cache::set('nav',$nav);
		}
		return ['code'=>200,'msg'=>'','data'=>unserialize($nav)];
	}

	public function incUser(){
		date_default_timezone_set('PRC');

		$hash = RedisHash::instance();
		$m = $hash->setTable('member')->setKey('1')->get();

		if(!$m){
			$num = Db::table('member')->count('num');
			$hash->setTable('member')->setKey('1')->set([
				'num'=>$num+1,
				'date'=>date('Y-m-d'),
				'today'=>1
			]);
		}else{
			if(date('Y-m-d') != $m['date']){
				$res = Db::table('member')->where('indate',$m['date'])->find();
				if($res){
					Db::table('member')->where('indate',$m['date'])->update(['num'=>$m['today']]);
				}else{
					Db::table('member')->insert(['indate'=>$m['date'],'num'=>$m['today']]);
				}
				$hash->setTable('member')->setKey('1')->set([
					'num'=>$m['num']+1,
					'date'=>date('Y-m-d'),
					'today'=>1
				]);
			}else{
				$hash->setTable('member')->setKey('1')->set([
					'num'=>$m['num']+1,
					'today'=>$m['today']+1,
				]);
			}
		}
	}
}