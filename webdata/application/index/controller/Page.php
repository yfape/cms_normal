<?php
namespace app\index\controller;
use think\Controller;
use think\Cache;
use think\Db;
use think\Request;
use tool\RedisHash;

class Page extends Controller{

	protected $nowdate;

	protected function _initialize(){
		$this->nowdate = date('Y-m-d');
		$this->viewnumToday();
	}

	public function getHome(){
		$res = Cache::get('home');
		if($res){
			$data = unserialize($res);
		}else{
			$mids = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
			$res = Db::table('mod')->where('mid','in',$mids)->select();
			$data = [];
			foreach ($res as $key => $value) {
				$data['m'.$value['mid']] = unserialize($value['data']);
			}
			Cache::set('home',serialize($data));
		}
		return ['code'=>200,'msg'=>'','data'=>$data];
	}

	public function listfirst(){
		$data = Request::instance()->param();
		if(!(isset($data['mode'])&&isset($data['cid']))){
			return $this->outerr();
		}
		if((int)$data['cid']==0){
			return $this->outerr();
		}
		$cid = (int)$data['cid'];
		$mode = (int)$data['mode'];

		$mods = $this->getMod();
		$outdata = $this->getAL($cid,1,$mode);

		$arr = array_merge(['main'=>$outdata],$mods);
		return ['code'=>200,'msg'=>'','data'=>$arr];
	}

	protected function getMod(){
		$mods = Cache::get('list');
		if($mods){
			$mods = unserialize($mods);
		}else{
			$mids = [19,20];
			$res = Db::table('mod')->where('mid','in',$mids)->select();
			$mods = [];
			foreach ($res as $key => $value) {
				$mods['m'.$value['mid']] = unserialize($value['data']);
			}
			Cache::set('list',serialize($mods));
		}
		return $mods;
	}

	public function getList(){
		$data = Request::instance()->param();
		if(!(isset($data['page'])&&isset($data['cid'])&&isset($data['mode']))){
			return ['code'=>9998,'msg'=>'Parameter Error'];
		}
		if((int)$data['page']==0||(int)$data['cid']==0){
			return ['code'=>9998,'msg'=>'Parameter Error'];
		}
		$page = (int)$data['page'];
		$cid = (int)$data['cid'];
		$mode = (int)$data['mode'];

		$outdata = $this->getAL($cid,$page,$mode);
		return ['code'=>200,'msg'=>'','data'=>$outdata];
	}

	protected function getAL($cid,$page,$mode=0){
		if(!$mode){
			$out = Db::table('article')->alias('a')
			->join('col c','c.cid=a.col')
			->where('a.col',$cid)
			->where('status',10)
			->field("aid,title,source,createdate,thumbnail as img,c.col as col")
			->order(['createdate'=>'desc','aid'=>'desc'])
			->cache(60)
			->paginate(10,false,[
				'page'=>$page
			]);
		}else{
			$out = Db::table('article')->alias('a')
			->join('col c','c.cid=a.col')
			->where('c.group',$cid)
			->where('a.status',10)
			->field("aid,title,source,createdate,thumbnail as img,c.col as col")
			->order(['a.createdate'=>'desc','a.aid'=>'desc'])
			->cache(60)
			->paginate(10,false,[
				'page'=>$page
			]);
		}

		
		$outdata = $out->items();

		foreach ($outdata as $key => $value) {
			$outdata[$key]['img'] = $this->outfile($value['img']);
		}

		return $outdata;
	}

	public function getArticle(){
		$aid = Request::instance()->param('aid');
		if(!$aid){
			return $this->outerr();
		}
		$aid = (int)$aid;
		if(!$aid||$aid>300000){
			return $this->outerr();
		}
		$this->setViewnum($aid);
		$article = Db::table('article')->alias('a')
		->join('article_content ac','ac.aid=a.aid')
		->join('col c','a.col=c.cid')
		->where('a.aid',$aid)
		->where('status',10)
		->field("a.aid,title,source,createdate,c.col,faceimg,faceintro,CONCAT('http://file.scdjw.net/',audio) as audio,style,ac.content as content")
		->find();

		if($article){
			$article['content'] = htmlspecialchars_decode($article['content']);
			$article['faceimg'] = $this->outfile($article['faceimg']);
		}else{
			return ['code'=>9999,'msg'=>'文章不存在或审核不通过','data'=>[]];
		}


		$mods = $this->getMod();
		$arr = array_merge(['article'=>$article],$mods);
		return ['code'=>200,'msg'=>'获取成功','data'=>$arr];
	}

	public function getMagazines(){
		$ms = Cache::get('magazines');
		if(!$ms){
			$ms = Db::table('magazine')->field('zid,title,createdate,img')->where('valid',1)->order('createdate','desc')->select();
			foreach ($ms as $key => $value) {
				$ms[$key]['img'] = $this->outfile($value['img']);
			}
			Cache::set('magazines',serialize($ms));
		}else{
			$ms = unserialize($ms);
		}
		return ['code'=>200,'msg'=>'获取成功','data'=>$ms];
	}

	public function getMagazine(){
		$zid = Request::instance()->param('zid');
		if(!$zid){
			return $this->outerr();
		}
		$zid = (int)$zid;
		$ms = Db::table('magazine')->where('zid',$zid)->cache(60)->field("zid,title,createdate,img,content")->find();
		$ms['content'] = unserialize($ms['content']);
		$ms['img'] = $this->outfile($ms['img']);
		return ['code'=>200,'msg'=>'获取成功','data'=>$ms];
	}

	public function search(){
		$search = Request::instance()->param('search');
		$search = htmlspecialchars($search);
		$res = Db::table('article')->alias('a')
			->join('col c','c.cid=a.col')
			->where('status',10)
			->where('title','like','%'.$search.'%')
			->field("aid,title,source,createdate,thumbnail as img,c.col as col")
			->order(['createdate'=>'desc','aid'=>'desc'])->select();

		foreach ($res as $key => $value) {
			$res[$key]['img'] = $this->outfile($value['img']);
		}

		return ['code'=>200,'msg'=>'搜索成功','data'=>$res];
	}	

	public function getTopics(){
		$ts = Cache::get('topics');
		if(!$ts){
			$ts = Db::table('topics')->field('tid,title,createdate,img')->order('createdate','desc')->select();
			foreach ($ts as $key => $value) {
				$ts[$key]['img'] = $this->outfile($value['img']);
			}
			Cache::set('topics',serialize($ts));
		}else{
			$ts = unserialize($ts);
		}
		return ['code'=>200,'msg'=>'获取成功','data'=>$ts];
	}

	public function getTopic(){
		$tid = Request::instance()->param('tid');
		if(!$tid){
			return $this->outerr();
		}
		$tid = (int)$tid;
		$ts = Db::table('topic')->where('valid',1)->where('tid',$tid)->cache(60)->find();
		if(!$ts){
			return $this->outerr();
		}
		$ts['content'] = unserialize($ts['content']);
		$ts['img'] = $this->outfile($ts['img']);
		return ['code'=>200,'msg'=>'获取成功','data'=>$ts];
	}

	public function setViewnum($aid){
		$inc = rand(1,20);

		$hash = RedisHash::instance();
		$num = $hash->setTable('a_vn')->setKey($aid)->get();

		if(!$num){
			$v = Db::table('article_viewnum')->where('aid',$aid)->find();
			if(!$v){
				$v['viewnum'] = 0;
				Db::table('article_viewnum')->insert(['aid'=>$aid,'viewnum'=>0]);
			}else{
				$hash->setTable('a_vn')->setKey($aid)->set(['num'=>$v['viewnum']+$inc,'nnum'=>1],'',true)->setExpire(10000);
			}
			return;
		}

		if($num['nnum']>=500){
			Db::table('article_viewnum')->where('aid',$aid)->update(['viewnum'=>$num['num']+$inc]);
			$hash->setTable('a_vn')->setKey($aid)->set(['nnum'=>0],'',true)->setExpire(10000);
		}else{
			$hash->setTable('a_vn')->setKey($aid)->set(['nnum'=>$num['nnum']+$inc],'',true)->setExpire(10000);
		}
		$hash->setTable('a_vn')->setKey($aid)->set(['num'=>$num['num']+$inc],'',true)->setExpire(10000);
	}

	protected function viewnumToday(){
		date_default_timezone_set('PRC');
		$inc = rand(1,20);

		$hash = RedisHash::instance();
		$m = $hash->setTable('viewnum_today')->setKey('1')->get();

		if(!$m){
			$today = $inc;
			$mobj = Db::table('viewnum')->where('indate',$this->nowdate)->find();
			if(isset($mobj['num'])){
				$today = $mobj['num'];
			}
			$hash->setTable('viewnum_today')->setKey('1')->set([
				'date'=>$this->nowdate,
				'num'=>$today
			]);
		}else{
			if($this->nowdate != $m['date']){
				$res = Db::table('viewnum')->where('indate',$m['date'])->find();
				if($res){
					Db::table('viewnum')->where('indate',$m['date'])->update(['num'=>$m['num']]);
				}else{
					Db::table('viewnum')->insert(['indate'=>$m['date'],'num'=>$m['num']]);
				}
				$hash->setTable('viewnum_today')->setKey('1')->set([
					'num'=>$inc,
					'date'=>$this->nowdate,
				]);
			}else{
				$hash->setTable('viewnum_today')->setKey('1')->set([
					'num'=>$m['num']+$inc,
				]);
			}
		}
	}

	protected function outerr(){
		return ['code'=>9998,'msg'=>'Parameter Error'];
	}

	protected function outfile($file){
		if(!$file){
			return;
		}
		if(strstr($file,'http') === false){
			return config('domain.file').'/'.$file;
		}else{
			return $file;
		}
	}
}