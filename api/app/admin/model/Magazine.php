<?php
namespace app\admin\model;

use think\Model;

class Magazine extends Model{

	protected $table = 'magazine';
	protected $pk = 'zid';
	protected $schema = [
		'zid' => 'int',
		'content' => 'string',
		'title' => 'string',
		'createdate' => 'int',
		'img' => 'img',
		'valid' => 'bit'
	];
	protected $type = [
		'zid' => 'integer',
		'content' => 'json',
		'valid' => 'integer'
	];

	public function getImgAttr($value, $data){
		return imgOutFormat($data['img']);
	}
	public function setImgAttr($value, $data){
		return imgInFormat($data['img']);
	}
}