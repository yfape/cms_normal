<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Route;

Route::get('nav', 'Nav/nav');
Route::get('home', 'Page/home');
Route::get('list/:cid/[:page]','Lists/list');

Route::get('page/:pid', 'Page/page');
Route::get('article/:aid','index/Page/getArticle');
Route::get('magazines','index/Page/getMagazines');
Route::get('magazine/:zid','index/Page/getMagazine');
Route::get('topics','index/Page/getTopics');
Route::get('topic/:tid','index/Page/getTopic');
Route::get('search/:search','index/Page/search');