<?php
namespace app\admin\controller;

use think\facade\Request;
use app\admin\model\Magazine as MagaModel;

class Magazine{

	public function magazine(){
		$zid = Request::post('zid/d');
		$res = MagaModel::find($zid);
		return suc($res);
	}

	public function magazines(){
		$res = MagaModel::where(true)->order('createdate','desc')->field('zid,title,createdate,img,valid')->select();
		return suc($res);
	}

	public function add(){
		$maga = new MagaModel;
		unset($maga['zid']);
		$res = $maga->save(Request::post('magazine'));
		return $res ? suc($maga->zid,'新增杂志成功') : err('新增杂志失败'); 
	}

	public function save(){
		$data = Request::post('magazine');
		$maga = MagaModel::find($data['zid']);
		$res = $maga->save($data);
		return $res ? suc($maga->zid,'保存杂志成功') : err('保存杂志失败'); 
	}

	public function valid(){
		$zid = Request::post('zid/d');
		$valid = Request::post('valid/d');

		$res = MagaModel::update(['valid'=>$valid],['zid'=>$zid]);
		return $res ? suc('', '状态更新成功') : err('状态更新失败'); 
	}

	public function delete(){
		$zid = Request::post('zid/d');
		$res = MagaModel::destroy($zid);
		return $res ? suc('', '杂志删除成功') : err('杂志删除失败'); 
	}
}