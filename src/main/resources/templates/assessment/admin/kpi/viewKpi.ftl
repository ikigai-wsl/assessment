<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>查看绩效</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/css/beyond.min.css" rel="stylesheet" />
</head>
<body>

<div>
    <div class="row">
        <div class="col-md-12">
            <div class="widget">
                <div class="widget-header">
                    <span class="widget-caption">绩效查看</span>
                </div>
                <div style="margin-top: 20px;">
                    <div class="well with-header  with-footer">

                    <div class="header bg-blue">
                        当日绩效
                    </div>
                    <div class="widget-body">
                        <#if nowKpi??>
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <td>
                                   创建日期
                                </td>
                                <td>
                                    ${nowKpi['createTime']?string('yyyy.MM.dd HH:mm')}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    任务概述
                                </td>
                                <td>
                                    ${nowKpi['overview']}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    任务完成率得分
                                </td>
                                <td>
                                    ${nowKpi['completion']}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    任务概述备注
                                </td>
                                <td>
                                    ${nowKpi['completionNote']}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    任务完成质量得分
                                </td>
                                <td>
                                    ${nowKpi['score']}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    任务完成质量得分备注
                                </td>
                                <td>
                                    ${nowKpi['scoreNote']}
                                </td>
                            </tr>
                            </tbody>
                        </table>
                            <#else >
                            当日无数据
                        </#if>
                    </div>
                    </div>
                </div>
            </div>

            <div class="well with-header  with-footer">

                <div class="header bg-blue">
                    当月绩效
                </div>

                <div class="widget-body">
                    <div class="registerbox-textbox">
                        <input type="text" class="form-control" id="date" data-options="{'type':'YYYY-MM','beginYear':2019,'endYear':2088}" placeholder="请选择需要查询的日期"/>
                    </div>

                    <div id="box" style="height: 350px;"></div>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://cdnjs.loli.net/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src="/static/js/jquery.date.js"></script>
<script src="/static/js/beyond.min.js"></script>
<script src="/static/js/toastr.js"></script>
<script src="/static/js/utils.js"></script>
<script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts-en.common.js"></script>
<script>
    $.date('#date');

    var myChart = echarts.init(document.getElementById("box"));

    // option 里面的内容基本涵盖你要画的图表的所有内容
    var option = {
        backgroundColor: '#FBFBFB',
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['任务完成率得分','任务完成质量得分']
        },

        calculable : true,


        xAxis : [
            {
                axisLabel:{
                    rotate: 30,
                    interval:0
                },
                axisLine:{
                    lineStyle :{
                        color: '#CECECE'
                    }
                },
                type : 'category',
                boundaryGap : false,
                data : function (){
                    var list = [];
                    for (var i = 10; i <= 18; i++) {
                        if(i<= 12){
                            list.push('2016-'+i + '-01');
                        }else{
                            list.push('2017-'+(i-12) + '-01');
                        }
                    }
                    return list;
                }()
            }
        ],
        yAxis : [
            {
                type : 'value',
                axisLine:{
                    lineStyle :{
                        color: '#CECECE'
                    }
                }
            }
        ],
        series : [
            {
                name:'充值',
                type:'line',
                symbol:'none',
                smooth: 0.2,
                color:['#66AEDE'],
                data:[800, 300, 500, 800, 300, 600,500,600]
            },
            {
                name:'消费',
                type:'line',
                symbol:'none',
                smooth: 0.2,
                color:['#90EC7D'],
                data:[600, 300, 400, 200, 300, 300,200,400]
            }
        ]
    };

    myChart.setOption(option);
</script>
</body>
</html>