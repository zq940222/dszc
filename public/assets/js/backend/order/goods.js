define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'order/goods/index',
                    add_url: 'order/goods/add',
                    detail_url: 'order/goods/detail',
                    edit_url: 'order/goods/edit',
                    del_url: 'order/goods/del',
                    multi_url: 'order/goods/multi',
                    table: 'order',
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
                        {field: 'order_sn', title: __('Order_sn')},
                        {field: 'status', title: __('Status'), visible:false, searchList: {"0":__('Status 0'),"1":__('Status 1'),"2":__('Status 2'),"3":__('Status 3'),"4":__('Status 4'),"5":__('Status 5')}},
                        {field: 'status_text', title: __('Status'), operate:false},
                        {field: 'user_id', title: __('User_id'), visible:false, operate:false},
                        {field: 'goods_count', title: __('Goods_count'), operate:false},
                        {field: 'product_total_price', title: __('Product_total_price'), operate:false},
                        {field: 'order_total_price', title: __('Order_total_price'), operate:false},
                        {field: 'shipping_price', title: __('Shipping_price'), operate:false},
                        {field: 'pay_price', title: __('Pay_price'), operate:false},
                        {field: 'consignee', title: __('Consignee')},
                        {field: 'address', title: __('Address')},
                        {field: 'mobile', title: __('Mobile')},
                        {field: 'pay_time', title: __('Pay_time'), operate:false, addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'delivery_time', title: __('Delivery_time'), visible:false, operate:false, addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'coupon_id', title: __('Coupon_id'), visible:false, operate:false},
                        {field: 'coupon_price', title: __('Coupon_price'), operate:false},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table,
                            events: Table.api.events.operate,
                            buttons: [{
                                name: 'detail',
                                text: __('Detail'),
                                icon: 'fa fa-list',
                                classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                url: 'order/goods/detail'
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
        edit: function () {
            Controller.api.bindevent();
        },
        detail: function () {
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