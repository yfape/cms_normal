<?php
namespace app\v1\controller\api;
use think\Controller;

use tool\ImgCompress;


class Upload extends Controller{
	protected function _initialize(){
		parent::_initialize();
	}

	/**
	 * 上传图片
	 * @return [type] [description]
	 */
	public function uploadImg(){
		$files = $this->request->file();
		$resarr = [];
		foreach ($files as $key => $file) {
	        $res = $this->move($file);
	        $res&&array_push($resarr,$res);
		}
		if(count($resarr)<1){
			return getOut(5001);
		}else{
			return ['code'=>200,'msg'=>'上传成功','data'=>$resarr];
		}
	}

	protected function move($file){
		$info = $file->validate(['size'=>config('upload.size'),'ext'=>config('upload.ext')])->move(ROOT_PATH .config('upload.moveaddr').'/image');
		if($info){
            $apurl = str_replace('\\','/',$info->getSaveName());
            return config('domain.file').'/image/'.$apurl;
        }else{
        	return false;
        }
	}

}