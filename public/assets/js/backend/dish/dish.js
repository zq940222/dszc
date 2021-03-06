define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'dish/dish/index',
                    add_url: 'dish/dish/add',
                    edit_url: 'dish/dish/edit',
                    del_url: 'dish/dish/del',
                    multi_url: 'dish/dish/multi',
                    table: 'dish',
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
                        {field: 'category_id', title: __('Category_id'), visible:false, searchList: $.getJSON('dish/dish/ajaxGetCategory')},
                        {field: 'category.name', title: __('Category_id'), formatter:Table.api.formatter.search},
                        {field: 'type', title: __('Type'), visible:false, searchList: {"0":__('Type 0'),"1":__('Type 1')}},
                        {field: 'type_text', title: __('Type'), operate:false},
                        {field: 'name', title: __('Name')},
                        {field: 'price', title: __('Price'), operate:'BETWEEN'},
                        {field: 'dish_image', title: __('Dish_image'), operate:false, formatter: Table.api.formatter.image},
                        {field: 'dish_spec_ids', title: __('Dish_spec_ids'), visible:false, operate:false},
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


    $("#c-type").on('change',function () {
        if ($(this).val() == 0){
            $("#c-dish_spec_ids").val('');
            $("#c-dish_spec_ids_text").attr('disabled',false);
            $("#c-dish_spec_ids_text").parent('div').addClass('sp_disabled');
        } else{
            $("#c-dish_spec_ids_text").attr('disabled',false);
            $("#c-dish_spec_ids_text").attr('data-select-only',false);
            $("#c-dish_spec_ids_text").attr('readonly',false);
        }
    });

    return Controller;


});