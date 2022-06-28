<?php
namespace app\v1\controller\api;
use think\Controller;
use think\Request;
use think\Cache;
use think\Db;

class Magazine extends Controller{

	protected $request;
	protected function _initialize(){
		parent::_initialize();
		$this->request = Request::instance();
	}

	public function getMagazines(){
		$magazines = Db::table('magazine')->field('zid,title,createdate,img,valid')->order('zid','desc')->select();

		foreach ($magazines as $key => $value) {
			$magazines[$key]['img'] = imgOutFormat($value['img']);
		}

		return ['code'=>200,'msg'=>'获取成功','data'=>['magazines'=>$magazines]];
	}

	public function getMagazine(){
		$data = $this->request->post();
		
		if(!isset($data['zid'])){
			return getOut(9998);
		}
		$zid = (int)$data['zid'];
		$magazine = Db::table('magazine')->where('zid',(int)$zid)->find();
		if(isset($magazine['zid'])){
			$magazine['img'] = imgOutFormat($magazine['img']);
			$magazine['content'] = unserialize($magazine['content']);
			return ['code'=>200,'data'=>['magazine'=>$magazine]];
		}else{
			return getOut(2003);
		}
	}

	public function saveMagazine(){
		$data = $this->request->post();
		
		if(!isset($data['magazine'])){
			return getOut(9998);
		}

		$magazine = $data['magazine'];
		$magazine['img'] = imgInFormat($magazine['img']);
		$magazine['content'] = serialize($magazine['content']);

		$res = Db::table('magazine')->where('zid',$magazine['zid'])->update([
			'content'=>$magazine['content'],
			'title'=>$magazine['title'],
			'createdate'=>time(),
			'img'=>$magazine['img']
		]);
		$this->reRedis();
		return $res?['code'=>200,'msg'=>'保存成功','data'=>$res]:getOut(2002);
	}
	
	public function addMagazine(){
		$data = $this->request->post();
		
		if(!isset($data['magazine'])){
			return getOut(9998);
		}

		$magazine = $data['magazine'];
		$magazine['img'] = imgInFormat($magazine['img']);
		$magazine['content'] = serialize($magazine['content']);
		$magazine['valid'] = (int)$magazine['valid'];

		$res = Db::table('magazine')->insert([
			'content'=>$magazine['content'],
			'title'=>$magazine['title'],
			'createdate'=>time(),
			'img'=>$magazine['img'],
			'valid'=>$magazine['valid'],
		]);
		$this->reRedis();
		return $res?['code'=>200,'msg'=>'新增成功','data'=>$res]:getOut(2002);
	}

	public function deleteMagazine(){
		$data = $this->request->post();

		if(!isset($data['zid'])){
			return getOut(9998);
		}

		$zid = (int)$data['zid'];
		$res = Db::table('magazine')->where('zid',$zid)->delete();
		$this->reRedis();
		return $res?['code'=>200,'msg'=>'保存成功','data'=>$res]:getOut(2001);
	}

	public function changeValid(){
		$data = $this->request->post();
		if(!(isset($data['zid'])&&isset($data['valid']))){
			return getOut(9998);
		}	

		$zid = (int)$data['zid'];
		$valid = (int)$data['valid'];

		$res = Db::table('magazine')->where('zid',$zid)->update(['valid'=>$valid]);
		$this->reRedis();
		return $res?['code'=>200,'msg'=>'状态更新成功','data'=>$res]:getOut(2001);
	}

	public function reRedis(){
		$magazines = Db::table('magazine')->field('zid,title,createdate,img')->where('valid',1)->order('zid','desc')->select();

		foreach ($magazines as $key => $value) {
			$magazines[$key]['img'] = imgOutFormat($value['img']);
		}
		Cache::set('magazines',serialize($magazines));
	}


}