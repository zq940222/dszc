<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/8
 * Time: 18:10
 */

namespace app\api\model;


class UserAddress extends BaseModel
{
    protected $autoWriteTimestamp =true;

    protected $hidden = ['status','createtime','updatetime'];

    protected $createTime = 'createtime';

    protected $updateTime = 'updatetime';

    public function getCityAttr($value)
    {
        return explode('/',$value);
    }

    public function setCityAttr($value)
    {
        return implode('/',$value);
    }
}