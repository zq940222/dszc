<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/10
 * Time: 14:31
 */

namespace app\api\validate;


use app\api\library\ApiException;

class OrderPlace extends BaseValidate
{
    protected $rule = [
        'products' => 'checkProducts',
        'address_id' => 'require|isPositiveInteger',
        'coupon_id' => 'require|\d+'
    ];

    protected $singRule = [
        'product_id' => 'require|isPositiveInteger',
        'key' => 'require',
        'count' => 'require|isPositiveInteger'
    ];
    protected function checkProducts($values)
    {
        if (!is_array($values)) {
            throw new ApiException([
                'msg' => '商品参数不正确'
            ]);
        }
        if (empty($values)) {
            throw new ApiException([
                'msg' => '商品列表不能为空'
            ]);
        }
        foreach ($values as $value)
        {
            $this->checkProduct($value);
        }
        return true;
    }

    protected function checkProduct($value)
    {
        $validate = new BaseValidate($this->singRule);
        $result = $validate->check($value);
        if (!$result) {
            throw new ApiException([
                'msg' => '商品列表参数错误'
            ]);
        }
    }
}