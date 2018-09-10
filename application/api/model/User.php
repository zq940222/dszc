<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/1
 * Time: 16:21
 */

namespace app\api\model;


class User extends BaseModel
{
    protected $autoWriteTimestamp = true;

    protected $createTime = 'createtime';

    protected $updateTime = 'updatetime';

    public static function getByOpenID($openid){
        $user = self::where('openid','=',$openid)
            ->find();
        return $user;
    }
}