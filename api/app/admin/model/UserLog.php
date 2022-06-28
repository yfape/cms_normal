<?php
namespace app\admin\model;

use think\Model;

class UserLog extends Model
{
    protected $table = 'user_log';
    protected $pk = 'id';
    protected $schema = [
        'id' => 'int',
        'uid' => 'int',
        'time' => 'int',
        'action' => 'string',
        'token' => 'string',
        'ip' => 'string',
        'data' => 'string'
    ];
    protected $type = [
    	'data' => 'serialize'
    ];
}