define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'banner/item/index',
                    add_url: 'banner/item/add',
                    edit_url: 'banner/item/edit',
                    del_url: 'banner/item/del',
                    multi_url: 'banner/item/multi',
                    table: 'banner_item',
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
                        {field: 'image', title: __('Image'), operate:false, formatter: Table.api.formatter.image},
                        {field: 'banner_id', title: __('Banner_id'), visible:false, operate:false},
                        {field: 'banner.name', title: __('Banner_id'), operate:false},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'status', title: __('Status'), visible:false, searchList: {"0":__('Status 0'),"1":__('Status 1')}},
                        {field: 'status_text', title: __('Status'), operate:false},
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
    $("#c-banner_id").on('change',function () {
        if ($("#c-banner_id").val() == 1){
            $("#c-goods_id").parent('div').parent('div').parent('div').css('display','none');
            $("#c-dish_id").parent('div').parent('div').parent('div').css('display','block');
        }else if($("#c-banner_id").val() == 2){
            $("#c-dish_id").parent('div').parent('div').parent('div').css('display','none');
            $("#c-goods_id").parent('div').parent('div').parent('div').css('display','block');
        }else{
            $("#c-goods_id").attr('disabled',true);
            $("#c-dish_id").attr('disabled',true);
        }
    })
    return Controller;

});