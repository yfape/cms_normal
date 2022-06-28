<?php
namespace app\web\controller;

use think\facade\Cache;
use think\facade\Db;
use think\facade\Request;
use app\admin\model\Page as PageModel;
use app\admin\model\Article as ArticleModel;

class Page{

	protected $nowdate;

	protected function _initialize(){
		$this->nowdate = date('Y-m-d');
		$this->viewnumToday();
	}

	protected function reRedis($pid){
		$page = PageModel::find($pid)->toArray();
		if(!$page){
			return false;
		}
		$page['content'] = json_encode($page['content']);
		app('rhash')->setTable('page')->setKey($pid)->set($page,'',true)->setExpire(7200);
		return $page;
	}

	/**
	 * 获取首页信息
	 * @return [type] [description]
	 */
	public function home(){
		$home = app('rhash')->setTable('page')->setKey(1)->get();
		if(!$home){
			$home = $this->reRedis(1);
			if(!$home){
				return err('页面异常');
			}
		}
		$home['content'] = json_decode($home['content']);
		return suc($home['content']);
	}

	/**
	 * 获取页面信息
	 * @return [type] [description]
	 */
	public function page(){
		$pid = Request::param('pid/d');
		if(!$pid){
			return err('参数异常');
		}
		$page = app('rhash')->setTable('page')->setKey($pid)->get();
		if(!$page){
			$page = $this->reRedis($pid);
			if(!$page){
				return err('不存在页面');
			}
		}
		$page['content'] = json_decode($page['content']);
		return suc($page);
	}

	public function listfirst(){
		$data = Request::param(['mode','cid']);
		if((int)$data['cid']==0){
			return $this->outerr();
		}
		$cid = (int)$data['cid'];
		$mode = (int)$data['mode'];

		$mods = $this->getMod([1,2]);
		$outdata = $this->getAL($cid,1,$mode);

		$arr = array_merge(['main'=>$outdata],$mods);
		return suc($arr);
	}

	protected function getMod($mids){
		$res = Db::table('mod')->where('mid','in',$mids)->select();
		$mods = [];
		foreach ($res as $key => $value) {
			$mods['m'.$value['mid']] = json_decode($value['data']);
		}
		return $mods;
	}

	public function getList(){
		$data = Request::param(['page','cid','mode']);
		if((int)$data['page']==0||(int)$data['cid']==0){
			return ['code'=>9998,'msg'=>'Parameter Error'];
		}
		$page = (int)$data['page'];
		$cid = (int)$data['cid'];
		$mode = (int)$data['mode'];

		$outdata = $this->getAL($cid,$page,$mode);
		return suc($outdata);
	}

	protected function getAL($cid,$page,$mode=0){
		if(!$mode){
			ArticleModel::where(true)->alias('a')

			->where('a.status',10)
			->field("a.aid,title,source,createdate,thumbnail as img,col")
			->order(['createdate'=>'desc','aid'=>'a.desc'])
			->paginate(10,false,[
				'page'=>$page
			]);
		}else{
			ArticleModel::hasWhere('col',['group'=>$cid])
			->where('status',10)
			->field("aid,title,source,createdate,thumbnail as img,col")
			->order(['a.createdate'=>'desc','a.aid'=>'desc'])
			->paginate(10,false,[
				'page'=>$page
			]);
		}	
		$outdata = $out->items();
		return $outdata;
	}

	public function getArticle(){
		$aid = Request::param('aid/d');
		if(!$aid||$aid>300000){
			return $this->outerr();
		}
		$this->setViewnum($aid);

		$article = Db::table('article')->alias('a')
		->join('article_content ac','ac.aid=a.aid')
		->join('col c','a.col=c.cid')
		->where('a.aid',$aid)
		->where('status',10)
		->field("a.aid,title,source,createdate,c.col,faceimg,faceintro,audio,style,ac.content as content")
		->find();

		if($article){
			$article['content'] = htmlspecialchars_decode($article['content']);
			$article['faceimg'] = imageOutFormat($article['faceimg']);
			$article['audio'] = imageOutFormat($article['audio']);
		}else{
			return err('文章不存在或审核不通过');
		}

		$mods = $this->getMod();
		$arr = array_merge(['article'=>$article],$mods);
		return suc($arr);
	}

	public function getMagazines(){
		$ms = Cache::get('magazines');
		if(!$ms){
			$ms = Db::table('magazine')->field('zid,title,createdate,img')->where('valid',1)->order('createdate','desc')->select();
			foreach ($ms as $key => $value) {
				$ms[$key]['img'] = imageOutFormat($value['img']);
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
		$ms['img'] = imageOutFormat($ms['img']);
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
			$res[$key]['img'] = imageOutFormat($value['img']);
		}

		return ['code'=>200,'msg'=>'搜索成功','data'=>$res];
	}	

	public function getTopics(){
		$ts = Cache::get('topics');
		if(!$ts){
			$ts = Db::table('topics')->field('tid,title,createdate,img')->order('createdate','desc')->select();
			foreach ($ts as $key => $value) {
				$ts[$key]['img'] = imageOutFormat($value['img']);
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
		$ts['img'] = imageOutFormat($ts['img']);
		return ['code'=>200,'msg'=>'获取成功','data'=>$ts];
	}

	public function setViewnum($aid){
		$inc = rand(1,20);

		$num = app('rhash')->setTable('a_vn')->setKey($aid)->get();

		if(!$num){
			$v = Db::table('article_viewnum')->where('aid',$aid)->find();
			if(!$v){
				$v['viewnum'] = 0;
				Db::table('article_viewnum')->insert(['aid'=>$aid,'viewnum'=>0]);
			}else{
				app('rhash')->setTable('a_vn')->setKey($aid)->set(['num'=>$v['viewnum']+$inc,'nnum'=>1],'',true)->setExpire(10000);
			}
			return;
		}

		if($num['nnum']>=500){
			Db::table('article_viewnum')->where('aid',$aid)->update(['viewnum'=>$num['num']+$inc]);
			app('rhash')->setTable('a_vn')->setKey($aid)->set(['nnum'=>0],'',true)->setExpire(10000);
		}else{
			app('rhash')->setTable('a_vn')->setKey($aid)->set(['nnum'=>$num['nnum']+$inc],'',true)->setExpire(10000);
		}
		app('rhash')->setTable('a_vn')->setKey($aid)->set(['num'=>$num['num']+$inc],'',true)->setExpire(10000);
	}

	protected function viewnumToday(){
		date_default_timezone_set('PRC');
		$inc = rand(1,20);

		$m = app('rhash')->setTable('viewnum_today')->setKey('1')->get();

		if(!$m){
			$today = $inc;
			$mobj = Db::table('viewnum')->where('indate',$this->nowdate)->find();
			if(isset($mobj['num'])){
				$today = $mobj['num'];
			}
			app('rhash')->setTable('viewnum_today')->setKey('1')->set([
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
				app('rhash')->setTable('viewnum_today')->setKey('1')->set([
					'num'=>$inc,
					'date'=>$this->nowdate,
				]);
			}else{
				app('rhash')->setTable('viewnum_today')->setKey('1')->set([
					'num'=>$m['num']+$inc,
				]);
			}
		}
	}

	protected function outerr(){
		return err('参数错误');
	}
}