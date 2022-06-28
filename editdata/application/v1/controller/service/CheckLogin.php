<?php
namespace app\v1\controller\service;
use think\Request;

class CheckLogin{

	protected $request;

	public function run(){
		$this->request = Request::instance();
		if(!$this->checkIp()){
			echo json_encode(getOut(1004));exit();
		}
		if(!$this->checkDomain()){
			echo json_encode(getOut(1005));exit();
		}
	}

	/**
	 * 检查请求ip是否在ip白名单中
	 * @return [boolean]
	 */
	protected function checkIp(){
		$ip = $this->request->ip();
		$ipwl = new IPWhitelist;
		return $ipwl->isMember($ip);
	}

	/**
	 * 检查请求域名是否正确
	 * @return [boolean]
	 */
	protected function checkDomain(){
		$domain = $this->request->server("HTTP_REFERER");
		$sysdomain = config('domain.web');
		if(strpos($domain,'http') !== false){
			$tempdomain = explode('/',$domain);
			$domain = $tempdomain[2];
		}
		return in_array($domain,$sysdomain)?true:false;
	}

}