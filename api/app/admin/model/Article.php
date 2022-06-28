<?php
namespace app\admin\model;

use think\Model;

use app\admin\model\ArticleAudit;
use app\admin\model\ArticleCheck;
use app\admin\model\ArticleContent;
use app\admin\model\ArticleViewnum;
use app\admin\model\User;

class Article extends Model{

	protected $table = "article";
	protected $pk = "aid";
	protected $schema = [
		'aid' => 'int',
		'title' => 'string',
		'source' => 'string',
		'createdate' => 'int',
		'editor' => 'int',
		'col' => 'int',
		'faceimg' => 'string',
		'faceintro' => 'string',
		'thumbnail' => 'string',
		'audio' => 'string',
		'style' => 'int',
		'status' => 'int',
		'isphone' => 'int',
		'isweixin' => 'int'
	];
	protected $type = [
		'aid' => 'integer',
		'createdate' => 'integer',
		'editor' => 'integer',
		'col' => 'integer',
		'style' => 'integer',
		'status' => 'integer',
		'isphone' => 'integer',
		'isweixin' => 'integer'
	];

	public function content(){
		return $this->hasOne(ArticleContent::class, 'aid')->bind(['content']);
	}

	public function audit(){
		return $this->hasOne(ArticleAudit::class, 'aid')->bind(['auditor', 'posttime']);
	}

	public function check(){
		return $this->hasOne(ArticleCheck::class, 'aid')->bind(['check']);
	}

	public function content(){
		return $this->hasOne(ArticleContent::class, 'aid')->bind(['content']);
	}

	public function viewnum(){
		return $this->hasOne(ArticleViewnum::class, 'aid')->bind(['viewnum']);
	}

	public function setFaceimgAttr($value,$data){
        return imgInFormat($data['faceimg']); 
    }
    public function getFaceimgAttr($value,$data){
        return imgOutFormat($data['faceimg']); 
    }

    public function setThumbnailAttr($value,$data){
        return imgInFormat($data['thumbnail']); 
    }
    public function getThumbnailAttr($value,$data){
        return imgOutFormat($data['thumbnail']); 
    }

    public function setAudioAttr($value,$data){
        return imgInFormat($data['audio']);
    }
    public function getAudioAttr($value,$data){
        return imgOutFormat($data['audio']);
    }

    public function getEditorAttr($value, $data){
    	$user = User::find($data['editor']);
		return $user['nickname'];
    }
    public function setEditorAttr($value, $data){
    	if(is_int($data['editor'])){
    		return $data['editor'];
    	}else{
    		$user = User::where('nickname', $data['editor'])->find();
    		return $user['uid'];
    	}
    }
}