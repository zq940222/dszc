<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/10
 * Time: 15:52
 */

namespace app\api\service;


use app\api\library\ApiException;
use app\api\model\Dish;
use app\api\model\DishOrderItem;
use app\api\model\UserAddress;
use app\api\model\UserCoupon;
use think\Db;
use think\Exception;

class DishOrderService extends OrderService
{
    //订单的商品列表,
    protected $oProducts;
    //真实的商品信息
    protected $products;
    //地址
    protected $address;
    //收货人
    protected $consignee;
    //手机号
    protected $mobile;
    //优惠券ID
    protected $couponId = 0;
    //优惠券金额
    protected $couponPrice = 0;
    //订单金额
    protected $totalPrice = 0;
    //实付金额
    protected $payPrice = 0;
    //商品数量
    protected $productCount = 0;

    protected $uid;

    public function setUserId($uid)
    {
        $this->uid = $uid;
        return true;
    }

    public function setProducts($oProducts)
    {
        $this->oProducts = $oProducts;
        $this->products = $this->getProductsByOrder($oProducts);
        return true;
    }

    public function setCoupon($coupon_id)
    {
        if ($coupon_id)
        {
            $coupon = UserCoupon::get($coupon_id);
            if ($coupon['status'] != 1)
            {
                throw new ApiException(['msg' => '该优惠券不可用']);
            }
            if ($coupon['user_id'] != $this->uid)
            {
                throw new ApiException(['msg' => '你没有该优惠券使用权']);
            }
            if ($coupon['type'] != 1)
            {
                throw new ApiException(['msg' => '该优惠券不能在此场景使用']);
            }
            $this->couponId = $coupon_id;
            $this->couponPrice = $coupon['price'];
            $this->payPrice -= $coupon['price'];
            return true;
        }
        else
        {
            return true;
        }
    }

    public function setAddress($address_id)
    {
        $address = UserAddress::get($address_id);
        if ($address['user_id'] != $this->uid)
        {
            throw new ApiException(['msg' => '你没有该地址使用权限']);
        }
        $city = implode('',$address['city']);
        $this->address = $city.$address['detail'];
        $this->consignee = $address['consignee'];
        $this->mobile = $address['mobile'];
        return true;
    }

    public function placeOrder()
    {
        Db::startTrans();
        try{
            $orderSn = self::makeOrderSn();
            $order = new \app\api\model\DishOrder();
            $order->user_id = $this->uid;
            $order->order_sn = $orderSn;
            $order->product_count = $this->productCount;
            $order->total_price = $this->totalPrice;
            $order->pay_price = $this->payPrice;
            $order->coupon_id = $this->couponId;
            $order->coupon_price = $this->couponPrice;
            $order->consignee = $this->consignee;
            $order->address = $this->address;
            $order->mobile = $this->mobile;

            $order->save();
            $orderID = $order->id;
            foreach ($this->products as &$p){
                $p['order_id'] = $orderID;
            }
            $orderDish = new DishOrderItem();
            $orderDish->saveAll($this->products);

            UserCoupon::update(['status' => 2],['id' => $this->couponId]);
            Db::commit();
            return [
                'order_sn' => $orderSn,
                'order_id' => $orderID,
            ];
        }
        catch (Exception $ex){
            Db::rollback();
            throw $ex;
        }
    }

    private function getProductsByOrder($oProducts)
    {
        $products = [];
        foreach ($oProducts as $key =>  $item){
            $model = Dish::get($item['product_id']);
            if (!$model)
            {
                throw new ApiException(['msg' => '不存在id为'.$item['product_id'].'的商品',]);
            }

            $products[$key] = $model->hidden(['id','type','desc'])->toArray();
            unset($products[$key]['num']);
            $products[$key]['dish_id'] = $item['product_id'];
            $products[$key]['count'] = $item['count'];
            $products[$key]['spec_name'] = $item['key'];
            $this->totalPrice += $products[$key]['price'] * $item['count'];
            $this->payPrice += $products[$key]['price'] * $item['count'];
            $this->productCount += $item['count'];
        }

        return $products;
    }

}