<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/12
 * Time: 16:09
 */

namespace app\api\validate;


class UserInfoNew extends BaseValidate
{
    protected $rule = [
        'nickname' => 'require|isNotEmpty',
        'avatar' => 'require|isNotEmpty',
        'gender' => 'require'
    ];

    protected $message = [
        'nickname' => '昵称不能为空',
        'avatar' => '头像不能为空',
        'gender' => '性别不能为空'
    ];
}