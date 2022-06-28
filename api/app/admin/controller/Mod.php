<?php
namespace app\admin\controller;

use think\facade\Request;
use app\admin\model\Mod as ModModel;

class Mod {

	public function mod(){
		$mid = Request::post('mid/a');
		$mod = ModModel::find($mid);
		return $mod?suc($mod):err('不存在此模块');
	}

	public function mods(){
		$mods = ModModel::where(true)->field('mid,title')->select();
		return suc($mods);
	}

	public function save(){
		$mid = Request::post('mid/d');
		$data = Request::post('data');
		$data = arr_str_to_int($data);
		$res = ModModel::update(['data'=>$data],['mid'=>$mid]);
		return $res?suc('','保存模块成功'):err('保存失败');
	}

	public function delete(){

	}

	public function reRedis(){

	}

}