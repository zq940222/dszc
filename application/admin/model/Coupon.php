<?php

namespace app\admin\model;

use think\Model;

class Coupon extends Model
{
    // 表名
    protected $name = 'coupon';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    
    // 追加属性
    protected $append = [
        'type_text',
        'coupon_type_text',
        'status_text'
    ];
    

    
    public function getTypeList()
    {
        return ['1' => __('Type 1'),'2' => __('Type 2')];
    }     

    public function getCouponTypeList()
    {
        return ['1' => __('Coupon_type 1'),'2' => __('Coupon_type 2')];
    }     

    public function getStatusList()
    {
        return ['0' => __('Status 0'),'1' => __('Status 1')];
    }     


    public function getTypeTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['type'];
        $list = $this->getTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getCouponTypeTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['coupon_type'];
        $list = $this->getCouponTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getStatusTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
