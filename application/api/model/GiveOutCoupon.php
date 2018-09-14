<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/13
 * Time: 16:29
 */

namespace app\api\model;


use think\Db;

class GiveOutCoupon extends BaseModel
{
    protected $hidden = ['id','status','createtime','updatetime'];

    public static function drawCoupon($uid, $coupon_id)
    {
        Db::name('CouponUser')->insert([
            'user_id' => $uid,
            'coupon_id' => $coupon_id
        ]);
        $couponModel = self::get($coupon_id);
        if ($couponModel->type == 1)
        {
            UserCoupon::where('user_id',$uid)->where('status',1)->save(['status'=>0]);
        }
        $userCouponModel = new UserCoupon();
        $userCouponModel->type = $couponModel->type;
        $userCouponModel->user_id = $uid;
        $userCouponModel->price = $couponModel->price;
        $userCouponModel->stime = date('Y-m-d',time());
        $userCouponModel->etime = date('Y-m-d',strtotime('+' .$couponModel->expiry_date.'day'));
        $userCouponModel->name = $couponModel->name;
        $userCouponModel->desc = $couponModel->desc;
        $userCouponModel->save();
        return true;
    }
}