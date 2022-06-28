<?php
namespace app\admin\model;

use think\Model;

class Mod extends Model{

	protected $table = 'mod';
	protected $pk = 'mid';
	protected $schema = [
		'mid' => 'int',
		'data' => 'string',
		'title' => 'string',
	];
	protected $type = [
		'mid' => 'integer',
		'data' => 'json',
	];

}