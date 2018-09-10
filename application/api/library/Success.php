<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/7
 * Time: 17:18
 */

namespace app\api\library;


class Success extends ApiException
{
    public $code = 201;
    public $msg = 'ok';
    public $errorCode = 0;
}