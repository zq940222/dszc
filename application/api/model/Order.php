<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/10
 * Time: 9:06
 */

namespace app\api\model;


use traits\model\SoftDelete;

class Order extends BaseModel
{
    use SoftDelete;

    protected $hidden = ['user_id','updatetime'];

    protected $autoWriteTimestamp = true;

    protected $createTime = 'createtime';

    protected $updateTime = 'updatetime';

    protected $deleteTime = 'deletetime';

    public function item()
    {
        return $this->hasMany('OrderGoods','order_id','id');
    }

    public static function getSummaryByUser($uid, $page, $size)
    {
        $pagingData = self::with(['item'])
            ->where('user_id','=',$uid)
            ->order('createtime desc')
            ->paginate($size, true, ['page' => $page]);
        return $pagingData;
    }
}