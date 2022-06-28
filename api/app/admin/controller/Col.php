<?php
namespace app\admin\controller;

use think\facade\Db;
use think\facade\Request;
use app\admin\model\Col as ColModel;

class Col {

	/**
	 * 获取全部栏目
	 * @return [type] [description]
	 */
	public function getAllCols(){
		
		return ColModel::select();
	}


	/**
	 * 获取单个栏目
	 * @param  string $mode [description]
	 * @param  [type] $arg  [description]
	 * @return [type]       [description]
	 */
	public function getCol($mode='cid', $arg){

		return ColModel::where($mode,$arg)->find();
	}

	/**
	 * 修改栏目顺序
	 * @return [type] [description]
	 */
	public function changeColSort(){
		$cid = Request::post('cid/d');
		$sort = Request::post('sort/d');

		$cm = ColModel::find($cid);
		if(!$cm){
			return err('不存在栏目');
		}

		$old = ColModel::where('group',$cm->group)->where('sort', $sort)->find();
		if(!$old){
			return err('数据错误更新失败');
		}

		$old->sort = $cm->sort;
		$old->save();
		$cm->sort = $sort;
		$res = $cm->save();
		return $res ? suc('', '顺序修改成功') : err('顺序修改失败');
	}

	/**
	 * 修改大栏目顺序
	 * @return [type] [description]
	 */
	public function changeColAllSort(){
		$cid = Request::post('cid/d');
		$allsort = Request::post('allsort/d');

		$cm = ColModel::find($cid);
		if(!$cm){
			return err('不存在栏目');
		}

		$res1 = Db::table('col')->where('allsort',$allsort)->update(['allsort'=>$cm->allsort]);
		if(!$res1){
			return err('顺序修改失败');
		}
		$res = Db::table('col')->where('group',$cid)->update(['allsort'=>$allsort]);
		return $res ? suc('', '顺序修改成功') : err('顺序修改失败');
	}

	/**
	 * 禁用启用栏目
	 * @return [type] [description]
	 */
	public function changeValid(){
		$cid = Request::post('cid/d');
		$valid = Request::post('valid/d');
		$cm = ColModel::find($cid);
		if(!$cm){
			return err('不存在栏目');
		}

		$res = false;
		if($cm->sub === 0){
			$res = ColModel::where('group', $cid)->update(['valid'=>$valid]);
		}else{
			$res = ColModel::where('cid', $cid)->update(['valid'=>$valid]);
		}
		return $res ? suc('', '状态更新成功') : err('状态更新失败');
	}

	/**
	 * 新增栏目
	 */
	public function addCol(){
		$cm = new ColModel;
		$data = Request::post(['sub', 'col', 'valid', 'group']);
		$res = $cm->save($data);
		if(!$res){
			return err('新增栏目失败');
		}
		return suc($cm->cid, '新增栏目成功');
	}
}