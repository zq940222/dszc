<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/8
 * Time: 13:38
 */

namespace app\api\validate;


class MobileNumber extends BaseValidate
{
    protected $rule = [
        'mobile' => 'require|isMobile'
    ];

    protected $message = [
        'mobile' => '手机号码不正确'
    ];
}