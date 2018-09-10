<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/7
 * Time: 14:21
 */

namespace app\api\model;


class SpecGoodsPrice extends BaseModel
{
    protected $hidden = ['createtime','updatetime','status'];

    public function getImageAttr($value)
    {
        return $this->prefixImgUrl($value);
    }
}