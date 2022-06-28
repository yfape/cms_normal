<?php
namespace app\admin\model;

use think\Model;

class IPwhite extends Model
{
    protected $table = 'IPwhite';
    protected $pk = 'IP';
    protected $schema = [
        'IP' => 'string'
    ];
}