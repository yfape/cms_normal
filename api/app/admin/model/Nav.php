<?php
namespace app\admin\model;

use think\facade\Request;
use think\Model;

class Nav extends Model{

	protected $table = 'nav';
	protected $pk = 'id';
	protected $schema = [
		'id' => 'int',
		'nav' => 'string'
	];
	protected $type = [
		'id' => 'integer',
		'nav' => 'json'
	];

}