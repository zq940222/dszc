<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/1
 * Time: 16:39
 */

namespace app\api\model;


class Dish extends BaseModel
{
    protected $hidden = ['category_id','status','createtime','updatetime'];

    // 追加属性
    protected $append = [
        'num'
    ];

    public function getNumAttr()
    {
        return 0;
    }


    public function getDishImageAttr($value)
    {
        return $this->prefixImgUrl($value);
    }

}