<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/9
 * Time: 15:11
 */

namespace app\api\validate;


class AddressNew extends BaseValidate
{
    protected $rule = [
        'consignee' => 'require|isNotEmpty',
        'mobile' => 'require|isMobile',
        'city' => 'require|isNotEmpty',
        'detail' => 'require|isNotEmpty'
    ];

    protected $message = [
        'consignee' => '收货人不能为空',
        'mobile' => '手机号不正确',
        'city' => '城市不能为空',
        'detail' => '详细地址不能为空'
    ];
}