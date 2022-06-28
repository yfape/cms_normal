<?php
namespace app\v1\controller\api;
use think\Controller;
use think\Request;
use think\Db;

use app\v1\model\Article as ArticleModel;
use app\v1\controller\main\Article as ArticleC;
use app\v1\controller\main\User as UserC;
use app\v1\controller\main\Col as ColC;


class Article extends Controller{

	protected $user;
	protected $request;

	protected function _initialize(){
		parent::_initialize();
		$this->request = Request::instance();
		$this->user = $this->request->user;
	}

	public function deleteArticle(){
		$data = $this->request->post();
		if(!isset($data['aid'])){
			return getOut(9998);
		}
		$ac = new ArticleC;
		$res = $ac->deleteArticle((int)$data['aid']);
		if(!$res){
			return getOut(2001);
		}else{
			return ['code'=>200,'msg'=>'删除文章成功','data'=>[]];
		}
	}

	public function changeStatus(){
		$data = $this->request->post();
		if(!(isset($data['aid'])&&isset($data['status']))){
			return getOut(9998);
		}
		$ac = new ArticleC;
		$res = $ac->changeStatus((int)$data['aid'],(int)$data['status']);
		if(!$res){
			return getOut(2001);
		}else{
			return ['code'=>200,'msg'=>'状态更新成功','data'=>['aid'=>$res]];
		}
	}

	public function saveArticle(){
		$data = $this->request->post();
		if(!isset($data['article'])){
			return getOut(9998);
		}
		$data = $data['article'];
		$data = $this->articleInFormat($data);
		if(!isset($data['aid'])){
			return getOut(9998);
		}
		if(!$this->judgeIdentity($data['editor'])){
			return getOut(9998);
		}

		$ac = new ArticleC;
		$res = $ac->saveArticle($data);
		if(!$res){
			return getOut(2001);
		}else{
			return ['code'=>200,'msg'=>'修改文章成功','data'=>['aid'=>$res]];
		}
	}

	public function addArticle(){
		$data = $this->request->post();
		if(!isset($data['article'])){
			return getOut(9998);
		}
		$data = $data['article'];
		$data = $this->articleInFormat($data);
		if(!$data){
			return getOut(4002);
		}
		if(!$this->judgeIdentity($data['editor'])){
			return getOut(9998);
		}

		$ac = new ArticleC;
		$res = $ac->addArticle($data);
		if((int)$res === 0){
			return getOut(2001);
		}
		return ['code'=>200,'msg'=>'新增文章成功','data'=>['aid'=>$res]];
	}	

	public function getArticle(){
		$data = $this->request->post();
		if(!isset($data['aid'])||(int)$data['aid']===0){
			return getOut(9998);
		}
		$ac = new ArticleC;
		$res = $ac->getArticle($data['aid']);
		if($res){
			$res = $this->articleOutFormat($res);
			return ['code'=>200,'msg'=>'获取文章成功','data'=>$res];
		}else{
			return getOut(2003);
		}
	}



	/*
	* 获取文章列表
	*/
	public function getArticleList(){
		$data = $this->request->post();
		$data['limit'] = isset($data['limit'])?(int)$data['limit']:10;
	    $data['page'] = isset($data['page'])?(int)$data['page']:1;
	    $data['status'] = isset($data['status'])?$data['status']:[0,1,10];
	    $data['col'] = isset($data['col'])?$data['col']:[1];
	    $data['mode'] = isset($data['mode'])?$data['mode']:'self';
	    $data['search'] = (isset($data['search'])&&$data['search'])?$data['search']:false;
	    $data['super'] = isset($data['super'])?$data['super']:0;

	    $supertext =  $data['super']&&$data['search']?" or ac.content like '%".$data['search']."%'":'';
	    $searchtext = $data['search']?"title like '%".$data['search']."%'":"editor<>0";
	    $restext = $searchtext.$supertext;

        $out = Db::table('article')->alias('a')
            ->join('user u','u.uid=a.editor')
            ->join('col c','c.cid=a.col')
            ->join('article_content ac','ac.aid=a.aid')
            ->where('a.col','in',$data['col'])
            ->where('status','in',$data['status'])
            ->where('editor',($data['mode'] == 'self')?'=':'<>',($data['mode'] == 'self')?$this->user['uid']:0)
            ->where($restext)
            ->field('a.aid,title,c.col as col,source,a.createdate,u.nickname as editor,a.faceimg,a.thumbnail,audio,a.status,style,isphone,isweixin')
            ->order(['aid'=>'desc','createdate'=>'desc'])
            ->paginate($data['limit'],false,[
            	'page'=>$data['page']
            ]);
        $outdata = $out->items();

        foreach ($outdata as $key=>$item){
            $outdata[$key] = $this->articleOutFormat($item);
        }

        return ['code'=>200,'data'=>['list'=>$outdata,'total'=>$out->total(),'lastpage'=>$out->lastPage()]];
    }


    /**
     * 判断权限
     * @param  [type] $data [description]
     * @return [type]       [description]
     */
	protected function judgeIdentity($editor){
		if((int)$this->user['identity'] === 1){
			return true;
		}
		if($editor !== (int)$this->user['uid']){
			return false;
		}else{
			return true;
		}
		
	}	

	/**
	 * 转换editor为uid
	 * @param  [type] $editor [description]
	 * @return [type]         [description]
	 */
	protected function getEditorUid($editor){
		$userc = new UserC;
		$uid = $userc->getUidByNickname($editor);
		return $uid;
	}


    /*
	 * 文章输出格式化
	 */
	protected function articleOutFormat($data){
        $data['faceimg'] = isset($data['faceimg'])&&$data['faceimg']?imgOutFormat($data['faceimg']):'';
        $data['thumbnail'] = isset($data['thumbnail'])&&$data['thumbnail']?imgOutFormat($data['thumbnail']):'';
        $data['audio'] = isset($data['audio'])&&$data['audio']?imgOutFormat($data['audio']):'';

        if(isset($data['editor'])){
        	if((int)$data['editor'] !== 0){
        		$uc = new UserC;
		        $user = $uc->getUser($data['editor']);
		        $data['editor'] = $user['nickname'];
        	}
        }else{
        	$data['editor'] = '';
        }

        $data['check'] = isset($data['check'])?unserialize($data['check']):'';
        $data['content'] = isset($data['content'])?htmlspecialchars_decode($data['content']):'';
        return $data;
    }

	/**
	 * 文章输入格式化
	 * @param  [type] $data [description]
	 * @return [type]       [description]
	 */
	protected function articleInFormat($data){
	    if(isset($data['aid'])){
	        $data['aid'] = (int)$data['aid'];
        }
	    if(isset($data['createdate'])){
	    	if(strlen((int)$data['createdate']) > 8){
	    		$data['createdate'] = (int)$data['createdate'];
	    	}else{
	    		return false;
	    	}
        }
		if(isset($data['editor'])&&!is_int($data['editor'])){
			$userc = new UserC;
			$user = $userc->getUidByNickname($data['editor']);
			if(!$user){
				return false;
			}else{
				$data['editor'] = $user;
			}
		}
		if(isset($data['col'])){
		    if((int)$data['col'] === 0){
                return false;
            }else{
            	$data['col'] = (int)$data['col'];
            	$colc = new ColC;
            	$col = $colc->getCol($data['col']);
            	if(!$col){
            		return false;
            	}
            }
        }
		if(isset($data['faceimg'])){
			$data['faceimg'] = imgInFormat($data['faceimg']);
		}
		if(isset($data['audio'])){
		    $data['audio'] = imgInFormat($data['audio']);
        }
		if(isset($data['status'])){
			$data['status'] = (int)$data['status'];
			$statusarr = config('astatus');
			if(!isset($statusarr[$data['status']])){
				return false;
			}
		}
        if(isset($data['style'])){
            $data['style'] = (int)$data['style'];
            if($data['style']===0){
            	return false;
            }else{
            	$stylearr = config('astyle');
            	if(!in_array($data['style'],$stylearr)){
            		return false;
            	}
            }
        }
		if(isset($data['isphone'])){
			$data['isphone'] = (int)$data['isphone'];
			$data['isphone'] = ($data['isphone']===0)?0:1;
		}
		if(isset($data['isweixin'])){
			$data['isweixin'] = (int)$data['isweixin'];
			$data['isweixin'] = ($data['isweixin']===0)?0:1;
		}
		if(isset($data['check'])){
			$data['check'] = serialize($data['check']);
		}
		return $data;
	}


}