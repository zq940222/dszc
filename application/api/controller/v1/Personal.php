<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/7
 * Time: 15:28
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\library\ApiException;
use app\api\library\Success;
use app\api\model\ApplyGoods;
use app\api\model\ApplyHorseman;
use app\api\model\User;
use app\api\model\UserCoupon;
use app\api\service\AlismsService;
use app\api\service\Token as TokenService;
use app\api\validate\GoodsNew;
use app\api\validate\HorsemanNew;
use app\api\validate\MobileNumber;
use app\api\validate\UserInfoNew;

class Personal extends BaseController
{
    public function info()
    {
        $uid = TokenService::getCurrentUid();
        $data = User::where('status',1)->field(['id','mobile','birthday'])->find($uid);
        return $data;
    }

    public function editGender()
    {
        $uid = TokenService::getCurrentUid();
        $sex = input('param.sex/d',0);
        if ($sex)
        {
            $model = User::get($uid);
            $model->gender = $sex;
            $model->save();
            return json(new Success(['msg' => '更新成功']));
        }
        else{
            throw new ApiException(['msg' => '参数有问题']);
        }
    }

    public function editBirthday()
    {
        $uid = TokenService::getCurrentUid();
        $birthday = input('param.birthday/s','');
        if ($birthday)
        {
            $model = User::get($uid);
            $model->birthday = $birthday;
            $model->save();
            return json(new Success(['msg' => '更新成功']));
        }
        else{
            throw new ApiException(['msg' => '参数有问题']);
        }
    }

    public function sendCode($mobile)
    {
        (new MobileNumber())->goCheck();

        $template = 'SMS_144185124';
        $sign = '大山早餐';
        $code = AlismsService::generateCode(6);
        cache($mobile,$code,30*60);
        $param = ['code' => $code];
        $alisms = new \addons\alisms\library\Alisms();
        $ret = $alisms->mobile($mobile)
            ->template($template)
            ->sign($sign)
            ->param($param)
            ->send();
        if ($ret)
        {
            return json(new Success(['msg' => '发送成功']));
        }
        else
        {
            throw new ApiException(['msg' => "发送失败！失败原因：" . $alisms->getError()]);
        }
    }

    public function bindMobile($mobile, $code)
    {
        (new MobileNumber())->goCheck();

        AlismsService::checkCode($mobile, $code);

        $uid = TokenService::getCurrentUid();

        $model = User::get($uid);
        $model->mobile = $mobile;
        $model->save();

        //TODO:: 赠送优惠券
        UserCoupon::getBindMobileSendCoupon($uid);

        return json(new Success(['msg' => '绑定成功']));
    }

    public function coupon()
    {
        $uid = TokenService::getCurrentUid();

        $data = UserCoupon::where('status',1)->where('user_id',$uid)->select();

        return $data;
    }

    public function horseman()
    {
        $uid = TokenService::getCurrentUid();

        $data = ApplyHorseman::where('user_id',$uid)->order('createtime desc')->find();

        if (!$data)
        {
            throw new ApiException(['msg' => '没有申请骑手记录']);
        }
        return $data;
    }

    public function applyHorseman()
    {
        $validate = new HorsemanNew();
        $validate->goCheck();


        $uid = TokenService::getCurrentUid();

        $dataArray = $validate->getDataByRule(input('post.'));

        AlismsService::checkCode($dataArray['mobile'], $dataArray['code']);

        unset($dataArray['code']);
        $dataArray['user_id'] = $uid;
        ApplyHorseman::create($dataArray);

        return json(new Success(['msg' => '申请成功']));
    }

    public function goods()
    {
        $uid = TokenService::getCurrentUid();

        $data = ApplyGoods::where('user_id',$uid)->order('createtime desc')->find();

        if (!$data)
        {
            throw new ApiException(['msg' => '没有申请精选记录']);
        }
        return $data;
    }

    public function applyGoods()
    {
        $validate = new GoodsNew();
        $validate->goCheck();

        $uid = TokenService::getCurrentUid();

        $dataArray = $validate->getDataByRule(input('post.'));
        $dataArray['user_id'] = $uid;
        ApplyGoods::create($dataArray);

        return json(new Success(['msg' => '申请成功']));
    }

    public function customerService()
    {
        $data = config('site.customer_service');
        return ['customer_service'=> $data];
    }

    public function editUserInfo()
    {
        $validate = new UserInfoNew();
        $validate->goCheck();

        $uid = TokenService::getCurrentUid();

        $dataArray = $validate->getDataByRule(input('post.'));
        $model = new User();
        $model->save($dataArray,['id' => $uid]);
        return json(new Success(['msg' => '更新成功']));
    }
}