<?php
namespace app\v1\controller\api;
use think\Controller;
use think\Request;
use think\Db;
use app\v1\controller\main\Col as ColC;
use app\v1\model\Col as ColModel;

class Col extends Controller{

	protected $user;
	protected $request;

	protected function _initialize(){
		parent::_initialize();
		$this->request = Request::instance();
		$this->user = $this->request->user;
	}


	public function changeValid(){
		$data = $this->request->post();
		if(!(isset($data['cid'])&&isset($data['valid']))){
			return getOut(9998);
		}
		$cm = ColModel::get($data['cid']);
		$sub = $cm->sub;
		if($sub === 0){
			Db::table('col')->where('group',$cm->group)->update(['valid'=>$data['valid']]);
		}else if($sub === 1){
			$cm->valid = $data['valid'];
			$cm->save();
			if((int)$data['valid'] === 1){
				Db::table('col')->where('cid',$cm->group)->update(['valid'=>$data['valid']]);
			}
		}
		$colc = new ColC;
		$colc->reRedis();
		return ['code'=>200,'msg'=>'状态更新成功','data'=>['cid'=>$data['cid']]];
	}

	/**
	 * 增加Col
	 */
	public function addCol(){
		$data = $this->request->post();
		if(!(isset($data['col'])&&isset($data['sub']))){
			return getOut(9998);
		}

		$colm = new ColModel;
		if((int)$data['sub']===0){
			$maxallsort = $colm->max('allsort');
			$colm->sort = 0;
			$colm->allsort = $maxallsort+1;
		}else if((int)$data['sub']===1){
			if(!isset($data['group'])){
				return getOut(9998);
			}
			$parent = ColModel::get($data['group']);
			$allsort = $parent->allsort;
			$sort = $colm->where('group',$data['group'])->max('sort');
			$colm->allsort = $allsort;
			$colm->sort = $sort+1;
			$colm->group = $data['group'];
		}
		$colm->sub = (int)$data['sub'];
		$colm->col = $data['col'];
		$colm->valid = $data['valid'];
		$colm->save();
		$cid = $colm->cid;
		if((int)$data['sub']===0){
			$colm->group = $cid;
			$colm->save();
		}
		$colc = new ColC;
		$colc->reRedis();
		return ['code'=>200,'msg'=>'新增栏目成功','data'=>['cid'=>$cid]];
	}

	/**
	 * 获取单个col
	 * @return [type] [description]
	 */
	public function getCol(){
		$cid = $this->request->post('cid');
		$colc = new ColC;
		$col = $colc->getCol((int)$cid);
		$col = $col?$col:[];
		return ['code' =>200,'data' =>['col' => $col]];
	}

	/**
	 * 获取多个col
	 * @return [type] [description]
	 */
	public function getCols(){
		$cids = $this->request->post('cids');
		$cids = arrayFormat($cids);
		$colc = new ColC;
		$cols = $colc->getCols($cids);
		if(!$cols){
			return getOut(2003);
		}
		return ['code' =>200,'data' =>['cols' => $cols]];
	}

	public function changeColAllSort(){
		$data = $this->request->post();
		if(!(isset($data['cid'])&&isset($data['allsort']))){
			return getOut(9998);
		}
		$cid = (int)$data['cid'];
		$allsort = (int)$data['allsort'];

		$cm = ColModel::get($cid);
		if((int)$cm->sub !== 0){
			return getOut(9998);
		}
		Db::table('col')->where('allsort',$allsort)->update(['allsort'=>$cm->allsort]);
		Db::table('col')->where('group',$cid)->update(['allsort'=>$allsort]);
		$colc = new ColC;
		$colc->reRedis();
		return ['code'=>200,'msg'=>'','data'=>''];
	}

	public function changeColSort(){
		$data = $this->request->post();
		if(!(isset($data['cid'])&&isset($data['sort']))){
			return getOut(9998);
		}
		$cid = (int)$data['cid'];
		$sort = (int)$data['sort'];

		$cm = ColModel::get($cid);
		if(!$cm){
			return getOut(3001);
		}

		$old = ColModel::get(['group'=>$cm->group,'sort'=>$sort]);
		if($old){
			$old->sort = $cm->sort;
			$old->save();
		}
		$cm->sort = $sort;
		$res = $cm->save();

		if($res){
			$colc = new ColC;
			$colc->reRedis();
			return ['code'=>200,'msg'=>'栏目修改成功','data'=>[]];
		}else{
			return getOut(2001);
		}
	}

}