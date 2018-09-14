<?php
/**
 * Created by PhpStorm.
 * User: #ZhangQiang
 * Date: 2018/9/12
 * Time: 10:45
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\library\ApiException;

class Upload extends BaseController
{
    public function upload()
    {
        $file = request()->file('file');
        if($file) {
            $info=$file->move(ROOT_PATH . 'public' . DS . 'uploads/temp');
            if($info) {
                $savename=$info->getsavename();
                $data = ['src' => @$savename];
                return $data;
            } else {
                $msg=$info->getError(); // 错误信息
                throw new ApiException(['msg' => @$msg]);
            }
        }
    }

    static public function move($savename)
    {
        $temp= ROOT_PATH . 'public' . DS . 'uploads/temp/'.$savename;
        $path= ROOT_PATH . 'public' . DS . 'uploads/'.$savename;
        if(file_exists($temp)) {
            $dir=dirname($path);
            if(!is_dir($dir)) mkdir($dir, 0777, true);
            copy($temp, $path);
            unlink($temp);
        }
        $temp_date = date('Ymd', strtotime("-1 days"));
        $temp_dir = ROOT_PATH . 'public' . DS . 'uploads/temp/'.$temp_date;
        if(is_dir($temp_dir)) {
            self::_rmdir($temp_dir);
        }
    }

    static public function remove($savename)
    {
        $path=ROOT_PATH . 'public' . DS . 'uploads/'.$savename;
        if(file_exists($path)) {
            @unlink($path);
        }
    }

    static public function _rmdir($dir)
    {
        $rs=opendir($dir);
        readdir($rs);
        readdir($rs);
        while($name=readdir($rs)) {
            if(is_dir($dir.'/'.$name)) {
                self::_rmdir($dir.'/'.$name);
            } else {
                unlink($dir.'/'.$name);
            }
        }
        closedir($rs);
        rmdir($dir);
    }
}