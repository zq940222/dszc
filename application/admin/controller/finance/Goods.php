<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/9/17
 * Time: 11:28
 */

namespace app\admin\controller\finance;


use app\common\controller\Backend;

class Goods extends Backend
{
    public function index()
    {
        if ($this->request->isAjax())
        {
            $createtime = $this->request->request('createtime');
            if (!$createtime)
            {
                $createtime = date("Y-m-d 00:00:00", \fast\Date::unixtime('day', -7)) . ' - ' . date('Y-m-d 23:59:59');
            }
            $db = db('Order');

            list($start, $end) = explode(' - ', $createtime);
            $starttime = strtotime($start);
            $endtime = strtotime($end);
            //超过两个月按月进行统计
            if ($endtime - $starttime >= 84600 * 30 * 2)
            {
                $db->field("FROM_UNIXTIME(createtime,'%Y-%m') as orderdate");
                $type = 'month';
            }
            else if ($endtime - $starttime > 60*60*24 )
            {
                $db->field("FROM_UNIXTIME(createtime,'%Y-%m-%d') as orderdate");
                $type = 'day';
            }
            else
            {
                $db->field("FROM_UNIXTIME(createtime,'%H时') as orderdate");
                $type = 'hour';
            }
            $db->whereTime('createtime', 'between', explode(' - ', $createtime));
            $db->where('status','in',[2,3,4,5]);

            $consumelist = $db
                ->field('SUM(pay_price) AS amount')
                ->field('COUNT(*) AS total_num')
                ->group('orderdate')
                ->select();
            if ($type == 'month')
            {
                //按月构造数据
                $starttime = strtotime('last month', $starttime);
                while (($starttime = strtotime('next month', $starttime)) <= $endtime)
                {
                    $column[] = date('Y-m', $starttime);
                }
            }
            else if ($type == 'day')
            {
                //按天构造数据
                for ($time = $starttime; $time < $endtime;)
                {
                    $column[] = date("Y-m-d", $time);
                    $time += 86400;
                }
            }
            else{
                //按小时构造数据
                for ($time = $starttime; $time < $endtime;)
                {
                    $column[] = date("H时", $time);
                    $time += 60*60;
                }
            }
            $list = array_fill_keys($column, 0);
            $series = [
                'amount'      => $list,
                'total_num'   => $list,
            ];
            foreach ($consumelist as $k => $v)
            {
                $series['amount'][$v['orderdate']] = $v['amount'];
                $series['total_num'][$v['orderdate']] = $v['total_num'];
            }
            foreach ($series as $k => &$v)
            {
                $v = array_values($v);
            }
            unset($v);
            $result = array("series" => $series, 'column' => $column);
            $this->success('', null, $result);
        }
        return $this->view->fetch();
    }
}