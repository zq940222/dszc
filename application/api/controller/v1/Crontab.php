<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/9/27
 * Time: 15:34
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\UserCoupon;

class Crontab extends BaseController
{
    public function coupon()
    {
        //TODO::早餐优惠券一天减半,两天过期
        $this->refreshDishCoupons();
        //TODO::精选优惠券到期时间过期
        $this->refreshGoodsCoupons();
    }

    public function refreshDishCoupons()
    {
        $yestoday = mktime(0,0,0,date('m'),date('d')-1,date('Y'));;//昨天
        $beforeYestoday = mktime(0,0,0,date('m'),date('d')-2,date('Y'));;//前天
        $model = UserCoupon::where('type',1)
            ->where('status',1)
            ->where('createtime','<',$yestoday)
            ->where('createtime','>',$beforeYestoday)
            ->column('id,price');
        foreach ($model as $value)
        {
            UserCoupon::update(['price' => round($value['price']/2,2)],['id'=> $value['id']]);
        }
        return true;
    }

    public function refreshGoodsCoupons()
    {
        UserCoupon::where('type',2)
            ->where('status',1)
            ->where('etime','<=',date('Y-m-d'))
            ->isUpdate()
            ->saveAll(['status'=> 0]);
        return true;
    }
}