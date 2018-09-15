<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/14
 * Time: 9:55
 */

namespace app\api\controller\v1;


use app\api\service\WxNotify;
use app\api\service\WxPayService;
use app\api\validate\IDMustBePostiveInt;

class Pay
{
    public function getDishPreOrder($id = '')
    {
        (new IDMustBePostiveInt())->goCheck();
        $pay = new WxPayService($id);
        return $pay->dishPay();
    }

    public function getGoodsPreOrder($id = '')
    {
        (new IDMustBePostiveInt())->goCheck();
        $pay = new WxPayService($id);
        return $pay->goodsPay();
    }

    public function receiveNotify()
    {
        $notify = new WxNotify();
        $notify->Handle();
    }
}