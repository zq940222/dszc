<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/8
 * Time: 16:22
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\library\ApiException;
use app\api\library\Success;
use app\api\model\UserAddress;
use app\api\service\Token as TokenService;
use app\api\validate\AddressNew;
use app\api\validate\IDMustBePostiveInt;

class Address extends BaseController
{
    public function getAddressList()
    {
        $uid = TokenService::getCurrentUid();
        $data = UserAddress::order('is_default desc')->where('status',1)->where('user_id',$uid)->select();

        return $data;
    }

    public function addAddress()
    {
        $validate = new AddressNew();
        $validate->goCheck();

        $uid = TokenService::getCurrentUid();
        $dataArray = $validate->getDataByRule(input('post.'));
        $dataArray['user_id'] = $uid;
        UserAddress::create($dataArray);

        return json(new Success(['msg' => '新建成功']));
    }

    public function editAddress($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $validate = new AddressNew();
        $validate->goCheck();

        $uid = TokenService::getCurrentUid();
        $model = UserAddress::get($id);
        if ($model->user_id != $uid)
        {
            throw new ApiException(['msg' => '你没有权限这么做']);
        }
        $dataArray = $validate->getDataByRule(input('post.'));
        $model->save($dataArray);

        return json(new Success(['msg' => '编辑成功']));
    }

    public function deleteAddress($id)
    {
        (new IDMustBePostiveInt())->goCheck();

        $uid = TokenService::getCurrentUid();
        $model = UserAddress::get($id);
        if ($model->user_id != $uid)
        {
            throw new ApiException(['msg' => '你没有权限这么做']);
        }
        $model->delete();
        return json(new Success(['msg' => '删除成功']));
    }

    public function setDefaultAddress($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $uid = TokenService::getCurrentUid();
        $model = UserAddress::get($id);
        if ($model->user_id != $uid)
        {
            throw new ApiException(['msg' => '你没有权限这么做']);
        }

        @UserAddress::where('user_id',$uid)->update(['is_default' => 0]);
        $model->save(['is_default' => 1]);
        return json(new Success(['msg' => '已设置']));
    }
}