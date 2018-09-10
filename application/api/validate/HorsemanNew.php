<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/9
 * Time: 16:48
 */

namespace app\api\validate;


class HorsemanNew extends BaseValidate
{
    protected $rule = [
        'nickname' => 'require|isNotEmpty',
        'mobile' => 'require|isMobile',
    ];

    protected $message = [
        'nickname' => '申请人不能为空',
        'mobile' => '手机号不正确',
    ];
}