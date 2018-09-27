<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/12
 * Time: 14:43
 */

namespace app\api\validate;


use app\api\library\ApiException;

class CommentNew extends BaseValidate
{
    protected $rule = [
        'order_id' => 'require|isPositiveInteger',
        'comments' => 'checkComments'
    ];

    protected $singRule = [
        'goods_id' => 'require|isPositiveInteger',
        'content' => 'require|isNotEmpty',
        'images' => 'require'
    ];
    protected function checkComments($values)
    {
        if (!is_array($values)) {
            throw new ApiException([
                'msg' => '评论参数不正确'
            ]);
        }
        if (empty($values)) {
            throw new ApiException([
                'msg' => '评论不能为空'
            ]);
        }
        foreach ($values as $value)
        {
            $this->checkComment($value);
        }
        return true;
    }

    protected function checkComment($value)
    {
        $validate = new BaseValidate($this->singRule);
        $result = $validate->check($value);
        if (!$result) {
            throw new ApiException([
                'msg' => '评论参数错误'
            ]);
        }
    }
}