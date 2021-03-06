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
                        {field: 'id', title: __('Id'), operate:false},
                        {field: 'name', title: __('Name'),operate:'LIKE'},
                        {field: 'intro', title: __('Intro'), operate:false},
                        {field: 'cover_image', title: __('Cover_image'), operate:false, formatter: Table.api.formatter.image},
                        {field: 'goods_images', title: __('Goods_images'), operate:false, formatter: Table.api.formatter.images},
                        {field: 'price', title: __('Price'), operate:'BETWEEN'},
                        {field: 'sales_sum', title: __('Sales_sum'), operate:false},
                        {field: 'is_recommend', title: __('Is_recommend'), visible:false, searchList: {"0":__('Is_recommend 0'),"1":__('Is_recommend 1')}},
                        {field: 'is_recommend_text', title: __('Is_recommend'), operate:false},
                        {field: 'category_id', title: __('Category_id'), visible:false, operate:false},
                        {field: 'category.name', title: __('分类'), operate:false},
                        {field: 'freight', title: __('Freight'), operate:false},
                        {field: 'keywords', title: __('Keywords'), operate:false},
                        {field: 'comment_count', title: __('Comment_count'), operate:false},
                        {field: 'is_on_sale', title: __('Is_on_sale'), visible:false, searchList: {"0":__('Is_on_sale 0'),"1":__('Is_on_sale 1')}},
                        {field: 'is_on_sale_text', title: __('Is_on_sale'), operate:false},
                        {field: 'weigh', title: __('Weigh'), operate:false},
                        {field: 'status', title: __('Status'), visible:false, searchList: {"0":__('Status 0'),"1":__('Status 1')}},
                        {field: 'status_text', title: __('Status'), operate:false},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table,
                            events: Table.api.events.operate,
                            buttons: [{
                                name: 'detail',
                                text: __('Detail'),
                                icon: 'fa fa-list',
                                classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                url: 'goods/goods/detail'
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
            ajaxGetSpecInput();


            // 规格按钮切换 class
            $("button[type=button]").click(function(){
                if($(this).hasClass('btn-success'))
                {
                    $(this).removeClass('btn-success');
                    $(this).addClass('btn-default');
                }else{
                    $(this).removeClass('btn-default');
                    $(this).addClass('btn-success');
                }
                ajaxGetSpecInput();
            });

            /**
             *  点击商品规格触发下面输入框显示
             */
            function ajaxGetSpecInput() {
                var spec_arr = {};// 用户选择的规格数组
                // 选中了哪些属性
                $("#goods_spec_table1  button").each(function () {
                    if ($(this).hasClass('btn-success')) {
                        var spec_id = $(this).data('spec_id');
                        var item_id = $(this).data('item_id');
                        if (!spec_arr.hasOwnProperty(spec_id))
                            spec_arr[spec_id] = [];
                        spec_arr[spec_id].push(item_id);
                    }
                });
                ajaxGetSpecInput2(spec_arr); // 显示下面的输入框
            }

            $(function () {
                $(document).on("click", '.delete_item', function (e) {
                    if ($(this).text() == '无效') {
                        $(this).parent().parent().find('input').attr('disabled', 'disabled');
                        $(this).text('有效');
                    } else {
                        $(this).text('无效');
                        $(this).parent().parent().find('input').removeAttr('disabled');
                    }
                })
            })

            /**
             * 根据用户选择的不同规格选项
             * 返回 不同的输入框选项
             */
            function ajaxGetSpecInput2(spec_arr) {

                var goods_id = $("input[name='goods_id']").val();
                $.ajax({
                    type: 'POST',
                    data: {spec_arr: spec_arr, goods_id: goods_id},
                    url: "goods/goods/ajaxGetSpecInput",
                    success: function (data) {
                        $("#goods_spec_table2").html('').append(data);
                        hbdyg();  // 合并单元格

                        Controller.api.bindevent();
                    }
                });

            }

            // 合并单元格
            function hbdyg() {
                var tab = document.getElementById("spec_input_tab"); //要合并的tableID
                var maxCol = 2, val, count, start;  //maxCol：合并单元格作用到多少列
                if (tab != null) {
                    for (var col = maxCol - 1; col >= 0; col--) {
                        count = 1;
                        val = "";
                        for (var i = 0; i < tab.rows.length; i++) {
                            if (val == tab.rows[i].cells[col].innerHTML) {
                                count++;
                            } else {
                                if (count > 1) { //合并
                                    start = i - count;
                                    tab.rows[start].cells[col].rowSpan = count;
                                    for (var j = start + 1; j < i; j++) {
                                        tab.rows[j].cells[col].style.display = "none";
                                    }
                                    count = 1;
                                }
                                val = tab.rows[i].cells[col].innerHTML;
                            }
                        }
                        if (count > 1) { //合并，最后几行相同的情况下
                            start = i - count;
                            tab.rows[start].cells[col].rowSpan = count;
                            for (var j = start + 1; j < i; j++) {
                                tab.rows[j].cells[col].style.display = "none";
                            }
                        }
                    }
                }
            }
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };


    return Controller;
});