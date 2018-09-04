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

    public function getDishImageAttr($value)
    {
        return $this->prefixImgUrl($value);
    }

    public function spec()
    {
        return $this->hasMany('DishSpec','dish_id','id')->where('status',1);
    }
}