<?php
declare (strict_types = 1);

namespace app\web\middleware;
use think\facade\Db;

class Member
{
    /**
     * 处理请求
     *
     * @param \think\Request $request
     * @param \Closure       $next
     * @return Response
     */
    public function handle($request, \Closure $next)
    {
        $url = $request->baseUrl();
        if($url == '/nav'){
            $isuser = $request->get('isuser');
            if(!$isuser){
                $this->incUser();
            }
        }
        return $next($request);
    }

    protected function incUser(){
        $date = date('Y-m-d');
        $inc = rand(1,10);
        $m = app('rhash')->setTable('member')->setKey('1')->get();

        if(!$m){
            $num = Db::table('member')->count('num');
            app('rhash')->setTable('member')->setKey('1')->set([
                'num'=>$num+$inc,
                'date'=>$date,
                'today'=>$inc
            ]);
        }else{
            if($date != $m['date']){
                $res = Db::table('member')->where('indate',$m['date'])->find();
                if($res){
                    Db::table('member')->where('indate',$m['date'])->update(['num'=>$m['today']]);
                }else{
                    Db::table('member')->insert(['indate'=>$m['date'],'num'=>$m['today']]);
                }
                app('rhash')->setTable('member')->setKey('1')->set([
                    'num'=>$m['num']+$inc,
                    'date'=>date('Y-m-d'),
                    'today'=>$inc
                ]);
            }else{
                app('rhash')->setTable('member')->setKey('1')->set([
                    'num'=>$m['num']+$inc,
                    'today'=>$m['today']+$inc,
                ]);
            }
        }
    }
}
