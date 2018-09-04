<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/1
 * Time: 16:39
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\validate\IDMustBePostiveInt;
use app\api\model\Dish as DishModel;


class Dish extends BaseController
{
    public function getDetail($id)
    {
        (new IDMustBePostiveInt())->goCheck();

        $data = DishModel::with(['spec'])
            ->find($id);
        return $data;
    }
}