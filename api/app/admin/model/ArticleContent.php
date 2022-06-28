<?php
namespace app\admin\model;

use think\Model;

class ArticleContent extends Model {

	protected $table = "article_content";
	protected $pk = "aid";
	protected $schema = [
		'aid' => 'int',
		'content' => 'string'
	];
	protected $type = [
		'aid' => 'integer',
	];

	public function getContentAttr($value, $data){
		return htmlspecialchars_decode(htmlspecialchars_decode($data['content']));
	}
	public function setContentAttr($value, $data){
		return htmlspecialchars($data['content']);
	}

}