<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/1
 * Time: 16:32
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\library\ApiException;
use app\api\validate\IDMustBePostiveInt;
use app\api\model\Banner as BannerModel;

class Banner extends BaseController
{
    /**
     * 获取指定id的banner信息
     * @url /banner/:id
     * @http GET
     * @id banner的id号
     *
     */
    public function getBanner($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $banner = BannerModel::getBannerByID($id);
        if(!$banner){
            throw new ApiException();
        }
        return $banner;
    }
}