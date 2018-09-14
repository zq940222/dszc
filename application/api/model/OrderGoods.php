<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/11
 * Time: 15:29
 */

namespace app\api\model;


class OrderGoods extends BaseModel
{
    protected $hidden = ['createtime','updatetime'];

    protected $autoWriteTimestamp = true;

    protected $createTime = 'createtime';

    protected $updateTime = 'updatetime';
}