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
                    <span class="widget-caption">${name} 绩效</span>
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
                                <td id="createTime">
                                    ${nowKpi['createTime']?string('yyyy.MM.dd HH:mm')}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    任务概述
                                </td>
                                <td id="overview">
                                    ${nowKpi['overview']}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    任务完成率得分
                                </td>
                                <td id="completion">
                                    ${nowKpi['completion']}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    任务概述备注
                                </td>
                                <td id="completionNote">
                                    ${nowKpi['completionNote']}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    任务完成质量得分
                                </td>
                                <td id="score">
                                    ${nowKpi['score']}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    任务完成质量得分备注
                                </td>
                                <td id="scoreNote">
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
                    <div class="registerbox-textbox" style="margin-bottom: 20px;">
                        <input type="text" class="form-control" id="date" data-options="{'type':'YYYY-MM','beginYear':2019,'endYear':2088}" placeholder="请选择需要查询的日期"/>
                    </div>
                    <div id="box" style="height: 500px;"></div>
                    <input id="viewKpi" value="" hidden/>
                    <input id="id" value="${id}" hidden />
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
<script src="/static/js/viewKpi.js"></script>
<script>
    $.date('#date');
</script>
</body>
</html>