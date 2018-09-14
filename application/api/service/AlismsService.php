<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/8
 * Time: 14:06
 */

namespace app\api\service;


use app\api\library\ApiException;

class AlismsService
{
    public static function generateCode($length = 6) {
        return rand(pow(10,($length-1)), pow(10,$length)-1);
    }

    public static function checkCode($mobile,$code)
    {

        if ($code != cache($mobile)) {
            throw new ApiException(['msg' => '验证码不正确']);
        }
        return true;
    }
}