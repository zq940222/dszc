define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'coupon/coupon/index',
                    add_url: 'coupon/coupon/add',
                    edit_url: 'coupon/coupon/edit',
                    del_url: 'coupon/coupon/del',
                    multi_url: 'coupon/coupon/multi',
                    table: 'coupon',
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
                        {field: 'id', title: __('Id'), operate:false},
                        {field: 'type', title: __('Type'), visible:false, searchList: {"1":__('Type 1'),"2":__('Type 2')}},
                        {field: 'type_text', title: __('Type'), operate:false},
                        {field: 'price', title: __('Price'), operate:'BETWEEN'},
                        {field: 'coupon_type', title: __('Coupon_type'), visible:false, searchList: {"1":__('Coupon_type 1'),"2":__('Coupon_type 2')}},
                        {field: 'coupon_type_text', title: __('Coupon_type'), operate:false},
                        {field: 'name', title: __('Name')},
                        {field: 'desc', title: __('Desc'), operate:false},
                        {field: 'expiry_date', title: __('Expiry_date'), operate:false},
                        {field: 'status', title: __('Status'), visible:false, searchList: {"0":__('Status 0'),"1":__('Status 1')}},
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