<?php

namespace app\admin\model;

use think\Model;

class Goods extends Model
{
    // 表名
    protected $name = 'goods';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    
    // 追加属性
    protected $append = [
        'is_recommend_text',
        'is_on_sale_text',
        'status_text'
    ];
    

    protected static function init()
    {
        self::afterInsert(function ($row) {
            $pk = $row->getPk();
            $row->getQuery()->where($pk, $row[$pk])->update(['weigh' => $row[$pk]]);
        });
    }

    
    public function getIsRecommendList()
    {
        return ['0' => __('Is_recommend 0'),'1' => __('Is_recommend 1')];
    }     

    public function getIsOnSaleList()
    {
        return ['0' => __('Is_on_sale 0'),'1' => __('Is_on_sale 1')];
    }     

    public function getStatusList()
    {
        return ['0' => __('Status 0'),'1' => __('Status 1')];
    }     


    public function getIsRecommendTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['is_recommend'];
        $list = $this->getIsRecommendList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getIsOnSaleTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['is_on_sale'];
        $list = $this->getIsOnSaleList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getStatusTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function specGoodsPrice()
    {
        return $this->hasMany('SpecGoodsPrice','goods_id','id');
    }

}
