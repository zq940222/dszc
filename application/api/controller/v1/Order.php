<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/10
 * Time: 8:37
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\library\ApiException;
use app\api\library\Success;
use app\api\model\DishOrder;
use app\api\service\CommentService;
use app\api\service\DishOrderService;
use app\api\service\GoodsOrderService;
use app\api\validate\CommentNew;
use app\api\validate\IDMustBePostiveInt;
use app\api\validate\OrderPlace;
use app\api\validate\PagingParameter;
use app\api\service\Token as TokenService;
use app\api\model\Order as OrderModel;

class Order extends BaseController
{
    public function getDishOrderList($page = 1, $size = 10)
    {
        (new PagingParameter())->goCheck();

        $uid = TokenService::getCurrentUid();
        $pagingOrders = DishOrder::getSummaryByUser($uid, $page, $size);
        return $pagingOrders;
    }

    public function getDishOrderDetail($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $orderDetail = DishOrder::get($id,['item']);
        if (!$orderDetail) {
            throw new ApiException(['msg' => '此订单不存在']);
        }
        return $orderDetail
            ->hidden(['prepay_id','pay_time','item.id','item.order_id','item.dish_id','item.createtime','item.updatetime']);
    }

    public function placeDishOrder()
    {
        (new OrderPlace())->goCheck();
        $products = input('post.products/a');
        $address_id = input('post.address_id/d');
        $coupon_id = input('post.coupon_id/d',0);

        $uid = TokenService::getCurrentUid();

        $order = new DishOrderService();
        $order->setUserId($uid);
        $order->setProducts($products);
        $order->setAddress($address_id);
        $order->setCoupon($coupon_id);
        $result = $order->placeOrder();
        return $result;
    }

    public function getGoodsOrderList($page = 1, $size = 10)
    {
        (new PagingParameter())->goCheck();

        $uid = TokenService::getCurrentUid();
        $pagingOrders = OrderModel::getSummaryByUser($uid, $page, $size);
        return $pagingOrders;
    }

    public function getGoodsOrderDetail($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $orderDetail = OrderModel::get($id,['item']);
        if (!$orderDetail) {
            throw new ApiException(['msg' => '此订单不存在']);
        }
        return $orderDetail
            ->hidden(['prepay_id','pay_time','item.id','item.order_id','item.createtime','item.updatetime']);
    }

    public function placeGoodsOrder()
    {
        (new OrderPlace())->goCheck();
        $products = input('post.products/a');
        $address_id = input('post.address_id/d');
        $coupon_id = input('post.coupon_id/d',0);

        $uid = TokenService::getCurrentUid();

        $order = new GoodsOrderService();
        $order->setUserId($uid);
        $order->setProducts($products);
        $order->setAddress($address_id);
        $order->setCoupon($coupon_id);
        $result = $order->placeOrder();
        return $result;
    }

    public function comment()
    {
        (new CommentNew())->goCheck();
        $comments = input('post.comments/a');
        $order_id = input('post.order_id/d');
        $uid = TokenService::getCurrentUid();
        $commentService = new CommentService();
        $commentService->setUser($uid);
        $res = $commentService->comments($comments);
        if (!$res)
        {
            throw new ApiException(['msg' => '评论失败']);
        }else{
            OrderModel::update(['status'=> 5],['id'=>['=',$order_id]]);
            return json(new Success(['msg' => '评论成功']));
        }
    }

    public function confirmReceipt($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $uid = TokenService::getCurrentUid();
        $model = OrderModel::get($id);
        if ($model->status != 3)
        {
            throw new ApiException(['msg' => '请勿重复操作']);
        }
        if ($model->user_id != $uid)
        {
            throw new ApiException(['msg' => '你没有权限这么做']);
        }
        $model->status = 4;
        $model->save();
        return json(new Success(['msg' => '已收货']));
    }

    public function deleteDishOrder($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $uid = TokenService::getCurrentUid();
        $model = DishOrder::get($id);

        if ($model->user_id != $uid)
        {
            throw new ApiException(['msg' => '你没有权限这么做']);
        }
        $model->delete();
        return json(new Success(['msg' => '已删除']));
    }

    public function deleteGoodsOrder($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $uid = TokenService::getCurrentUid();
        $model = OrderModel::get($id);

        if ($model->user_id != $uid)
        {
            throw new ApiException(['msg' => '你没有权限这么做']);
        }
        $model->delete();
        return json(new Success(['msg' => '已删除']));
    }
}