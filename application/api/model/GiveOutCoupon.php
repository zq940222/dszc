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
        Db::name('GiveOutCouponUser')->insert([
            'user_id' => $uid,
            'give_out_coupon_id' => $coupon_id
        ]);
        $couponModel = self::get($coupon_id);
        if ($couponModel['type'] == 1)
        {
            UserCoupon::where('user_id',$uid)->where('status',1)->save(['status'=>0]);
        }
        UserCoupon::create([
            'type' => $couponModel['type'],
            'user_id' => $uid,
            'price' => $couponModel['price'],
            'stime' => date('Y-m-d',time()),
            'etime' => date('Y-m-d',strtotime('+' .$couponModel['expiry_date'].'day')),
            'name' => $couponModel['name'],
            'desc' => $couponModel['desc']
        ]);
        return true;
    }
}