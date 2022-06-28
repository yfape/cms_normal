<?php
namespace app\v1\controller\api;
use think\Controller;
use think\Request;
use think\Cache;
use think\Db;

class Topic extends Controller{

	protected $request;
	protected function _initialize(){
		parent::_initialize();
		$this->request = Request::instance();
	}

	public function getTopics(){
		$topics = Db::table('topic')->field('tid,title,createdate,img,valid')->order('tid','desc')->select();

		foreach ($topics as $key => $value) {
			$topics[$key]['img'] = imgOutFormat($value['img']);
		}
		return ['code'=>200,'msg'=>'获取成功','data'=>['topics'=>$topics]];
	}

	public function getTopic(){
		$data = $this->request->post();
		
		if(!isset($data['tid'])){
			return getOut(9998);
		}
		$tid = (int)$data['tid'];
		$topic = Db::table('topic')->where('tid',(int)$tid)->find();
		if(isset($topic['tid'])){
			$topic['img'] = imgOutFormat($topic['img']);
			$topic['backimg'] = imgOutFormat($topic['backimg']);
			$topic['content'] = unserialize($topic['content']);
			return ['code'=>200,'data'=>['topic'=>$topic]];
		}else{
			return getOut(2003);
		}
	}

	public function saveTopic(){
		$data = $this->request->post();
		
		if(!isset($data['topic'])){
			return getOut(9998);
		}

		$topic = $data['topic'];
		$topic['img'] = isset($topic['img'])?imgInFormat($topic['img']):'';
		$topic['backimg'] = isset($topic['backimg'])?imgInFormat($topic['backimg']):'';
		$topic['content'] = isset($topic['content'])?serialize($topic['content']):'';
		$topic['valid'] = isset($topic['valid'])?(int)$topic['valid']:0;
		$topic['isheader'] = isset($topic['isheader'])?(int)$topic['isheader']:0;
		$topic['isfooter'] = isset($topic['isfooter'])?(int)$topic['isfooter']:0;
		$topic['title'] = isset($topic['title'])?$topic['title']:'';
// echo strlen($topic['content']);exit();
		if(!$topic['title']){
			return getOut(9998);
		}

		$res = Db::table('topic')->where('tid',$topic['tid'])->update([
			'content'=>$topic['content'],
			'title'=>$topic['title'],
			'createdate'=>time(),
			'img'=>$topic['img'],
			'valid'=>$topic['valid'],
			'backimg'=>$topic['backimg'],
			'isheader'=>$topic['isheader'],
			'isfooter'=>$topic['isfooter']
		]);
		$res&&$this->reRedis();
		return $res?['code'=>200,'msg'=>'保存成功','data'=>$res]:getOut(2002);
	}
	
	public function addTopic(){
		$data = $this->request->post();
		
		if(!isset($data['topic'])){
			return getOut(9998);
		}

		$topic = $data['topic'];
		$topic['img'] = isset($topic['img'])?imgInFormat($topic['img']):'';
		$topic['backimg'] = isset($topic['backimg'])?imgInFormat($topic['backimg']):'';
		$topic['content'] = isset($topic['content'])?serialize($topic['content']):'';
		$topic['valid'] = isset($topic['valid'])?(int)$topic['valid']:0;
		$topic['isheader'] = isset($topic['isheader'])?(int)$topic['isheader']:0;
		$topic['isfooter'] = isset($topic['isfooter'])?(int)$topic['isfooter']:0;
		$topic['title'] = isset($topic['title'])?$topic['title']:'';

		$res = Db::table('topic')->insert([
			'content'=>$topic['content'],
			'title'=>$topic['title'],
			'createdate'=>time(),
			'img'=>$topic['img'],
			'valid'=>$topic['valid'],
			'backimg'=>$topic['backimg'],
			'isheader'=>$topic['isheader'],
			'isfooter'=>$topic['isfooter']
		]);
		$this->reRedis();
		return $res?['code'=>200,'msg'=>'新增成功','data'=>$res]:getOut(2002);
	}

	public function deleteTopic(){
		$data = $this->request->post();

		if(!isset($data['tid'])){
			return getOut(9998);
		}

		$tid = (int)$data['tid'];
		$res = Db::table('topic')->where('tid',$tid)->delete();
		$this->reRedis();
		return $res?['code'=>200,'msg'=>'保存成功','data'=>$res]:getOut(2001);
	}

	public function reRedis(){
		$topics = Db::table('topic')->field('tid,title,createdate,img')->where('valid',1)->order('createdate','desc')->select();

		foreach ($topics as $key => $value) {
			$topics[$key]['img'] = imgOutFormat($value['img']);
		}
		Cache::set('topics',serialize($topics));
	}

}