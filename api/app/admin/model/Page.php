<?php
namespace app\admin\model;

use think\Model;
use think\facade\Request;

class Page extends Model{

	protected $table = 'page';
	protected $pk = 'pid';
	protected $schema = [
		'pid' => 'int',
		'title' => 'string',
		'content' => 'string',
		'createdate' => 'int',
		'img' => 'string',
		'backimg' => 'string',
		'backcolor' => 'string',
		'header' => 'int',
		'footer' => 'int',
		'valid' => 'bit',
		'editor' => 'int',
	];
	protected $type = [
		'pid' => 'integer',
		'createdate' => 'integer',
		'content' => 'json',
		'header' => 'integer',
		'footer' => 'integer',
		'valid' => 'integer',
		'editor' => 'integer',
	];

	public function setImgAttr($value,$data){
        return imgInFormat($data['img']); 
    }
    public function getImgAttr($value,$data){
        return imgOutFormat($data['img']); 
    }

    public function setBackimgAttr($value,$data){
        return imgInFormat($data['backimg']); 
    }
    public function getBackimgAttr($value,$data){
        return imgOutFormat($data['backimg']); 
    }

    public function getEditorAttr($value,$data){
        $userc = new \app\admin\controller\User;
        $user = $userc->getUser('uid',$data['editor'],false);
        return $user ? $user['nickname'] : null;
    }

    public static function onBeforeInsert($page){
    	$page->createdate = time();
        $page->valid = $page->valid ? 1 : 0;
        $user = Request::middleware('user');
        $page->editor = $user['uid'];
    }

    /**
     * 刷新成员redis
     * @return [type] [description]
     */
    public static function reRedis($pid){
    	$page = self::find($pid)->toArray();
    	app('rhash')->setTable('page')->setKey($pid)->set($page,'',true)->setExpire(7200);
    	return $page;
    }

}