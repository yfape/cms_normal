<?php
use think\Route;
//v1
Route::get('nav','index/Nav/getNav');
Route::get('home','index/Page/getHome');
Route::get('listfirst/:cid','index/Page/listfirst');
Route::get('list/:cid/:page','index/Page/getlist');
Route::get('article/:aid','index/Page/getArticle');
Route::get('magazines','index/Page/getMagazines');
Route::get('magazine/:zid','index/Page/getMagazine');
Route::get('topics','index/Page/getTopics');
Route::get('topic/:tid','index/Page/getTopic');
Route::get('search/:search','index/Page/search');