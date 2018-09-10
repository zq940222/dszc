<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/7
 * Time: 14:20
 */

namespace app\api\model;


class Spec extends BaseModel
{
    protected $hidden = ['createtime','updatetime','status'];

    public function item()
    {
        return $this->hasMany('SpecItem','spec_id','id')->where('status',1);
    }
}