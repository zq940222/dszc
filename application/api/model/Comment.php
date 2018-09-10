<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/7
 * Time: 15:02
 */

namespace app\api\model;


class Comment extends BaseModel
{
    protected $hidden = ['updatetime','status'];

    public function getImagesAttr($value)
    {
        $array = explode(',',$value);
        foreach ($array as &$v)
        {
            $v = $this->prefixImgUrl($v);
        }
        return $array;
    }

    public static function commentList($goods_id, $page = 1, $size = 10)
    {
        $data = self::order('createtime desc')
            ->where('goods_id',$goods_id)
            ->where('status',1)
            ->paginate($size,true,['page'=> $page]);

        return $data;
    }
}