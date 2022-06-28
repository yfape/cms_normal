<?php
// +----------------------------------------------------------------------
// | 应用设置
// +----------------------------------------------------------------------

return [
    'auth' => [
    	'expire' => 14400,
        'salt' => 'liuliu7456',
        'jsclass' => ['HS256'],
        'aud' => 'www.scdjw.net',
        'iss' => 'api.scdjw.net',
    ],
    'loginsalt' => 'liuliu7456&$%^',
    'identitys' => [
        1 => '系统管理员',
        2 => '审核员',
        3 => '网站管理员',
        4 => '编辑'
    ],
    'astatus' => [
        0 => '草稿箱',
        1 => '未审核',
        10 => '已审核'
    ],
    'astyle' => [1,2,3],
    'baidu' => [
        'appid' => '19330339',
        'appkey' => 'K4K5HSOvlGeCy0XWCyGyogV4',
        'appsecret' => 'EXLqGHtMb0pqBrrVYNc7IPe20V90lGSI'
    ],
    'xunfei' => [
        'appid' => '5dfdeebc',
        'apikey' => 'af8f57ba50fbbb8716eecb37409224cf',
        'apisecret' => 'bb08788b682e80d69d9c4726167ebe6d',
    ],
    'file' => 'E://phpstudy_pro/WWW/scdjw/api/file',
    'ffmpeg' => 'E://phpstudy_pro/Extensions/ffmpeg/bin/ffmpeg.exe',
];
