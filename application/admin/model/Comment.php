<?php

namespace app\admin\model;

use think\Model;

class Comment extends Model
{
    // 表名
    protected $name = 'comment';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    
    // 追加属性
    protected $append = [
        'score_text',
        'status_text'
    ];
    

    
    public function getScoreList()
    {
        return ['1' => __('Score 1'),'2' => __('Score 2'),'3' => __('Score 3'),'4' => __('Score 4'),'5' => __('Score 5')];
    }     

    public function getStatusList()
    {
        return ['0' => __('Status 0'),'1' => __('Status 1')];
    }     


    public function getScoreTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['score'];
        $list = $this->getScoreList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getStatusTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
