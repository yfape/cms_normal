<?php
declare (strict_types = 1);

namespace app\web\middleware;
use think\facade\Db;

class ViewNum
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
        $date = date('Y-m-d');
        $this->viewnumToday($date);
        $url = $request->baseUrl();
        return $next($request);
    }

    protected function viewnumToday($date){
        $inc = rand(1,20);

        $m = app('rhash')->setTable('viewnum_today')->setKey(1)->get();

        if(!$m){
            $today = $inc;
            $mobj = Db::table('viewnum')->where('indate',$date)->find();
            if(isset($mobj['num'])){
                $today = $mobj['num'];
            }
            app('rhash')->setTable('viewnum_today')->setKey(1)->set([
                'date'=>$date,
                'num'=>$today
            ]);
        }else{
            if($date != $m['date']){
                $res = Db::table('viewnum')->where('indate',$m['date'])->find();
                if($res){
                    Db::table('viewnum')->where('indate',$m['date'])->update(['num'=>$m['num']]);
                }else{
                    Db::table('viewnum')->insert(['indate'=>$m['date'],'num'=>$m['num']]);
                }
                app('rhash')->setTable('viewnum_today')->setKey(1)->set([
                    'num'=>$inc,
                    'date'=>$date,
                ]);
            }else{
                app('rhash')->setTable('viewnum_today')->setKey(1)->set([
                    'num'=>$m['num']+$inc,
                ]);
            }
        }
    }
}
