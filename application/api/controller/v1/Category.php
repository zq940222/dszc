<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/1
 * Time: 16:42
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\library\ApiException;
use app\api\model\Category as CategoryModel;

class Category extends BaseController
{
    public function getAllCategories()
    {
        $categories = CategoryModel::all([],'img');
        if (!$categories) {
            throw new ApiException();
        }
        return $categories;
    }
}