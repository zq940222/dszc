define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user/coupon/index',
                    add_url: 'user/coupon/add',
                    edit_url: 'user/coupon/edit',
                    del_url: 'user/coupon/del',
                    multi_url: 'user/coupon/multi',
                    table: 'user_coupon',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'user_id', title: __('User_id')},
                        {field: 'type', title: __('Type'), visible:false, searchList: {"1":__('Type 1'),"2":__('Type 2')}},
                        {field: 'type_text', title: __('Type'), operate:false},
                        {field: 'price', title: __('Price'), operate:'BETWEEN'},
                        {field: 'name', title: __('Name')},
                        {field: 'desc', title: __('Desc')},
                        {field: 'stime', title: __('Stime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'etime', title: __('Etime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'status', title: __('Status'), visible:false, searchList: {"0":__('Status 0'),"1":__('Status 1'),"2":__('Status 2')}},
                        {field: 'status_text', title: __('Status'), operate:false},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});