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
}