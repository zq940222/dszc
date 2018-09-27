<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/9/18
 * Time: 15:02
 */

namespace app\api\model;


class DishSpecItem extends BaseModel
{
    protected $hidden = ['status','createtime','updatetime'];

    // 追加属性
    protected $append = [
        'num',
        'isselect'
    ];

    public function getNumAttr()
    {
        return 0;
    }

    public function getIsselectAttr()
    {
        return 0;
    }
}