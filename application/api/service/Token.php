<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/4/26
 * Time: 15:31
 */

namespace app\api\service;


use app\api\library\ApiException;
use think\Cache;
use think\Exception;
use think\Request;

class Token
{
    public static function generateToken(){
        //32个字符
        $randChars = getRandChar(32);
        //用三组加密
        $timestamp = $_SERVER['REQUEST_TIME'];
        //盐
        $salt = config('secure.token_salt');

        return md5($randChars.$timestamp.$salt);

    }

    public static function getCurrentTokenVar($key){
        $token = Request::instance()
            ->header('token');
        $vars = Cache::get($token);
        if (!$vars) {
            throw new ApiException(['code'=>401,'msg' => 'Token已过期或无效Token']);
        }
        else{
            if (!is_array($vars)) {
                $vars = json_decode($vars,true);
            }
            if (array_key_exists($key,$vars)){
                return $vars[$key];
            }
            else{
                throw new Exception('尝试获取得Token变量并不存在');
            }
        }
    }

    public static function getCurrentUid(){
        $uid = self::getCurrentTokenVar('uid');
        return $uid;
    }

    public static function isValidOperate($checkedUID)
    {
        if (!$checkedUID) {
            throw new Exception('检测UID不能是NULL');
        }
        $currentOperateUID = self::getCurrentUid();
        if ($currentOperateUID == $checkedUID) {
            return true;
        }else{
            return false;
        }

    }


}