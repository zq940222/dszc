<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use think\Config;

/**
 * 控制台
 *
 * @icon fa fa-dashboard
 * @remark 用于展示当前系统中的统计数据、统计报表及重要实时数据
 */
class Dashboard extends Backend
{

    /**
     * 查看
     */
    public function index()
    {
        $seventtime = \fast\Date::unixtime('day', -7);
//        $paylist = $createlist = [];
        $dishorderlist = model('DishOrder')->where('createtime','>',$seventtime)
            ->field(" COUNT(*) as tnum, FROM_UNIXTIME(createtime,'%Y-%m-%d') as gap ")
            ->group('gap')
            ->select();
        $orderlist = model('Order')->where('createtime','>',$seventtime)
            ->field(" COUNT(*) as tnum, FROM_UNIXTIME(createtime,'%Y-%m-%d') as gap ")
            ->group('gap')
            ->select();
//        for ($i = 0; $i < 7; $i++)
//        {
//            $day = date("Y-m-d", $seventtime + ($i * 86400));
//            $createlist[$day] = mt_rand(20, 200);
//            $paylist[$day] = mt_rand(1, mt_rand(1, $createlist[$day]));
//        }
        $hooks = config('addons.hooks');
        $uploadmode = isset($hooks['upload_config_init']) && $hooks['upload_config_init'] ? implode(',', $hooks['upload_config_init']) : 'local';
        $addonComposerCfg = ROOT_PATH . '/vendor/karsonzhang/fastadmin-addons/composer.json';
        Config::parse($addonComposerCfg, "json", "composer");
        $config = Config::get("composer");
        $addonVersion = isset($config['version']) ? $config['version'] : __('Unknown');

        $today = strtotime(date("Y-m-d"));
        $totaluser = model('User')->count();
        $totaldishorder = model('DishOrder')->count();
        $totalorder = model('Order')->count();
        $totaldishorderamount = model('DishOrder')->where('createtime','>',$today)->sum('pay_price');
        $totalorderamount = model('Order')->where('createtime','>',$today)->sum('pay_price');
        $todayusersignup = model('User')->where('createtime','>',$today)->count();
        $todaydishorder = model('DishOrder')->where('createtime','>',$today)->count();
        $todayorder = model('Order')->where('createtime','>',$today)->count();
        $unsettledishorder = model('DishOrder')->where('status',2)->count();
        $unsettleorder = model('Order')->where('status',2)->count();
        $this->view->assign([
            'totaluser'        => $totaluser,
            'totaldishorder'   => $totaldishorder,
            'totalorder'       => $totalorder,
            'totaldishorderamount' => $totaldishorderamount,
            'totalorderamount' => $totalorderamount,
            'todayusersignup'  => $todayusersignup,
            'todaydishorder'   => $todaydishorder,
            'todayorder'       => $todayorder,
            'unsettledishorder'=> $unsettledishorder,
            'unsettleorder'    => $unsettleorder,
            'orderlist'        => $orderlist,
            'dishorderlist'    => $dishorderlist,
            'addonversion'     => $addonVersion,
            'uploadmode'       => $uploadmode
        ]);

        return $this->view->fetch();
    }

}
