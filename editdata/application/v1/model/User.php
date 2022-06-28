<?php

namespace app\v1\model;

use think\Model;

class User extends Model
{
    protected $table = 'user';
    protected $pk = 'uid';
    protected $user;
}
