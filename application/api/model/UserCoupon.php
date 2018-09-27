<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/9
 * Time: 16:03
 */

namespace app\api\model;


class UserCoupon extends BaseModel
{
    protected $autoWriteTimestamp = true;

    protected $createTime = 'createtime';

    protected $updateTime = 'updatetime';

    protected $hidden = ['user_id','status','createtime','updatetime'];

    public static function getOrderSendCoupon($uid)
    {
        $data = Coupon::where('type',1)->where('status',1)->find();

        $stime = date('Y-m-d',time());
        $etime = date('Y-m-d',strtotime('+' .$data->expiry_date.'day'));

        if ($data['coupon_type'] == 1)
        {
            self::where('user_id',$uid)->where('status',1)->update(['status'=> 0]);
            self::create([
                'user_id' => $uid,
                'type' => $data['coupon_type'],
                'price' => $data['price'],
                'name' => $data['name'],
                'desc' => $data['desc'],
                'stime' => $stime,
                'etime' => $etime
            ]);
        }
        else if ($data['coupon_type'] == 2)
        {
            self::create([
                'user_id' => $uid,
                'type' => $data['coupon_type'],
                'price' => $data['price'],
                'name' => $data['name'],
                'desc' => $data['desc'],
                'stime' => $stime,
                'etime' => $etime
            ]);
        }
        return true;
    }

    public static function getBindMobileSendCoupon($uid)
    {
        $data = Coupon::where('type',2)->where('status',1)->find();

        $stime = date('Y-m-d',time());
        $etime = date('Y-m-d',strtotime('+' .$data->expiry_date.'day'));
        if ($data['coupon_type'] == 1)
        {
            self::where('user_id',$uid)->where('status',1)->update(['status'=> 0]);
            self::create([
                'user_id' => $uid,
                'type' => $data['coupon_type'],
                'price' => $data['price'],
                'name' => $data['name'],
                'desc' => $data['desc'],
                'stime' => $stime,
                'etime' => $etime
            ]);
        }
        else if ($data['coupon_type'] == 2)
        {
            self::create([
                'user_id' => $uid,
                'type' => $data['coupon_type'],
                'price' => $data['price'],
                'name' => $data['name'],
                'desc' => $data['desc'],
                'stime' => $stime,
                'etime' => $etime
            ]);
        }
        return true;
    }
}