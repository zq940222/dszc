<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/7
 * Time: 10:59
 */

namespace app\api\model;


class Search extends BaseModel
{
    protected $visible = ['name'];

    public static function getHot($limit = 3)
    {
        $data = self::order('count desc')
            ->where('status',1)
            ->limit($limit)
            ->column('name');
        return $data;
    }

    public static function search($keywords = '')
    {
        $model = self::where('status',1)
            ->where('name',$keywords)
            ->find();
        if ($model)
        {
            $model->setInc('count');
        }
        else
        {
            self::create([
                'name' => $keywords
            ]);
        }
        return true;
    }
}