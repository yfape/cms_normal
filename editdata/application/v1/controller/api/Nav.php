<?php
namespace app\v1\controller\api;
use think\Controller;
use think\Request;
use think\Cache;
use think\Db;
use tool\Format;

class Nav extends Controller{

	protected $request;
	protected function _initialize(){
		parent::_initialize();
		$this->request = Request::instance();
	}

	public function saveNav(){
		$data = $this->request->post();
		if(!isset($data['content'])){
			return getOut(9998);
		}
		$data = serialize($data['content']);
		$res = Db::table('nav')->where('id',1)->update(['nav'=>$data]);
		if($res){
			Cache::set('nav',$data);
			return ['code'=>200,'msg'=>'保存成功','data'=>''];
		}else{
			return getOut(2001);
		}
	}

	public function getNav(){
		$nav = Cache::get('nav');
		if(!$nav){
			$data = Db::table('nav')->where('id',1)->find();
			$nav = $data['nav'];
			Cache::set('nav',$nav);
		}
		return ['code'=>200,'msg'=>'获取成功','data'=>unserialize($nav)];
	}

	public function refleshNav(){
		$data = Db::table('nav')->where('id',1)->find();
		$nav = $data['nav'];
		Cache::set('nav',$nav);
		return ['code'=>200,'msg'=>'获取成功','data'=>unserialize($nav)];
	}
	
}