<?php
namespace app\web\controller;
use think\facade\Cache;
use think\facade\Db;
use think\facade\Request;


class Nav{

	protected function _initialize(){}

	public function nav(){
		$nav = Cache::get('nav');
		if(!$nav){
			$data = Db::table('nav')->where('id',1)->find();
			$nav = $data['nav'];
			Cache::set('nav',$nav);
		}
		return suc(json_decode($nav));
	}
}