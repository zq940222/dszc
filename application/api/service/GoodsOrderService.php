<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/11
 * Time: 15:31
 */

namespace app\api\service;


use app\api\library\ApiException;
use app\api\model\Goods;
use app\api\model\Order;
use app\api\model\OrderGoods;
use app\api\model\SpecGoodsPrice;
use app\api\model\UserAddress;
use app\api\model\UserCoupon;
use think\Db;
use think\Exception;

class GoodsOrderService extends OrderService
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
    //产品总金额
    protected $productTotalPrice = 0;
    //订单金额
    protected $orderTotalPrice = 0;
    //实付金额
    protected $payPrice = 0;
    //商品数量
    protected $productCount = 0;
    //运费
    protected $shippingPrice = 0;

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
            if ($coupon['user_id'] != $this->uid)
            {
                throw new ApiException(['msg' => '你没有该优惠券使用权']);
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
        $address = UserAddress::get($address_id)->toArray();
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
            $order = new Order();
            $order->user_id = $this->uid;
            $order->order_sn = $orderSn;
            $order->goods_count = $this->productCount;
            $order->product_total_price = $this->productTotalPrice;
            $order->order_total_price = $this->orderTotalPrice;
            $order->shipping_price = $this->shippingPrice;
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
            $orderDish = new OrderGoods();
            $orderDish->saveAll($this->products);
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
            $goodsModel = Goods::where('status',1)->where('is_on_sale',1)->find($item['product_id']);
            if (!$goodsModel)
            {
                throw new ApiException(['msg' => '商品ID为'. $item['product_id'] .'的商品不存在']);
            }
            $model = SpecGoodsPrice::where('goods_id',$item['product_id'])->where('key',$item['key'])->where('status',1)->field(['goods_id','key','key_name','price','image'])->find();
            if (!$model)
            {
                throw new ApiException(['msg' => '第'. $key+1 .'个商品不存在',]);
            }

            $products[$key]['goods_id'] = $item['product_id'];
            $products[$key]['spec_key'] = $item['key'];
            $products[$key]['goods_name'] = $goodsModel['name'];
            $products[$key]['goods_image'] = $goodsModel['cover_image'];
            $products[$key]['goods_price'] = $model['price'];
            $products[$key]['goods_num'] = $item['count'];
            $products[$key]['spec_key_name'] = $model['key_name'];
            $this->productTotalPrice += $model['price'] * $item['count'];
            $this->orderTotalPrice += $model['price'] * $item['count'] + $goodsModel['freight'] * $item['count'];
            $this->payPrice += $model['price'] * $item['count'] + $goodsModel['freight'] * $item['count'];
            $this->shippingPrice += $goodsModel['freight'] * $item['count'];
            $this->productCount += $item['count'];
        }

        return $products;
    }
}