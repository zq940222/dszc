<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/4/26
 * Time: 10:30
 */

namespace app\api\validate;


class TokenGet extends BaseValidate
{
    protected $rule = [
        'code' => 'require|isNotEmpty'
    ];

    protected $message = [
        'code' => 'code不对噢'
    ];
}