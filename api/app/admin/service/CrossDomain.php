<?php
declare (strict_types = 1);

namespace app\admin\service;

class CrossDomain  extends \think\Service
{

    /**
     * 注册服务
     *
     * @return mixed
     */
    public function register()
    {
    	//
    }

    
    /**
     * 执行服务
     *
     * @return mixed
     */
    public function boot()
    {
        header("Access-Control-Allow-Credentials:true");
        header("Access-Control-Allow-Origin:*");
        header("Access-Control-Allow-Method:*");
        header("Access-Control-Allow-Headers:*");
        if(strtoupper($_SERVER['REQUEST_METHOD'])== 'OPTIONS'){ 
            return true;
        }
    }
}
