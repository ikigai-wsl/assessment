<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>修改绩效</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/css/beyond.min.css" rel="stylesheet" />
</head>
<body>
<div class="register-container animated fadeInDown">
    <div class="registerbox bg-white" style="height: 660px !important;">
        <div class="registerbox-title">修改 ${name} 绩效</div>

        <div class="registerbox-caption"></div>
        <div class="registerbox-textbox">
            <input type="text" class="form-control" id="date" data-options="{'type':'YYYY-MM-DD','beginYear':2019,'endYear':2088}" placeholder="请选择需要查询的日期"/>
        </div>
        <div class="registerbox-textbox">
            <textarea id="overview" style="width: 100%; height: 100px; resize: none;" placeholder="任务概述" maxlength="1000" ></textarea>
        </div>
        <div class="registerbox-textbox">
            任务完成率得分：
            <select id="completion" style="min-width: 64%;">
                <option value="1.25">1.25</option>
                <option value="1">1</option>
                <option value="0.8">0.8</option>
                <option value="0.5">0.5</option>
                <option value="0">0</option>
            </select>
        </div>
        <div class="registerbox-textbox">
            <textarea id="completionNote" style="width: 100%; height: 100px; resize: none;" placeholder="任务概述备注" maxlength="1000"></textarea>
        </div>
        <hr class="wide" />
        <div class="registerbox-textbox">
            任务完成质量得分：
            <select id="score" style="min-width: 60%;">
                <option value="1">1</option>
                <option value="0.5">0.5</option>
                <option value="0">0</option>
            </select>
        </div>
        <div class="registerbox-textbox">
            <textarea id="scoreNote" style="width: 100%; height: 100px; resize: none;" placeholder="任务完成质量得分备注" maxlength="1000"></textarea>
        </div>
        <div class="registerbox-submit">
            <input type="button" class="btn btn-primary pull-right" id="update" value="修改">
            <input id="id" value="${id}" hidden />
            <input id="changeDate" value="" hidden />
            <input id="isUpdate" value="0" hidden />
            <input id="kpiId" value="" hidden />
        </div>
    </div>
</div>
<script src="https://cdnjs.loli.net/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src="/static/js/jquery.date.js"></script>
<script src="/static/js/beyond.min.js"></script>
<script src="/static/js/toastr.js"></script>
<script src="/static/js/utils.js"></script>
<script src="/static/js/kpi.js"></script>
<script>
    Notify('请先选择需要修改的日期！', 'top-right', '5000', 'info', 'fa-bolt', true);
    $.date('#date');
</script>
</body>
</html>