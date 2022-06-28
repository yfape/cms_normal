<?php
namespace app\v1\controller\main;
use think\Controller;
use think\Db;
use think\Cache;

use app\v1\model\Article as ArticleModel;
use app\v1\model\ArticleContent;
use app\v1\model\ArticleCheck;
use app\v1\model\ArticleViewnum;
use app\v1\model\ArticleAudit;

use tool\ImgCompress;
use tool\Assist;


class Article extends Controller{

	public function deleteArticle($aid){
		$res = ArticleModel::destroy($aid);
		ArticleContent::destroy($aid);
		ArticleCheck::destroy($aid);
		ArticleViewnum::destroy($aid);
		ArticleAudit::destroy($aid);
		return $res;
	}

	public function changeStatus($aid,$status){
		$article = ArticleModel::get($aid);
		if(!$article){
			return false;
		}
		$old = $article->status;
		if($old === 10 && $status !== 1){
			return false;
		}
		if($old === 1 && $status === 1){
			return false;
		}
		if($old === 0 && $status !==1){
			return false;
		}

		$article->status = $status;
		$res = $article->save();
		return $res?$article->aid:false;
	}

	public function addArticle($d){
		$data = $this->inFormat($d);
		$main = $data['main'];
		$content = $data['content'];
		$check = $data['check'];

		if(isset($main['aid'])){
			unset($main['aid']);
		}

		if(isset($main['faceimg'])&&$main['faceimg']){
			$thumbnail = $this->getThumbnail($main['faceimg']);
			$main['thumbnail'] = $thumbnail;
		}

		$am = new ArticleModel;
		$am->save($main);
		$aid = $am->aid;

		$acm = new ArticleContent;
		$acm->save([
			'aid'=>$aid,
			'content'=>$content
		]);

		$ackm = new ArticleCheck;
		$ackm->save([
			'aid'=>$aid,
			'check'=>$check
		]);

		$av = new ArticleViewnum;
		$av->save([
			'aid'=>$aid,
			'viewnum'=>0
		]);

		$aa = new ArticleAudit;
		$aa->save([
			'aid'=>$aid
		]);

		return $aid;
	}

	public function saveArticle($data){
		$data = $this->inFormat($data);
		$main = $data['main'];
		$content = $data['content'];
		$check = $data['check'];

		$aid = $main['aid'];
		unset($main['aid']);

		$article = ArticleModel::get($aid);
		if($article->status !== 0){
			return false;
		}
		if((isset($main['faceimg']))&&$main['faceimg']&&($article->faceimg != $main['faceimg'])){
			$thumbnail = $this->getThumbnail($main['faceimg']);
			$main['thumbnail'] = $thumbnail;
		}

		$res = $article->save($main);

		$acm = new ArticleContent;
		$res1 = $acm->save([
			'content'=>$content
		],['aid'=>$aid]);

		$ackm = new ArticleCheck;
		$res2 = $ackm->save(['check'=>$check],['aid'=>$aid]);

		return $res||$res1||$res2?$aid:false;
	}


	public function getArticle($aid){
		$article = Db::table('article')->alias('a')
		->join('article_check ack','ack.aid=a.aid')
		->join('article_content ac','ac.aid=a.aid')
		->where('a.aid',$aid)
		// ->field('a.aid,title,source,createdate,editor,col,faceimg,audio,status,style,isphone,isweixin,ac.content as content,ack.check as check')
		->find();
		return $article?$article:false;
	}

	protected function inFormat($d){
		$content = '';
		if(isset($d['content'])){
			$content = $d['content'];
			unset($d['content']);
		}
		$check = '';
		if(isset($d['check'])){
			$check = $d['check'];
			unset($d['check']);
		}

		$data = [];
		$data['main'] = $d;
		$data['content'] = $content;
		$data['check'] = $check;

		return $data;
	}

	/**
     * 获取图片缩略图
     */
	protected function getThumbnail($url){
       $src = config('upload.move').'/'.$url;

       $newfile = uniqid().'.jpg';
       $addr = 'thumbnail/'.date('Ymd');

       $newweb = $addr.'/'.$newfile;
       $newaddr = config('upload.move').'/'.$addr;
       $newsrc = $newaddr.'/'.$newfile;
       Assist::mkdirs($newaddr);
       $newsrc = str_replace('/', '\\', $newsrc);

       $imgc = new ImgCompress($src,0.4);
       $imgc->compressImg($newsrc);
       $newweb = str_replace('\\','/',$newweb);
       return $newweb;
    }

}