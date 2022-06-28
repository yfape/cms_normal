<?php
namespace tool;

class Format{

	/**
	 * 图片输出格式化
	 * @param  [type] $img [description]
	 * @return [type]      [description]
	 */
	public static function imgOutFormat($img){

		return config('domain.file').'/'.$img;
	} 

	/**
	 * 图片输入格式化
	 * @param  [type] $img [description]
	 * @return [type]      [description]
	 */
	public static function imgInFormat($img){
		if(strstr($img,config('domain.file')) === false){
			return $img;
		}
		$arr = explode('/', $img);
		array_shift($arr);array_shift($arr);array_shift($arr);
		return implode('/', $arr);
	}

	/**
	 * 权限数据输入格式化
	 * @param  [type] $arg [description]
	 * @return [type]      [description]
	 */
	public static function identityInFormat($arg){
		if((int)$arg){
			return $arg;
		}
		$sys_identity = array_flip(config('identitys'));
		return $sys_identity[$arg];
	}

	/**
	 * 权限数据输出格式化
	 * @param  [type] $arg [description]
	 * @return [type]      [description]
	 */
	public static function identityOutFormat($arg){
		if(!(int)$arg){
			return $arg;
		}
		$sys_identity = config('identitys');
		return $sys_identity[$arg];
	}
}