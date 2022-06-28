<?php
namespace tool;

class Assist{

	/**
	 * 获得随机字符串
	 * @param $len             需要的长度
	 * @param $special        是否需要特殊符号
	 * @return string       返回随机字符串
	 */
	public static function getRandomStr($len, $special=true){
	    $chars = array(
	        "A", "B", "C", "D", "E", "F", "G","H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R","S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2","3", "4", "5", "6", "7", "8", "9"
	    );

	    if($special){
	        $chars = array_merge($chars, array(
	            "!", "@", "#", "$", "?", "|", "{", "/", ":", ";",
	            "%", "^", "&", "*", "(", ")", "-", "_", "[", "]",
	            "}", "<", ">", "~", "+", "=", ",", "."
	        ));
	    }

	    $charsLen = count($chars) - 1;
	    shuffle($chars);                            //打乱数组顺序
	    $str = '';
	    for($i=0; $i<$len; $i++){
	        $str .= $chars[mt_rand(0, $charsLen)];    //随机取出一位
	    }
	    return $str;
	}

    /**
     * 判断路径是否存在不存在则创建
     * @param $dir
     * @param int $mode
     * @return bool
     */
    public static function mkdirs($dir, $mode = 0777)
    {
        if (is_dir($dir) || @mkdir($dir, $mode)) return TRUE;
        if (!self::mkdirs(dirname($dir), $mode)) return FALSE;
        return @mkdir($dir, $mode);
    }

}