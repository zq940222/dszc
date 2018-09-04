<?php

// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;

//获取广告图
Route::get('api/:version/banner/:id', 'api/:version.Banner/getBanner');
//微信授权登录
Route::post('api/:version/token/user','api/:version.Token/getToken');
//早餐分类
Route::get('api/:version/dish/category','api/:version.Category/getAllDish');
//餐品详情
Route::get('api/:version/dish/detail/:id','api/:version.Dish/getDetail');