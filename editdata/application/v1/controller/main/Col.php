<?php
namespace app\v1\controller\main;
use think\Controller;
use think\Db;
use think\Cache;

use app\v1\model\Col as ColModel;


class Col extends Controller{

	protected function _initialize(){
		parent::_initialize();
	}

	/**
	 * db0 cols
	 * @return [type] [description]
	 */
	public function reRedis(){
		$cols = Db::table('col')->where('valid',1)->order(['allsort'=>'asc','sort'=>'asc','sub'=>'asc','cid'=>'asc'])->select();
		$cols = $this->getFormateCols($cols);
		Cache::set('showcols',serialize($cols));

		$basecols = Db::table('col')->where('valid','<>',-1)->order(['allsort'=>'asc','sort'=>'asc','sub'=>'asc','cid'=>'asc'])->select();
		$basecols = $this->getFormateCols($basecols);
		Cache::set('webcols',serialize($basecols));

		$allcols = Db::table('col')->order(['allsort'=>'asc','sort'=>'asc','sub'=>'asc','cid'=>'asc'])->select();
		Cache::set('cols',serialize($allcols));
		return true;
	}

	/**
	 * 获取单个栏目
	 * @param  [type] $arg [description]
	 * @return [type]      [description]
	 */
	public function getCol($arg){
		if((int)$arg === 0){
			$col = Db::table('col')->where('col',$arg)->find();
		}else{
			$col = Db::table('col')->where('cid',$arg)->find();
		}
		return $col;
	}

	/**
	 * 获取多个栏目
	 * @param  array  $cids [description]
	 * @return [type]       [description]
	 */
	public function getCols($cids = []){
		$cols = [];
		if(!$cids){
			$cols = Db::table('col')->order(['group'=>'asc','sort'=>'asc','sub'=>'asc','cid'=>'asc'])->select();
		}else{
			$cols = Db::table('col')->where('cid','in',$cids)->order(['group'=>'asc','sort'=>'asc','sub'=>'asc','cid'=>'asc'])->select();
		}
		return $cols;
	}

	/**
	 * 添加栏目
	 * @param [type] $data [description]
	 */
	public function addCol($data){
		$data = $this->dataFormat($data);
		if(!$data){
			return false;
		}
		$col = new ColModel;
		$col->data([
			'col'=>$data['col'],
			'sub'=>$data['sub'],
			'group'=>$data['group']
		]);
		$cid = $col->save();
		if($cid){
			$this->reRedis();
		}
		return $cid?$cid:false;
	}

	/**
	 * 修改栏目
	 * @param  [type] $data [description]
	 * @return [type]       [description]
	 */
	public function reviseCol($data){
		$data = $this->dataFormat($data);
		if(!$data){
			return false;
		}

		$col = ColModel::get($data['cid']);
		$col->data([
			'col'=>$data['col'],
			'sub'=>$data['sub'],
			'group'=>$data['group']
		]);
		if($col->save()){
			$this->reRedis();
		}
		return true;
	}

	/**
	 * 删除栏目
	 * @param  [type] $cid [description]
	 * @return [type]      [description]
	 */
	public function deleteCol($cid){
		if(!$cid){
			return false;
		}
		$col = ColModel::get($cid);
		$col->delete();
		$this->reRedis();
		return true;
	}


	/**
	 * 验证数据完整性
	 * @return boolean [description]
	 */
	protected function dataFormat($data){
		if(!isset($data['cid'])||!isset($data['col'])){
			return false;
		}
		if(!isset($data['sub'])){
			$data['sub'] = 0;
		}
		if(!isset($data['group'])){
			$data['group'] = $data['cid'];
		}
		return $data;
	}

	/**
	 * 获取所有栏目的格式化数组
	 * @return [arr] [description]
	 */
	protected function getFormateCols($cols){
		$rescols = [];
		foreach ($cols as $key => $value) {
			if((int)$value['sub']===0){
				$rescols[$value['allsort']] = ['cid'=>$value['cid'],'col'=>$value['col'],'sort'=>$value['sort'],'group'=>$value['group'],'sub'=>$value['sub'],'allsort'=>$value['allsort'],'valid'=>$value['valid'],'children'=>[]];
			}
		}
		
		foreach ($cols as $key => $value) {
			if((int)$value['sub']===1){
				array_push($rescols[$value['allsort']]['children'],$value);
			}
		}
		asort($rescols);
		// return array_values($rescols);
		return $rescols;
	}
}