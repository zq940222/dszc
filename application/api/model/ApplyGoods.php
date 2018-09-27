<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/9
 * Time: 16:57
 */

namespace app\api\model;


use app\api\controller\v1\Upload;

class ApplyGoods extends BaseModel
{
    protected $autoWriteTimestamp = true;

    protected $createTime = 'createtime';

    protected $updateTime = 'updatetime';

    protected $hidden = ['id','user_id','createtime','updatetime'];

    public function setGoodsImagesAttr($value)
    {
        foreach ($value as &$v)
        {
            Upload::move($v);
            $v = '/uploads/'.$v;
        }
        return implode(',',$value);
    }

    public function getGoodsImagesAttr($value)
    {
        $array = explode(',',$value);
        foreach ($array as &$v)
        {
            $v = $this->prefixImgUrl($v);
        }
        return $array;
    }
}