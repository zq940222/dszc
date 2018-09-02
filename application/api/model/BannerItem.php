<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/1
 * Time: 16:37
 */

namespace app\api\model;


class BannerItem extends BaseModel
{
    public function getImageAttr($value)
    {
        return $this->prefixImgUrl($value);
    }
}