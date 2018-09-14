<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/14
 * Time: 9:57
 */

namespace app\api\service;


use app\api\library\ApiException;
use app\api\model\DishOrder;
use app\api\model\Order;
use think\Exception;
use think\Loader;
use think\Log;

Loader::import('WxPay.WxPay',EXTEND_PATH,'.Api.php');

class WxPayService
{
    private $orderID;
    private $orderNO;
    private $model;

    function __construct($orderID)
    {
        if (!$orderID){
            throw new Exception('订单号不允许为NULL');
        }
        $this->orderID = $orderID;
    }

    public function dishPay()
    {
        $this->model = DishOrder::get($this->orderID);
        $this->checkOrderValid();

        return $this->makeWxPreOrder($this->model->pay_price);
    }

    public function goodsPay()
    {
        $this->model = Order::get($this->orderID);
        $this->checkOrderValid();

        return $this->makeWxPreOrder($this->model->pay_price);
    }

    private function makeWxPreOrder($totalPrice)
    {
        // openid
        $openid = Token::getCurrentTokenVar('openid');
        if (!$openid){
            throw new ApiException(['msg' => '登录已过期']);
        }
        $wxOrderData = new \WxPayUnifiedOrder();
        $wxOrderData->SetOut_trade_no($this->orderNO);
        $wxOrderData->SetTrade_type('JSAPI');
        $wxOrderData->SetTotal_fee($totalPrice*100);
        $wxOrderData->SetBody('大山早餐');
        $wxOrderData->SetOpenid($openid);
        $wxOrderData->SetNotify_url(config('secure.pay_back_url'));
        return $this->getPaySignature($wxOrderData);
    }

    private function getPaySignature($wxOrderData)
    {
        $wxOrder = \WxPayApi::unifiedOrder($wxOrderData);
        if ($wxOrder['return_code'] != 'SUCCESS' || $wxOrder['result_code'] != 'SUCCESS'){
            Log::record($wxOrder,'error');
            Log::record('获取预支付订单失败','error');
//            throw new Exception('获取预支付订单失败');
        }
        //prepay_id
        $this->recordPreOrder($wxOrder);

        $signature = $this->sign($wxOrder);
        return $signature;
    }

    private function sign($wxOrder)
    {
        $jsApiPayData = new \WxPayJsApiPay();
        $jsApiPayData->SetAppid(config('wx.app_id'));
        $jsApiPayData->SetTimeStamp((string)time());

        $rand = md5(time().mt_rand(0,1000));
        $jsApiPayData->SetNonceStr($rand);

        $jsApiPayData->SetPackage('prepay_id='.$wxOrder['prepay_id']);
        $jsApiPayData->SetSignType('md5');

        $sign = $jsApiPayData->MakeSign();
        $rawValues = $jsApiPayData->GetValues();
        $rawValues['paySign'] = $sign;

        unset($rawValues['appId']);

        return $rawValues;
    }

    private function checkOrderValid()
    {

        if (!$this->model) {
            throw new ApiException(['msg' => '订单不存在']);
        }
        if (!Token::isValidOperate($this->model->user_id)) {
            throw new ApiException([
                'msg' => '订单与用户不匹配',
                'errorCode' => 10003
            ]);
        }
        if ($this->model->status != 1) {
            throw new ApiException([
                'msg' => '订单已支付过啦',
                'errorCode' => 80003,
                'code' => 400
            ]);
        }
        $this->orderNO = $this->model->order_no;
        return true;
    }
}