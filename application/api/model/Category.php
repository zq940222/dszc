<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/1
 * Time: 16:43
 */

namespace app\api\model;


class Category extends BaseModel
{
    public static function getDish()
    {
        $data = self::with(['dish'])
            ->where(['type'=>'dish'])
            ->select();
        return $data;
    }
}