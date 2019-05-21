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
                rotate: 0,
                interval:0
            },
            axisLine:{
                lineStyle :{
                    color: '#CECECE'
                }
            },
            type : 'category',
            boundaryGap : false,
            data : []
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
            name:'任务完成率得分',
            type:'line',
            symbol:'none',
            smooth: 0.2,
            color:['#66AEDE'],
            data: []
        },
        {
            name:'任务完成质量得分',
            type:'line',
            symbol:'none',
            smooth: 0.2,
            color:['#90EC7D'],
            data: []
        }
    ]
};

myChart.setOption(option);

$(function () {
    getKpiData(new Date());
})

function getKpiData(date) {
    var id = $('#id').val();
    date = new Date(date);
    $.ajax({
        url : '/admin/kpi/viewMonth',
        data : {'date' : date, 'id' : id},
        dataType : 'JSON',
        success : function (response) {
            var code = response['code'];
            if (code != 0) {
                Notify('当月没有数据！', 'top-right', '5000', 'danger', 'fa-bolt', true);
                myChart.setOption({
                    title : [{
                        left : '35%',
                        text : date.getFullYear() + '.' + (date.getMonth() + 1) + '月无数据',
                    }],
                    xAxis : [{
                        data : []
                    }],
                    series : [{
                        data : []
                    }, {
                        data : []
                    }]
                })
                return;
            }

            var data  = response['data'];
            var dateList = data['dateList'];
            var scoreList = data['scoreList'];
            var completionList = data['completionList'];
            myChart.setOption({
                title : [{
                    left : '33%',
                    text : date.getFullYear() + '.' + (date.getMonth() + 1) + ' 月绩效数据',
                }],
                xAxis : [{
                    data : dateList
                }],
                series : [{
                    data : scoreList
                }, {
                    data : completionList
                }]
            })
        }
    })
}

function viewKpi() {
    var date = $('#date').val();
    if (isEmpty(date)) {
        Notify('请正确选择日期！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }

    getKpiData(new Date(date));
}