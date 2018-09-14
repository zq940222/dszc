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
//获取精选分类
Route::get('api/:version/goods/category','api/:version.Goods/getAllCategory');
//人气推荐
Route::get('api/:version/goods/recommend','api/:version.Goods/getRecommendGoods');
//热门搜索
Route::get('api/:version/hot_search','api/:version.Goods/hotSearch');
//商品列表
Route::get('api/:version/goods/list','api/:version.Goods/getGoodsList');
//商品详情
Route::get('api/:version/goods/:id','api/:version.Goods/getDetail',[],['id'=>'\d+']);
//商品评价
Route::get('api/:version/goods/comment/:id','api/:version.Goods/getComment');
//我的资料
Route::get('api/:version/my_info','api/:version.Personal/info');
//更新性别
Route::put('api/:version/gender','api/:version.Personal/editGender');
//更新生日
Route::put('api/:version/birthday','api/:version.Personal/editBirthday');
//发送验证码
Route::post('api/:version/send_code','api/:version.Personal/sendCode');
//绑定手机号
Route::post('api/:version/bing_mobile','api/:version.Personal/bindMobile');
//地址列表
Route::get('api/:version/address','api/:version.Address/getAddressList');
//添加地址
Route::post('api/:version/address','api/:version.Address/addAddress');
//编辑地址
Route::put('api/:version/address/:id','api/:version.Address/editAddress');
//删除地址
Route::delete('api/:version/address/:id','api/:version.Address/deleteAddress');
//设置默认地址
Route::put('api/:version/default_address/:id','api/:version.Address/setDefaultAddress');
//我的优惠券
Route::get('api/:version/coupon/user','api/:version.Personal/coupon');
//骑手
Route::get('api/:version/horseman','api/:version.Personal/horseman');
//申请骑手
Route::post('api/:version/horseman','api/:version.Personal/applyHorseman');
//精选
Route::get('api/:version/handpick','api/:version.Personal/goods');
//申请精选
Route::post('api/:version/handpick','api/:version.Personal/applyGoods');
//客服
Route::get('api/:version/customer_service','api/:version.Personal/customerService');
//早餐订单
Route::get('api/:version/order/dish','api/:version.Order/getDishOrderList');
//早餐订单详情
Route::get('api/:version/dish_order/:id','api/:version.Order/getDishOrderDetail',[],['id' => '\d+']);
//精选订单
Route::get('api/:version/order/handpick','api/:version.Order/getGoodsOrderList');
//精选订单详情
Route::get('api/:version/handpick_order/:id','api/:version.Order/getGoodsOrderDetail',[],['id' => '\d+']);
//早餐下单
Route::post('api/:version/dish_order/place','api/:version.Order/placeDishOrder');
//精选下单
Route::post('api/:version/goods_order/place','api/:version.Order/placeGoodsOrder');
//精选提交评价
Route::post('api/:version/comment','api/:version.Order/comment');
//确认收货
Route::put('api/:version/confirm_receipt/:id','api/:version.Order/confirmReceipt');
//删除早餐订单
Route::delete('api/:version/dish_order/:id','api/:version.Order/deleteDishOrder');
//删除精选订单
Route::delete('api/:version/goods_order/:id','api/:version.Order/deleteGoodsOrder');
//更新用户信息
Route::post('api/:version/user_info','api/:version.Personal/editUserInfo');
//上传
Route::post('api/:version/upload','api/:version.Upload/upload');
//登录获取优惠券列表
Route::get('api/:version/coupon_list/by_login','api/:version.Coupon/getCouponList');
//下单送优惠券弹窗
Route::get('api/:version/get_coupon/by_order','api/:version.Coupon/getOrderSendCoupon');
//绑定手机号送优惠券弹窗
Route::get('api/:version/get_coupon/by_bind_mobile','api/:version.Coupon/getBindMobileSendCoupon');
//早餐支付
Route::post('api/:version/pay/dish_order','api/:version.Pay/getDishPreOrder');
//精选支付
Route::post('api/:version/pay/goods_order','api/:version.Pay/getGoodsPreOrder');
//支付回调
Route::post('api/:version/pay/notify','api/:version.Pay/receiveNotify');