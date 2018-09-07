<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/7
 * Time: 9:26
 */

namespace app\api\model;


class Goods extends BaseModel
{
    protected $hidden = ['updatetime','createtime','status','is_on_sale','is_recommend','keywords','weigh'];

    public function getCoverImageAttr($value)
    {
        return $this->prefixImgUrl($value);
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

    public static function getGoods($page, $size, $is_recommend = 0, $category_id = 0, $keywords = '', $sort = 0)
    {
        $where = [];
        if ($is_recommend)
        {
            $where['is_recommend'] = ['=',$is_recommend];
        }
        if ($category_id)
        {
            $where['category_id'] = ['=',$category_id];
        }
        if ($keywords)
        {
            $where['name|intro|keywords'] = ['like',"%$keywords%"];
            Search::search($keywords);
        }
        $where['is_on_sale'] = ['=',1];
        $where['status'] = ['=',1];
        $sortArray = [
            'createtime desc',
            'price asc',
            'price desc',
            'sales_sum asc',
            'sales_sum desc'
        ];
        $order = $sortArray[$sort];

        $data = Goods::order($order)
            ->where($where)
            ->paginate($size,true,['page'=> $page]);
        return $data;
    }
}