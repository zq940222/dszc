<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/9/18
 * Time: 15:57
 */

namespace app\admin\model;


use think\Model;

class DishSpecItem extends Model
{
    // 表名
    protected $name = 'dish_spec_item';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';


}