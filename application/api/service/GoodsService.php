<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/7
 * Time: 14:21
 */

namespace app\api\service;


use app\api\model\Spec;
use app\api\model\SpecGoodsPrice;

class GoodsService
{

    public function get_spec($goods_id)
    {
        //商品规格 价钱 库存表 找出 所有 规格项id
        $keys = SpecGoodsPrice::where("goods_id", $goods_id)->column("GROUP_CONCAT(`key` SEPARATOR ',') ");
        $filter_spec = array();
        $keys = str_replace(',', ',', $keys)[0];

        if ($keys) {
            $filter_spec = Spec::hasWhere('item',['id'=>['in',$keys]])
            ->with(['item'])->select();
        }
        return $filter_spec;
    }
}