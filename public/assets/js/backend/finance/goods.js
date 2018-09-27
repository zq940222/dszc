define(['jquery', 'bootstrap', 'backend', 'table', 'form','echarts','echarts-theme'], function ($, undefined, Backend, Table, Form, Echarts, undefined) {

    var Controller = {
        index: function () {
            var form = $("#one");
            var ranges = {};
            ranges[__('Today')] = [Moment().startOf('day'), Moment().endOf('day')];
            ranges[__('Yesterday')] = [Moment().subtract(1, 'days').startOf('day'), Moment().subtract(1, 'days').endOf('day')];
            ranges[__('Last 7 Days')] = [Moment().subtract(6, 'days').startOf('day'), Moment().endOf('day')];
            ranges[__('Last 30 Days')] = [Moment().subtract(29, 'days').startOf('day'), Moment().endOf('day')];
            ranges[__('This Month')] = [Moment().startOf('month'), Moment().endOf('month')];
            ranges[__('Last Month')] = [Moment().subtract(1, 'month').startOf('month'), Moment().subtract(1, 'month').endOf('month')];
            ranges[__('今年')] = [Moment().startOf('year'), Moment().endOf('year')];
            var options = {
                timePicker: false,
                autoUpdateInput: false,
                timePickerSeconds: true,
                timePicker24Hour: true,
                autoApply: true,
                locale: {
                    format: 'YYYY-MM-DD HH:mm:ss',
                    customRangeLabel: __("Custom Range"),
                    applyLabel: __("Apply"),
                    cancelLabel: __("Clear"),
                },
                ranges: ranges,
            };
            var callback = function (start, end) {
                $(this.element).val(start.format(options.locale.format) + " - " + end.format(options.locale.format));
            };
            require(['bootstrap-daterangepicker'], function () {
                $(".datetimerange", form).each(function () {
                    $(this).on('apply.daterangepicker', function (ev, picker) {
                        callback.call(picker, picker.startDate, picker.endDate);
                        var label = picker.chosenLabel;
                        $(picker.element).data('label', label).trigger("change");
                    });
                    $(this).on('cancel.daterangepicker', function (ev, picker) {
                        $(this).val('');
                    });
                    $(this).daterangepicker($.extend({}, options), callback);
                });
            });

            Form.api.bindevent($("form[role=form]"), function (data, ret) {
                Controller.api.charts(data);
            });

            $(".btn-success", form).trigger('click');
        },
        api: {
            charts: function (data) {
                var myChart1 = Echarts.init(document.getElementById('echart'),'walden');
                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '',
                        subtext: ''
                    },
                    tooltip: {
                        trigger: 'axis',
                    },
                    legend: {
                        data: ['订单量', '订单金额']
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType: {show: true, type: ['line', 'bar']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data: data.column,
                    },
                    yAxis: [
                        {
                            type : 'value',
                            name : '金额',
                            axisLabel : {
                                formatter: '{value} ￥'
                            }
                        },
                    ],
                    grid: [{
                        left: '3%',
                        top: '-1%',
                        right: '4%',
                        bottom: '0',
                        containLabel: true
                    }],
                    series: [{
                        name: '订单量',
                        type: 'line',
                        smooth: true,
                        areaStyle: {
                            normal: {
                            }
                        },
                        lineStyle: {
                            normal: {
                                width: 1.5
                            }
                        },
                        data: data.series.total_num,
                        },
                        {
                            name: '订单金额',
                            type: 'line',
                            smooth: true,
                            areaStyle: {
                                normal: {
                                }
                            },
                            lineStyle: {
                                normal: {
                                    width: 1.5
                                }
                            },
                            data: data.series.amount,
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart1.setOption(option);
            }
        }
    };
    return Controller;
});