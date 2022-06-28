<?php
namespace app\v1\controller\api;
use think\Controller;
use think\Request;
use think\Cache;
use think\Db;

class Mod extends Controller{

	protected $request;
	protected $user;

	protected function _initialize(){
		parent::_initialize();
		$this->request = Request::instance();
		$this->user = $this->request->user;
	}

	public function getMods(){
		$data = $this->request->post();
		if(!(isset($data['mids']))){
			return getOut(9998);
		}

		$res = Db::table('mod')->where('mid','in',$data['mids'])->select();
		$resarr = [];
		foreach ($res as $key => $value) {
			$resarr['m'.$value['mid']] = unserialize($value['data']);
		}
		if($resarr){
			return ['code'=>200,'msg'=>'获取成功','data'=>$resarr];
		}else{
			return getOut(2003);
		}
	}

	public function saveMod(){
		$data = $this->request->post();
		if(!(isset($data['mid'])&&isset($data['data']))){
			return getOut(9998);
		}

		$res = Db::table('mod')->where('mid',$data['mid'])->update(['data'=>serialize($data['data'])]);
		if($res){
			$this->cacheList();
			return ['code'=>200,'msg'=>'保存成功','data'=>$res];
		}else{
			return getOut(2001);
		}
	}

	public function cacheList(){
		$data = Db::table('mod')->where('mid','in',[19,20])->select();
		$arr = [];
		foreach ($data as $key => $value) {
			$arr['m'.$value['mid']] = unserialize($value['data']);
		}
		Cache::set('list',serialize($arr));
	}
}