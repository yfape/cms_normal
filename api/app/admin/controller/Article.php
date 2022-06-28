<?php
namespace app\admin\controller;

use think\facade\Request;
use app\admin\model\Article as ArticleModel;

class Article {

	/**
	 * 获取文章数据
	 * @return [type] [description]
	 */
	public function article(){
		$aid = Request::post('aid/d');
		$article = ArticleModel::with(['check', 'content'])->find($aid);
		return $article ? suc($article) : err('不存在文章');
	}

	/*
	* 获取文章列表
	*/
	public function articles(){
		$data = Request::post(['limit','page','status','col','mode','search','super']);
		$data['limit'] = isset($data['limit'])?(int)$data['limit']:10;
	    $data['page'] = isset($data['page'])?(int)$data['page']:1;
	    $data['status'] = isset($data['status'])?$data['status']:[0,1,10];
	    $data['col'] = isset($data['col'])?$data['col']:[1];
	    $data['mode'] = isset($data['mode'])?$data['mode']:'self';
	    $data['search'] = (isset($data['search'])&&$data['search'])?$data['search']:false;
	    $data['super'] = isset($data['super'])?$data['super']:0;

	    $user = Request::middleware('user');

	    $supertext =  $data['super']&&$data['search']?" or ac.content like '%".$data['search']."%'":'';
	    $searchtext = $data['search']?"title like '%".$data['search']."%'":"editor<>0";
	    $restext = $searchtext.$supertext;

        $out = ArticleModel::with(['check'])
        ->alias('a')
        ->join('article_content ac', 'ac.aid=a.aid')
        ->where('status','in',$data['status'])
        ->where('col','in',$data['col'])
        ->where('editor',($data['mode'] == 'self')?'=':'<>',($data['mode'] == 'self')?$user['uid']:0)
        ->where($restext)
        ->order(['a.aid'=>'desc','createdate'=>'desc'])
        ->paginate($data['limit'],false,[
        	'page'=>$data['page']
        ]);
        $outdata = $out->items();
         
        return suc(['list'=>$outdata,'total'=>$out->total(),'lastpage'=>$out->lastPage()]);
    }

    /**
     * 保存或新增文章
     * @return [type] [description]
     */
	public function saveArticle(){
		$data = Request::post('article');
		$userc = new \app\admin\controller\User;
		$user = \app\admin\model\User::where('nickname',$data['editor'])->find();
		if(!$user){
			return err('不存在编辑');
		}
		$data['editor'] = $user['uid'];
		$article = '';

		if(!isset($data['aid'])){
			return err('请求异常');
		}
		$res = [];
		if($data['aid']==0){
			$res = $this->add($data);
		}else{
			$res = $this->save($data);
		}
		return $res;
	}

	/**
	 * 删除文章
	 * @return [type] [description]
	 */
	public function deleteArticle(){
		$aid = Request::post('aid/d');
		$article = ArticleModel::with(['audit', 'check', 'content', 'viewnum'])->find($aid);
		if(!$article){
			return err('不存在文章');
		}
		$res = $article->together(['audit', 'check', 'content', 'viewnum'])->delete();
		\app\admin\model\ArticleAudit::destroy($aid);
		return $res ? suc('', '删除成功') : err('删除失败');
	}

	/**
	 * 改变文章状态
	 * @return [type] [description]
	 */
	public function changeStatus(){
		$aid = Request::post('aid/d');
		$status = Request::post('status/d');
		$user = Request::middleware('user');

		$article = ArticleModel::find($aid);
		if(($article->status > 1 || $status > 1) && $user['identity'] > 2){
			return err('无权限');
		}

		if($status == 10){
			\app\admin\model\ArticleAudit::update(['status'=>$status], ['aid'=>$aid]);
		}
		$res = ArticleModel::update(['status' => $status], ['aid' => $aid]);
		return $res ? suc('', '状态更新成功') : err('更新失败');
	}


	protected function add($data){
		$article = new ArticleModel;
		unset($data['aid']);
		if($data['faceimg']){
			$data['thumbnail'] = app('tool')->thumbnail($data['faceimg']);
		}
		$article->viewnum = 0;
		$article->auditor = 0;
		$article->check = $data['check'];
		$article->content = $data['content'];
		$res = $article->together(['audit'=>['auditor'],'check'=>['check'],'content'=>['content'],'viewnum'=>['viewnum']])->save($data);
		return $res ? suc($article->aid, '新增文章成功') : err('新增文章失败');
	}


	protected function save($data){
		$article = ArticleModel::find($data['aid']);
		if($data['faceimg'] && ($data['faceimg'] != $article->faceimg)){
			$data['thumbnail'] = app('tool')->thumbnail($data['faceimg']);
		}
		$res = $article->save($data);
		\app\admin\model\ArticleCheck::update(['check'=>$data['check']],['aid'=>$data['aid']]);
		\app\admin\model\ArticleContent::update(['content'=>$data['content']],['aid'=>$data['aid']]);

		return $res ? suc($article->aid, '保存文章成功') : err('保存文章失败');
	}

}