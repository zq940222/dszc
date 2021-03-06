<?php

namespace app\admin\controller\goods;

use app\common\controller\Backend;

/**
 * 
 *
 * @icon fa fa-circle-o
 */
class Spec extends Backend
{
    
    /**
     * Spec模型对象
     */
    protected $relationSearch = true;

    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Spec');
        $this->view->assign("statusList", $this->model->getStatusList());
    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */

    /**
     * 查看
     */
    public function index()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax())
        {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField'))
            {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->with(['specItem'])
                ->where($where)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->with(['specItem'])
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();
            foreach ($list as $key => $values)
            {
                $specItemArray = [];
                foreach ($values['specItem'] as $value)
                {
                    $specItemArray[] = $value['name'];
                }
                $list[$key]['item'] = implode(',',$specItemArray);
            }

            $list = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 添加
     */
    public function add()
    {
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            if ($params)
            {
                if ($this->dataLimit && $this->dataLimitFieldAutoFill)
                {
                    $params[$this->dataLimitField] = $this->auth->id;
                }
                try
                {
                    //是否采用模型验证
                    if ($this->modelValidate)
                    {
                        $name = basename(str_replace('\\', '/', get_class($this->model)));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.add' : true) : $this->modelValidate;
                        $this->model->validate($validate);
                    }
                    $result = $this->model->allowField(true)->save($params);
                    $items = $params['item'];
                    $items = explode("\n",$items);
                    $specItem = [];
                    foreach ($items as $v) {
                        $specItem[] = [
                            'spec_id' => $this->model->id,
                            'name' => $v
                        ];
                    }
                    $result2 = model('SpecItem')->saveAll($specItem);
                    if ($result !== false && $result2 !== false)
                    {
                        $this->success();
                    }
                    else
                    {
                        $this->error($this->model->getError());
                    }
                }
                catch (\think\exception\PDOException $e)
                {
                    $this->error($e->getMessage());
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        return $this->view->fetch();
    }

    /**
     * 编辑
     */
    public function edit($ids = NULL)
    {
        $row = $this->model->get($ids);
        if (!$row)
            $this->error(__('No Results were found'));
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds))
        {
            if (!in_array($row[$this->dataLimitField], $adminIds))
            {
                $this->error(__('You have no permission'));
            }
        }
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            if ($params)
            {
                try
                {
                    //是否采用模型验证
                    if ($this->modelValidate)
                    {
                        $name = basename(str_replace('\\', '/', get_class($this->model)));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : true) : $this->modelValidate;
                        $row->validate($validate);
                    }
                    $result = $row->allowField(true)->save($params);
                    $items = $params['item'];
                    $items = explode("\n",$items);
                    $specItems = model("SpecItem")->where('spec_id',$ids)->column('name');
                    $specItemAdd = array_diff($items,$specItems);
                    $specItmeDelete = array_diff($specItems,$items);
                    $specItem = [];
                    foreach ($specItemAdd as $v) {
                        $specItem[] = [
                            'spec_id' => $ids,
                            'name' => $v
                        ];
                    }
                    $result2 = model('SpecItem')->saveAll($specItem);
                    $result3 = model('SpecItem')->where('spec_id',$ids)->where('name','in',$specItmeDelete)->delete();

                    if ($result !== false && $result2 !== false && $result3 !== false)
                    {
                        $this->success();
                    }
                    else
                    {
                        $this->error($row->getError());
                    }
                }
                catch (\think\exception\PDOException $e)
                {
                    $this->error($e->getMessage());
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $specItemArray = [];
        foreach ($row['specItem'] as $key => $value) {
            $specItemArray[] = $value['name'];
        }
        $row['item'] = implode("\n",$specItemArray);
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }
}
