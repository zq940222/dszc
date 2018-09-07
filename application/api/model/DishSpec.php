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

    public function setItemAttr($value)
    {
        return json_decode($value);
    }

    public function getItemAttr($value)
    {

        $array = json_decode($value,true);
        foreach ($array as $v)
        {
            $data[] = [
                'name' => $v,
                'num' => 0
            ];
        }
        return $data;
    }
}