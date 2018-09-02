define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'goods/goods/index',
                    add_url: 'goods/goods/add',
                    edit_url: 'goods/goods/edit',
                    del_url: 'goods/goods/del',
                    multi_url: 'goods/goods/multi',
                    table: 'goods',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'weigh',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'name', title: __('Name')},
                        {field: 'intro', title: __('Intro')},
                        {field: 'cover_image', title: __('Cover_image'), formatter: Table.api.formatter.image},
                        {field: 'goods_images', title: __('Goods_images'), formatter: Table.api.formatter.images},
                        {field: 'price', title: __('Price'), operate:'BETWEEN'},
                        {field: 'sales_sum', title: __('Sales_sum')},
                        {field: 'is_recommend', title: __('Is_recommend'), visible:false, searchList: {"0":__('Is_recommend 0'),"1":__('Is_recommend 1')}},
                        {field: 'is_recommend_text', title: __('Is_recommend'), operate:false},
                        {field: 'category_id', title: __('Category_id')},
                        {field: 'freight', title: __('Freight'), operate:'BETWEEN'},
                        {field: 'keywords', title: __('Keywords')},
                        {field: 'comment_count', title: __('Comment_count')},
                        {field: 'is_on_sale', title: __('Is_on_sale'), visible:false, searchList: {"0":__('Is_on_sale 0'),"1":__('Is_on_sale 1')}},
                        {field: 'is_on_sale_text', title: __('Is_on_sale'), operate:false},
                        {field: 'weigh', title: __('Weigh')},
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