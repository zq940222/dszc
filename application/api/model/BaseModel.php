<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/1
 * Time: 16:21
 */

namespace app\api\model;


use think\Model;

class BaseModel extends Model
{
    protected function prefixImgUrl($value)
    {
        $finalUrl = $value;
        if ($value){
            $finalUrl = config('setting.img_prefix').$value;
        }
        return $finalUrl;
    }
}