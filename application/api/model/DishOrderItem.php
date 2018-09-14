<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/10
 * Time: 10:53
 */

namespace app\api\model;


class DishOrderItem extends BaseModel
{
    protected $hidden = ['createtime','updatetime'];

    protected $autoWriteTimestamp = true;

    protected $createTime = 'createtime';

    protected $updateTime = 'updatetime';
}