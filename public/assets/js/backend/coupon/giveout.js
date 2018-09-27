define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'coupon/giveout/index',
                    add_url: 'coupon/giveout/add',
                    edit_url: 'coupon/giveout/edit',
                    del_url: 'coupon/giveout/del',
                    multi_url: 'coupon/giveout/multi',
                    table: 'give_out_coupon',
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
                        {field: 'stime', title: __('Stime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'etime', title: __('Etime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'type', title: __('Type'), visible:false, searchList: {"1":__('Type 1'),"2":__('Type 2')}},
                        {field: 'type_text', title: __('Type'), operate:false},
                        {field: 'expiry_date', title: __('Expiry_date'), operate:false},
                        {field: 'price', title: __('Price'), operate:'BETWEEN'},
                        {field: 'name', title: __('Name')},
                        {field: 'desc', title: __('Desc'), operate:false},
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

    $(function() {
        if ($("#c-type").val() == 1) {
            $("#c-expiry_date").val(0);
            $("#c-expiry_date").attr('disabled', true);
        }else{
            $("#c-expiry_date").attr('disabled', false);
        }
    })

    $("#c-type").on('change', function () {
        var type = $(this).val();
        if (type == 1) {
            $("#c-expiry_date").val(0);
            $("#c-expiry_date").attr('disabled', true);
        }else{
            $("#c-expiry_date").attr('disabled', false);
        }

    })

    return Controller;
});