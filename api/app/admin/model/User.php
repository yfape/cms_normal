<?php
namespace app\admin\model;

use think\Model;

class User extends Model
{
    protected $table = 'user';
    protected $pk = 'uid';
    protected $schema = [
        'uid' => 'int',
        'user' => 'string',
        'pass' => 'string',
        'nickname' => 'string',
        'headimg' => 'string',
        'email' => 'string',
        'identity' => 'int',
        'cols' => 'string',
        'createtime' => 'int',
        'valid' => 'bit'
    ];
    protected $type = [
        'uid' => 'integer',
        'identity' => 'integer',
        'createtime' => 'integer',
        'valid' => 'integer',
    ];

    /**
     * 关联用户日志
     * @return [type] [description]
     */
    public function log(){
        
    	return $this->hasMany(app\admin\model\UserLog::class, 'uid');
    }

    /**
     * 栏目输入
     * @param [type] $value [description]
     * @param [type] $data  [description]
     */
    public function setColsAttr($value, $data){
        $cols = $data['cols'];
        foreach ($cols as $key => $value) {
            $cols[$key] = (int)$value;
        }
        return implode(',', $cols);
    }

    /**
     * 栏目输出
     * @param  [type] $value [description]
     * @param  [type] $data  [description]
     * @return [type]        [description]
     */
    public function getColsAttr($value, $data){
        if(!$data['cols']){
            return [];
        }
        $cols = explode(',', $data['cols']);
        foreach ($cols as $key => $value) {
            $cols[$key] = (int)$value;
        }
        return $cols;
    }

    /**
     * 头像格式化输出
     * @param  [type] $value [description]
     * @param  [type] $data  [description]
     * @return [type]        [description]
     */
    public function getHeadimgAttr($value,$data){

        return imgOutFormat($data['headimg']);
    }
    
    public function setHeadimgAttr($value,$data){

        return imgInFormat($data['headimg']); 
    }

    public static function onBeforeInsert($user){
        $user->headimg = config('app.domain.file').'/system/headimg/defaultheadimg.gif';
        $user->createtime = time();
        $user->pass = openssl_encrypt('123456', 'AES-256-ECB', config('admin.loginsalt'));
    }

    public static function onAfterWrite($user){
    	self::reRedis($user);
    }
    public static function onAfterDelete($user){
        self::reRedis($user);
    }

    /**
     * 刷新成员redis
     * @return [type] [description]
     */
    public static function reRedis($user=''){
    	app('rhash')->setTable('u_uid')->clear();
        app('rhash')->setTable('u_user')->clear();

    	$users = self::select()->toArray();
    	foreach ($users as $key => $value) {
            $value['cols'] = implode(',', $value['cols']);
            app('rhash')->setTable('u_uid')->setKey($value['uid'])->set($value);
            app('rhash')->setTable('u_user')->setKey($value['user'])->set($value);
        }
    	return $users;
    }
}