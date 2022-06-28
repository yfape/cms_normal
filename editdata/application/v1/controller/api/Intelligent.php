<?php
namespace app\v1\controller\api;
use think\Request;
use think\Controller;

use BaiduApi\AipImageCensor;
use BaiduApi\AipNlp;
use BaiduApi\AipSpeech;
use FFMpeg\FFMpeg;


class Intelligent extends Controller{

	protected $appid;
	protected $appkey;
	protected $appsecret;

	public function _initialize(){
		$this->appid = config('baidu.appid');
		$this->appkey = config('baidu.appkey');
		$this->appsecret = config('baidu.appsecret');
	}

	public function textCensor(){
		$basecontent = Request::instance()->post('content');
		$content = $this->formateContent($basecontent,1400);
		$client = new AipImageCensor($this->appid,$this->appkey,$this->appsecret);
		$textcensor = $client->textCensorUserDefined($content);

		$content = $this->formateContent($basecontent,250);
		$client = new AipNlp($this->appid,$this->appkey,$this->appsecret);
		$ecnet = $client->ecnet($content);

		return ['code'=>200,'msg'=>'审核成功','data'=>['textcensor'=>$textcensor?$textcensor:true,'ecnet'=>$ecnet?$ecnet:true]];
	}

	public function textToAudio(){
		$basecontent = Request::instance()->post('content');
		$content = $this->formateContent($basecontent,512);

		$client = new AipSpeech($this->appid,$this->appkey,$this->appsecret);

		$audioarr = [];
		foreach ($content as $key => $value) {
			$result = $client->synthesis($value, 'zh', 1, array(
			    'vol' => 5, 'per' => 1
			));

			if(!is_array($result)){
				$id = uniqid();
				$dir = ROOT_PATH.config('upload.moveaddr').'/audio/'.date('Ymd');
				$url = $dir.'/'.$id.'.mp3';
				$url = str_replace("\\","/",$url);

				if(!is_dir($dir)){
					mkdir($dir,0777,true);
				}

			    file_put_contents($url, $result);
			   	array_push($audioarr, $url);
			}
		}

		$resaudio = $this->mergeMp3($audioarr);

		foreach ($audioarr as $key => $value) {
			unlink($value);
		}

		return ['code'=>200,'msg'=>'音频转化成功','data'=>$resaudio];
	}

	public function mergeMp3($audioarr){
		$path = [
		    'ffmpeg.binaries'  => 'E://phpstudy_pro/Extensions/ffmpeg/bin/ffmpeg.exe',
		    'ffprobe.binaries' => 'E://phpstudy_pro/Extensions/ffmpeg/bin/ffprobe.exe'
		];
		$facts = FFMpeg::create($path);
		$audio1 = $facts->open($audioarr[0]);

		$id = uniqid();
		$dir = ROOT_PATH.config('upload.moveaddr').'/audio/'.date('Ymd');
		$url = $dir.'/'.$id.'.mp3';
		$url = str_replace("\\","/",$url);
		if(!is_dir($dir)){
			mkdir($dir,0777,true);
		}

		$audio1->concat($audioarr)->saveFromSameCodecs($url, TRUE);
		return config('domain.file').'/audio/'.date('Ymd').'/'.$id.'.mp3';
	}

	protected function formateContent($content,$num){
		$content = htmlspecialchars_decode($content);
        $content = $this->cutstr_html($content);
        $content = $this->StringToText($content,20000);
        $textarr = $this->utf8_str_split($content,$num);
        return $textarr;
	}

	protected function cutstr_html($string){  
	    $string = strip_tags($string);  
	    $string = trim($string);  
	    // $string = ereg_replace("\t","",$string);  
	    // $string = ereg_replace("\r\n","",$string);  
	    // $string = ereg_replace("\r","",$string);  
	    // $string = ereg_replace("\n","",$string);  
	    // $string = ereg_replace(" ","",$string);
	    return trim($string);  
	}
	protected function StringToText($string,$num){
	    if($string){
	        //把一些预定义的 HTML 实体转换为字符
	        $html_string = htmlspecialchars_decode($string);
	        //将空格替换成空
	        $content = str_replace(" ", "", $html_string);
	        //函数剥去字符串中的 HTML、XML 以及 PHP 的标签,获取纯文本内容
	        $contents = strip_tags($content);
	        //返回字符串中的前$num字符串长度的字符
	        return mb_strlen($contents,'utf-8') > $num ? mb_substr($contents, 0, $num, "utf-8").'....' : mb_substr($contents, 0, $num, "utf-8");
	    }else{
	        return $string;
	    }
	}
	protected function utf8_str_split($str, $split_len = 1){
	    if (!preg_match('/^[0-9]+$/', $split_len) || $split_len < 1)
	        return FALSE;
	 
	    $len = mb_strlen($str, 'UTF-8');
	    if ($len <= $split_len)
	        return array($str);
	 
	    preg_match_all('/.{'.$split_len.'}|[^\x00]{1,'.$split_len.'}$/us', $str, $ar);
	 
	    return $ar[0];
	}
}