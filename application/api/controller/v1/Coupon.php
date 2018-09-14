<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/13
 * Time: 16:23
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\GiveOutCoupon;
use app\api\service\Token as TokenService;
use think\Db;
use app\api\model\Coupon as CouponModel;

class Coupon extends BaseController
{
    public function getCouponList()
    {
        $uid = TokenService::getCurrentUid();
        $ids =  Db::name('GiveOutCouponUser')->where('user_id','=',$uid)->column('give_out_coupon_id');
        $data = GiveOutCoupon::where('id','not in',$ids)
            ->where('status','=',1)
            ->where('stime','<=',date('Y-m-d',time()))
            ->where('etime','>=',date('Y-m-d',time()))
            ->select();
        foreach ($data as &$value)
        {
            $value['stime'] = date('Y-m-d',time());
            $value['etime'] = date('Y-m-d',strtotime('+' .$value->expiry_date.'day'));
            GiveOutCoupon::drawCoupon($uid,$value['id']);
        }
        return $data;
    }

    public function getOrderSendCoupon()
    {
        $data = CouponModel::where('type',1)->where('status',1)->find();

        $stime = date('Y-m-d',time());
        $etime = date('Y-m-d',strtotime('+' .$data->expiry_date.'day'));
        $data['stime'] = $stime;
        $data['etime'] = $etime;
        return $data;
    }

    public function getBindMobileSendCoupon()
    {
        $data = CouponModel::where('type',2)->where('status',1)->find();

        $stime = date('Y-m-d',time());
        $etime = date('Y-m-d',strtotime('+' .$data->expiry_date.'day'));
        $data['stime'] = $stime;
        $data['etime'] = $etime;
        return $data;
    }
}