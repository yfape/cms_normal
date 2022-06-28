<?php
namespace app\admin\model;

use think\Model;

class ArticleAudit extends Model {

	protected $table = "article_audit";
	protected $pk = "aid";
	protected $schema = [
		'aid' => 'int',
		'auditor' => 'int',
		'posttime' => 'int'
	];
	protected $type = [
		'aid' => 'integer',
		'auditor' => 'integer',
		'posttime' => 'integer'
	];

}