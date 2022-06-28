<?php
namespace app\admin\controller;
use think\facade\Request;
use think\facade\Db;

class System{

	public function getSystem(){
		$cols = $this->getCols();
		$user = $this->getUser();
		$identitys = config('admin.identitys');
		$astatus = config('admin.astatus');
		$sourcewhites = $this->getSourcewhites();

		$data = [
			'user' => $user,
			'cols' => $cols,
			'identitys' => $identitys,
			'astatus' => $astatus,
			'sourcewhites' => $sourcewhites,
			'identitys' => config('admin.identitys'),
			'astatus' => config('admin.astatus'),
		];

		return suc($data);
	}

	protected function getCols(){
		$colc = new \app\admin\controller\Col;
		$cols = $colc->getAllCols();
		return $cols;
	}

	protected function getUser(){
		$user = Request::middleware('user');
		unset($user['pass']);
		return $user;
	}

	protected function getSourcewhites(){
		$swc = new \app\admin\controller\assist\Sourcewhite;
		return $swc->all('in');
	}


	public function getDataCenter(){
		$member = $this->getMemberNum();
		$viewnum = $this->getViewnum();
		$article = $this->getAricleNum();
		$today = $this->getTodayArticle();
		$line = $this->getViewnumline();
		$editor = $this->getEditors();
		$disk = $this->getDisk();
		$articleviewnum = $this->getArticleViewnum();
		$res = [
			'member'=>$member,
			'viewnum'=>$viewnum,
			'article'=>$article,
			'today'=>$today,
			'line'=>$line,
			'editor'=>$editor,
			'disk'=>$disk,
			'articleviewnum'=>$articleviewnum
		];

		return suc($res);
	}

	protected function getViewnum(){
		$sum = Db::table('viewnum')->where("date_format(indate,'%Y%m')='".date('Ym')."'")->sum('num');
		$viewnum = app('rhash')->setTable('viewnum_today')->setKey('1')->get();
		$today = 0;
		if(!$viewnum){
			$today = rand(1,20);
			app('rhash')->setTable('viewnum_today')->setKey('1')->set(['date'=>date('Y-m-d'),'num'=>$today]);
		}else{
			$today = $viewnum['num'];
		}
		return ['num'=>$sum+$today,'today'=>$today];
	}

	protected function getAricleNum(){
		$num = Db::query("SELECT count(*) as num FROM article WHERE FROM_UNIXTIME(createdate,'%Y%m') = DATE_FORMAT( CURDATE( ) ,'%Y%m' ) ");
		return ['num'=>$num[0]['num']];
	}

	protected function getTodayArticle(){
		$create = Db::query("SELECT count(*) FROM article WHERE TO_DAYS(FROM_UNIXTIME(createdate,'%Y%m%d')) = TO_DAYS(NOW())");
		$audit = Db::query("SELECT count(*) FROM article WHERE aid in (SELECT aid FROM article WHERE TO_DAYS(FROM_UNIXTIME(createdate,'%Y%m%d')) = TO_DAYS(NOW())) and status = 10");
		return ['create'=>$create[0]['count(*)'],'audit'=>$audit[0]['count(*)']];
	}

	protected function getMemberNum(){
		$member = app('rhash')->setTable('member')->setKey('1')->get();
		if(!$member){
			$num = Db::table('member')->sum('num');

			$data = Db::table('member')->where('indate',date('Y-m-d'))->find();
			$today = $data?$data['num']:1;

			app('rhash')->setTable('member')->setKey('1')->set([
				'num'=>$num,
				'today'=>$today,
				'date'=>date('Y-m-d'),
			]);
			$member = ['num'=>$num,'today'=>$today];
		}
		return $member;
	}

	protected function getViewnumline(){
		$res = Db::table('viewnum')->limit(30)->field('date_format(indate,"%m/%d") as indate,num')->order('indate','desc')->select();
		return $res;
	}

	protected function getEditors(){
		$res = Db::table('article')->alias('a')
		->join('user u','u.uid=a.editor')
		->where('u.valid',1)
		->where('a.createdate','>',strtotime(date('Y-m')))
		->field('count(a.aid) as num,u.nickname as editor')
		->group('a.editor')
		->select();
		return $res;
	}

	protected function getDisk(){
		$out = '';
		$info = exec('wmic logicaldisk get FreeSpace,size /format:list',$out,$status);
		$hd = '';
		foreach($out as $vaule){
			$hd .= $vaule . ' ';;
		}
		$hd_array = explode('   ', trim($hd));
		$key = 'CDEFGHIJKLMNOPQRSTUVWXYZ';
		$res = ['system'=>'','data'=>''];
		foreach($hd_array as $k => $v){
			$s_array = explode('Size=', $v);
			$fs_array = explode('FreeSpace=', $s_array[0]);
			$size = round(trim($s_array[1])/(1024*1024*1024), 1);
			$freespace = round(trim($fs_array[1])/(1024*1024*1024), 1);
			$drive = $key[$k];
			if($drive=='C'||$drive=='c'){
				$res['system'] = (int)($size-$freespace)."G/".(int)$size."G";
				$res['systemra'] = ($size-$freespace)/$size;
			}else if($drive == substr(config('admin.file'),0,1)){
				$res['data'] = (int)($size-$freespace)."G/".(int)$size."G";
				$res['datara'] = ($size-$freespace)/$size;
			}
			
		}
		return $res;
	}

	protected function getArticleViewnum(){
		$res = Db::table('article')->alias('a')
		->join('article_viewnum av','a.aid=av.aid')
		->join('user u','a.editor=u.uid')
		->where("FROM_UNIXTIME(a.createdate,'%Y-%m')='".date('Y-m')."'")
		->field('a.title,u.nickname as editor,a.createdate,av.viewnum')
		->order(['av.viewnum'=>'desc','a.aid'=>'desc'])
		->limit(8)->select();
		return $res;
	}
}