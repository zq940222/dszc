<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/6
 * Time: 17:27
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\Category as CategoryModel;
use app\api\model\Comment;
use app\api\model\Goods as GoodsModel;
use app\api\model\Search;
use app\api\validate\IDMustBePostiveInt;
use app\api\validate\PagingParameter;

class Goods extends BaseController
{
    public function getAllCategory()
    {
        $data = CategoryModel::getGoodsCategoryList();
        return $data;
    }

    public function getRecommendGoods($page = 1,$size = 10)
    {
        (new PagingParameter())->goCheck();

        $data = GoodsModel::getGoods($page, $size, 1);
        return $data;
    }

    public function hotSearch()
    {
        $data = Search::getHot();
        return ['name' => $data];
    }

    public function getGoodsList($page = 1, $size = 10, $category_id = 0, $keywords = '', $sort = 0)
    {
        (new PagingParameter())->goCheck();

        $data = GoodsModel::getGoods($page, $size, 0, $category_id, $keywords, $sort);
        return $data;
    }

    public function getDetail($id)
    {
        (new IDMustBePostiveInt())->goCheck();

        $data = GoodsModel::detail($id);

        return $data;
    }

    public function getComment($id, $page = 1, $size = 10)
    {
        (new IDMustBePostiveInt())->goCheck();

        $data = Comment::commentList($id, $page, $size);
        return $data;
    }
}