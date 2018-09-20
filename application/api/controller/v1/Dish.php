<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/1
 * Time: 16:39
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\DishSpec;
use app\api\validate\IDMustBePostiveInt;
use app\api\model\Dish as DishModel;


class Dish extends BaseController
{
    public function getDetail($id)
    {
        (new IDMustBePostiveInt())->goCheck();

        $data = DishModel::get($id);

        $specIds = $data['dish_spec_ids'];

        $spec = DishSpec::where('id','in',$specIds)->with(['specItem'])->select();

        $data['spec'] = $spec;
        return $data;
    }
}