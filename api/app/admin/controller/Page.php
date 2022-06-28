<?php
namespace app\admin\controller;

use think\facade\Request;
use app\admin\model\Page as PageModel;
use think\facade\Db;

class Page {

	public function page(){
		$pid = Request::post('pid/d');
		if(!$pid){
			return err('参数异常');
		}
		$page = app('rhash')->setTable('page')->setKey($pid)->get();
		if(!$page){
			$page = PageModel::find($pid)->toArray();
			if(!$page){
				return err('无指定页面');
			}
			$page['content'] = json_encode($page['content']);
			app('rhash')->setTable('page')->setKey($pid)->set($page);
		}else{
			$page['header'] = (int)$page['header'];
			$page['footer'] = (int)$page['footer'];
			$page['valid'] = (int)$page['valid'];
			$page['pid'] = (int)$page['pid'];
		}
		$page['content'] = json_decode($page['content']);

		return suc($page);
	}

	public function pages(){
		$listpage = Request::post('page/d');
		$out = PageModel::where('pid','>',1)->paginate(10,false,[
        	'page'=>$listpage
        ]);
        $outdata = $out->items();
		return suc(['list'=>$outdata,'total'=>$out->total(),'lastpage'=>$out->lastPage()]);
	}

	public function save(){
		$data = Request::post(['pid', 'title', 'content', 'createdate', 'img', 'backimg', 'header', 'footer', 'valid']);
		$data['content'] = arr_str_to_int($data['content']);
		$page = PageModel::find($data['pid']);
		$res = $page->save($data);
		$this->reRedis($data['pid']);
		return $res ? suc('', '保存成功') : err('保存失败');
	}

	public function add(){
		$data = Request::post(['title', 'content', 'createdate', 'img', 'backimg', 'header', 'footer', 'valid']);
		$page = new PageModel;
		$res = $page->save($data);
		$res && $this->reRedis($page->pid);
		return $res ? suc($page->pid, '新增页面成功') : err('新增页面失败');
	}

	public function delete(){
		$pid = Request::post('pid/d');
		$res = PageModel::destroy($pid);
		app('rhash')->setTable('page')->deleteByKey($pid);
		return $res ? suc($pid, '删除页面成功') : err('删除页面失败');
	}

	public function pageValid(){
		$pid = Request::post('pid/d');
		$page = PageModel::find($pid);
		$page->valid = $page->valid ? 0 : 1;
		$res = $page->save();
		$this->reRedis($pid);
		return $res ? suc($pid, '状态更改成功') : err('状态更改失败');
	}

	public function reRedis($pid){
		$page = PageModel::find($pid)->toArray();
		$page['content'] = json_encode($page['content']);
		app('rhash')->setTable('page')->setKey($pid)->set($page,'',true)->setExpire(3600);
	}

}