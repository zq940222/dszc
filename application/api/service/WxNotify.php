<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/5/3
 * Time: 15:15
 */

namespace app\api\service;

use app\api\model\UserCoupon;
use think\Db;
use think\Exception;
use think\Loader;
use think\Log;

Loader::import('WxPay.WxPay',EXTEND_PATH,'.Api.php');

class WxNotify extends \WxPayNotify
{

    protected $model;

    public function NotifyProcess($data, &$msg)
    {
        if ($data['result_code'] == 'SUCCESS')
        {
            if ($data['attach'] == 'dish')
            {
                $this->model = model('DishOrder');
            }else if($data['attach'] == 'goods')
            {
                $this->model = model('Order');
            }
            $orderSn = $data['out_trade_no'];
            Db::startTrans();
            try
            {
                $order = $this->model->where('order_sn','=',$orderSn)
                    ->lock(true)
                    ->find();
                if ($order->status == 1)
                {
                    $order->save([
                        'status' => 2,
                        'pay_time' => time()
                    ]);
                    //TODO::赠送优惠券
                    if ($data['attach'] == 'dish') {

                        UserCoupon::getOrderSendCoupon($order->user_id);
                    }
                }
                Db::commit();
                return true;
            }
            catch (Exception $ex)
            {
                Db::rollback();
                Log::error($ex);
                return false;
            }
        }
        else{
            // 不再发送消息
            return true;
        }
    }

}