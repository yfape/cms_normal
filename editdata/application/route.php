<?php
use think\Route;
//v1
//登录
Route::post('v1/sendVerCode','v1/api.VerCode/sendVerCode',['before_behavior'=>'\app\v1\controller\service\CheckLogin']);
Route::post('v1/login','v1/api.Login/login',['before_behavior'=>'\app\v1\controller\service\CheckLogin']);

Route::group('v1',function(){

	//系统
	Route::post('getSystemInfo','v1/api.System/getSystemInfo');

	//用户
	Route::post('getUser','v1/api.User/getUser');
	Route::post('reviseSelf','v1/api.User/reviseSelf');
	Route::post('deleteUser','v1/api.User/deleteUser');
	Route::post('resetPass','v1/api.User/resetPass');
	Route::post('revisePass','v1/api.User/revisePass');

	//智能
	Route::post('textToAudio','v1/api.Intelligent/textToAudio');
	Route::post('textCensor','v1/api.Intelligent/textCensor');

	//栏目
	Route::post('getCol','v1/api.Col/getCol');
	Route::post('getCols','v1/api.Col/getCols');
	Route::post('changeColSort','v1/api.Col/changeColSort');
	Route::post('addCol','v1/api.Col/addCol');
	Route::post('changeValid','v1/api.Col/changeValid');
	Route::post('changeColAllSort','v1/api.Col/changeColAllSort');

	//文章
	Route::post('getArticleList','v1/api.Article/getArticleList');
	Route::post('addArticle','v1/api.Article/addArticle');
	Route::post('getArticle','v1/api.Article/getArticle');
	Route::post('saveArticle','v1/api.Article/saveArticle');
	Route::post('changeStatus','v1/api.Article/changeStatus');
	Route::post('deleteArticle','v1/api.Article/deleteArticle');

	//上传
	Route::post('uploadImg','v1/api.Upload/uploadImg');

	//管理
	Route::post('getUsers','v1/api.User/getUsers');
	Route::post('reviseUser','v1/api.User/reviseUser');
	Route::post('addUser','v1/api.User/addUser');
	Route::post('deleteUser','v1/api.User/deleteUser');
	Route::post('resetPass','v1/api.User/resetPass');

	//导航
	Route::post('getNav','v1/api.Nav/getNav');
	Route::post('saveNav','v1/api.Nav/saveNav');
	Route::post('refleshNav','v1/api.Nav/refleshNav');

	//模块
	Route::post('getMods','v1/api.Mod/getMods');
	Route::post('saveMod','v1/api.Mod/saveMod');
	

	//页面
	Route::post('saveHome','v1/api.Page/saveHome');

	//杂志
	Route::post('getMagazines','v1/api.Magazine/getMagazines');
	Route::post('getMagazine','v1/api.Magazine/getMagazine');
	Route::post('saveMagazine','v1/api.Magazine/saveMagazine');
	Route::post('addMagazine','v1/api.Magazine/addMagazine');
	Route::post('deleteMagazine','v1/api.Magazine/deleteMagazine');
	Route::post('changeMagazineValid','v1/api.Magazine/changeValid');

	//专题
	Route::post('getTopics','v1/api.Topic/getTopics');
	Route::post('getTopic','v1/api.Topic/getTopic');
	Route::post('saveTopic','v1/api.Topic/saveTopic');
	Route::post('addTopic','v1/api.Topic/addTopic');
	Route::post('deleteTopic','v1/api.Topic/deleteTopic');
	Route::post('changeTopicValid','v1/api.Topic/changeValid');

	//datacenter
	Route::post('getDataCenter','v1/api.System/getDataCenter');

},['before_behavior'=>'\app\v1\controller\service\CheckToken']);


//redis刷新
Route::post('refleshRedis','v1/api.Emergency/refleshRedis');
Route::get('refleshRedis','v1/api.Emergency/refleshRedis');
Route::post('importArticle','v1/api.Emergency/importArticle');
