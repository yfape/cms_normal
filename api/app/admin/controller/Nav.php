<?php
namespace app\admin\controller;
use think\facade\Request;
use think\facade\Cache;
use app\admin\model\Nav as NavModel;

class Nav{

	public function nav(){
		$nav = Cache::get('nav');
		if(!$nav){
			$nav = NavModel::find(1);
			$nav = $nav['nav'];
			Cache::set('nav', json_encode($nav));
		}else{
			$nav = json_decode($nav);
		}
		return suc($nav);
	}

	public function saveNav(){
		$nav = Request::post('nav');
		$res = NavModel::update(['nav'=>$nav], ['id'=>1]);
		if($res){
			$this->reRedis();
			return suc('','保存导航成功');
		}else{
			return err('保存失败');
		}
	}

	public function reRedis(){
		$nav = NavModel::find(1);
		Cache::set('nav', json_encode($nav['nav']));
		return $nav;
	}

}