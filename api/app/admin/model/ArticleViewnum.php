<?php
namespace app\admin\model;

use think\Model;

class ArticleViewnum extends Model {

	protected $table = "article_viewnum";
	protected $pk = "aid";
	protected $schema = [
		'aid' => 'int',
		'viewnum' => 'int',
	];
	protected $type = [
		'aid' => 'integer',
		'viewnum' => 'integer'
	];

}