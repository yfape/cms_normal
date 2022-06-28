<?php
declare (strict_types = 1);

namespace app\admin\middleware;
use app\admin\controller\assist\IPwhite;

class CheckIP{
    /**
     * 处理请求
     *
     * @param \think\Request $request
     * @param \Closure       $next
     * @return Response
     */
    public function handle($request, \Closure $next)
    {
        $ipwhite = new IPwhite;
        $res = $ipwhite->isExist($request->ip());
        return $res ? $next($request) : err('非法请求0',998);
    }
}
