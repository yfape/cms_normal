<?php
namespace app\admin\model;

use think\Model;

class Col extends Model
{
    protected $table = 'col';
    protected $pk = 'cid';
    protected $schema = [
        'cid' => 'int',
        'col' => 'string',
        'sub' => 'bit',
        'group' => 'int',
        'sort' => 'int',
        'allsort' => 'int',
        'valid' => 'bit'
    ];
    protected $type = [
    	'cid' => 'integer',
    	'sub' => 'integer',
    	'group' => 'integer',
    	'sort' => 'integer',
        'allsort' => 'integer',
        'valid' => 'integer'
    ];

    public static function onBeforeInsert($col){
        if($col->sub === 0){
            $col->allsort = self::max('allsort') + 1;
            $col->sort = 0;
            return $col;
        }
        $cols = self::where('group', $col->group)->order('sort','desc')->select();
        $col->sort = $cols[0]->sort + 1; 
        $col->allsort = $cols[0]->allsort;
        return $col;
    }

    public static function onAfterInsert($col){
        if($col->sub === 0){
            $col->group = $col->cid;
            $col->save();
        }
    }
}