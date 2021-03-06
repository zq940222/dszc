define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'order/dish/index',
                    add_url: '',
                    detail_url: 'order/dish/detail',
                    edit_url: 'order/dish/edit',
                    del_url: 'order/dish/del',
                    multi_url: 'order/dish/multi',
                    table: 'dish_order',
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
                        {field: 'order_sn', title: __('Order_sn'), operate:'LIKE'},
                        {field: 'status', title: __('Status'), visible:false, searchList: {"0":__('Status 0'),"1":__('Status 1'),"2":__('Status 2'),"3":__('Status 3')}},
                        {field: 'status_text', title: __('Status'), operate:false},
                        {field: 'user_id', title: __('User_id'), visible:false, operate:false},
                        {field: 'product_count', title: __('Product_count'), operate:false},
                        {field: 'total_price', title: __('Total_price'), operate:'BETWEEN'},
                        {field: 'pay_price', title: __('Pay_price'), operate:'BETWEEN'},
                        {field: 'coupon_id', title: __('Coupon_id'), visible:false, operate:false},
                        {field: 'coupon_price', title: __('Coupon_price'), operate:false},
                        {field: 'consignee', title: __('Consignee')},
                        {field: 'address', title: __('Address'), operate:false},
                        {field: 'mobile', title: __('Mobile')},
                        {field: 'pay_time', title: __('Pay_time'), operate:false, addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'prepay_id', title: __('Prepay_id'), visible:false, operate:false},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table,
                            events: Table.api.events.operate,
                            buttons: [{
                                name: 'detail',
                                text: __('Detail'),
                                icon: 'fa fa-list',
                                classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                url: 'order/dish/detail'
                            }],
                            formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        detail: function () {
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