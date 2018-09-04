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
    protected $visible = ['id','name','image','dish'];

    public function getImageAttr($value)
    {
        return $this->prefixImgUrl($value);
    }

    public function dish()
    {
        return $this->hasMany('Dish','category_id','id')->where('status',1);
    }

    public static function getDish()
    {
        $data = self::with(['dish'])
            ->order('weigh asc')
            ->where('type','dish')
            ->where('status','normal')
            ->select();
        return $data;
    }
}