<?php
namespace app\admin\model;

use think\Model;

class ArticleCheck extends Model {

	protected $table = "article_check";
	protected $pk = "aid";
	protected $schema = [
		'aid' => 'int',
		'check' => 'string'
	];
	protected $type = [
		'aid' => 'integer',
		'check' => 'array'
	];

}