<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/9
 * Time: 16:59
 */

namespace app\api\validate;


class GoodsNew extends BaseValidate
{
    protected $rule = [
        'nickname' => 'require|isNotEmpty',
        'address' => 'require|isNotEmpty',
        'mobile' => 'require|isMobile',
        'company_name' => 'require|isNotEmpty',
        'goods_name' => 'require|isNotEmpty',
        'goods_intro' => 'require|isNotEmpty',
        'goods_images' => 'require'
    ];

    protected $message = [
        'nickname' => '姓名不能为空',
        'address' => '地址不能为空',
        'mobile' => '手机号不正确',
        'company_name' => '公司名称不能为空',
        'goods_name' => '产品名称不能为空',
        'goods_intro' => '产品简介不能为空',
        'goods_images' => '图片参数错误'
    ];
}