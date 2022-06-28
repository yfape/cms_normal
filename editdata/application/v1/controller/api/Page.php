<?php
namespace app\v1\controller\api;
use think\Controller;
use think\Request;
use think\Cache;
use think\Db;
use tool\Format;
use app\v1\model\Mod;

class Page extends Controller{

	protected $request;
	protected function _initialize(){
		parent::_initialize();
		$this->request = Request::instance();
	}

	public function saveHome(){
		$data = $this->request->post();
		if(!isset($data['content'])){
			return getOut(9998);
		}
		$content = $data['content'];
		$keys = array_keys($content);

		$arr = [];
		foreach ($keys as $k => $v) {
			array_push($arr, ['mid'=>(int)substr($v,1),'data'=>serialize($content[$v])]);
		}
		$mode = new Mod;
		$res = $mode->saveAll($arr);
		
		$cache = serialize($content);
		Cache::set('home',$cache);

		return ['code'=>200,'msg'=>'保存成功','data'=>[]];
		
	}

}