<?php
function getOut(int $num){
	$arr = config('sys_code');
	$msg = isset($arr[$num.''])?$arr[$num.'']:'未知内部错误';
	return ['code'=>$num,'msg'=>$msg];
}
function arrayFormat($arg){
	if(!is_array($arg)&&$arg){
		$arg = explode(',', $arg);
		foreach ($arg as $key => $value) {
			$arg[$key] = (int)$value;
		}
	}
	return $arg?$arg:[];
}
function arrayInt($arr){
	foreach ($arr as $key => $value) {
		$arr[$key] = (int)$value;
	}
	return $arr;
}
/**
 * 图片输出格式化
 * @param  [type] $img [description]
 * @return [type]      [description]
 */
function imgOutFormat($img){
	if(!$img){
		return;
	}
	if(strstr($img,'http') === false){
		return config('domain.file').'/'.$img;
	}else{
		return $img;
	}
} 

/**
 * 图片输入格式化
 * @param  [type] $img [description]
 * @return [type]      [description]
 */
function imgInFormat($img){
	if(strstr($img,config('domain.file')) === false){
		return $img;
	}
	$arr = explode('/', $img);
	$arr = array_slice($arr,3);
	return implode('/', $arr);
}

/**
 * 权限数据输入格式化
 * @param  [type] $arg [description]
 * @return [type]      [description]
 */
function identityInFormat($arg){
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
function identityOutFormat($arg){
	if(!(int)$arg){
		return $arg;
	}
	$sys_identity = config('identitys');
	return $sys_identity[$arg];
}

function is_timestamp($timestamp) {
    if(strtotime(date('m-d-Y H:i:s',$timestamp)) === $timestamp) {
        return $timestamp;
    } else return false;
}

function findNum($str=''){
        $str=trim($str);
        if(empty($str)){return '';}
        $reg='/(\d{3}(\.\d+)?)/is';//匹配数字的正则表达式
        preg_match_all($reg,$str,$result); if(is_array($result)&&!empty($result)&&!empty($result[1])&&!empty($result[1][0])){
            return $result[1][0];
        }
        return '';
}