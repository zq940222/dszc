<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/9
 * Time: 16:42
 */

namespace app\api\model;


class ApplyHorseman extends BaseModel
{
    protected $autoWriteTimestamp = true;

    protected $createTime = 'createtime';

    protected $updateTime = 'updatetime';

    protected $hidden = ['id','user_id','createtime','updatetime'];
}