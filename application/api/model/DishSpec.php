<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/4
 * Time: 16:22
 */

namespace app\api\model;


class DishSpec extends BaseModel
{
    protected $hidden = ['status','createtime','updatetime'];

    public function specItem()
    {
        return $this->hasMany('DishSpecItem','dish_spec_id','id');
    }
}