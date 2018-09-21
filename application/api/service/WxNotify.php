<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/5/3
 * Time: 15:15
 */

namespace app\api\service;

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
            $orderNo = $data['out_trade_no'];
            Db::startTrans();
            try
            {
                $order = $this->model->where('order_no','=',$orderNo)
                    ->lock(true)
                    ->find();
                if ($order->status == 1)
                {
                    $this->updateOrderStatus($order->id);
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

//    private function reduceStock($stockStatus)
//    {
//        foreach ($stockStatus['pStatusArray'] as $singlePStatus)
//        {
//            Product::where('id','=',$singlePStatus['id'])
//                ->setDec('stock',$singlePStatus['count']);
//        }
//    }
//
//    private function updateOrderStatus($orderID, $success)
//    {
//        $status = $success ? OrderStatusEnum::PAID : OrderStatusEnum::PAID_BUT_OUT_OF;
//        OrderModel::where('id','=',$orderID)
//            ->update(['status'=>$status]);
//    }

    private function updateOrderStatus($orderID)
    {
        $this->model->save([
            'status' => 2,
            'pay_time' => time()
        ],['id' => $orderID]);
    }
}