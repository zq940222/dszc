<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/1
 * Time: 16:37
 */

namespace app\api\model;


class Banner extends BaseModel
{


    public function items()
    {
        return $this->hasMany('BannerItem','banner_id','id');
    }
    public static function getBannerByID($id)
    {
        $banner = self::with(['items'])->find($id);
        return $banner;
    }


}