<?php
namespace app\web\controller;

use think\facade\Db;
use think\facade\Request;

class Lists{

	public function list(){
		$cid = Request::param('cid/d');
		if(!$cid){
			return err('参数错误');
		}

		$mode = Request::param('mode/d');
		$page = Request::param('page/d');

		$mode = $mode ? $mode : 0;
		$page = $page ? $page : 1;
		$sen = $mode ? "c.group=$cid" : "a.col=$cid";

		$out = Db::table('article')->alias('a')
		->join('col c','c.cid=a.col')
		->where('a.status',10)
		->where($sen)
		->field("aid,title,source,createdate,thumbnail as img,c.col as col")
		->order(['a.createdate'=>'desc','a.aid'=>'desc'])
		->paginate(10,false,[
			'page'=>$page
		]);

		$articles = $out->items();

		foreach ($articles as $key => $value) {
			$articles[$key]['img'] = imgOutFormat($value['img']);
		}

		$recommend = $this->getRecommend($cid, $sen);
		$hot = $this->getHot($cid, $sen);

		return suc([
			'articles' => $articles,
			'recommend' => $recommend,
			'hot' => $hot,
		]);
	}
	
	protected function getRecommend($cid, $sen){
		$now = date('Ym');
		$articles = Db::table('article')->alias('a')
		->join('article_viewnum av','av.aid=a.aid')
		->join('col c','c.cid=a.col')
		->where('a.status',10)
		->where($sen)
		->where('FROM_UNIXTIME(createdate,"%Y%m")',$now)
		->field("a.aid,title,source,createdate,thumbnail as img,c.col as col")
		->order(['a.createdate'=>'asc', 'a.aid'=>'desc', 'av.viewnum'=>'asc'])
		->limit(6)->select()->toArray();

		foreach ($articles as $key => $value) {
			$articles[$key]['img'] = imgOutFormat($value['img']);
			if($value['img'] && !$articles[0]['img']){
				$temp = $articles[$key];
				$articles[$key] = $articles[0];
				$articles[0] = $temp;
			}
			
		}
		return $articles;
	}

	protected function getHot($cid, $sen){
		$now = date('Y');
		$articles = Db::table('article')->alias('a')
		->join('article_viewnum av','av.aid=a.aid')
		->join('col c','c.cid=a.col')
		->where('a.status',10)
		->where($sen)
		->where('FROM_UNIXTIME(createdate,"%Y")',$now)
		->field("a.aid,title,source,createdate,thumbnail as img,c.col as col")
		->order(['a.createdate'=>'asc', 'a.aid'=>'desc', 'av.viewnum'=>'desc'])
		->limit(6)->select()->toArray();

		foreach ($articles as $key => $value) {
			$articles[$key]['img'] = imgOutFormat($value['img']);
			if($value['img'] && !$articles[0]['img']){
				$temp = $articles[$key];
				$articles[$key] = $articles[0];
				$articles[0] = $temp;
			}
		}
		return $articles;
	}
}