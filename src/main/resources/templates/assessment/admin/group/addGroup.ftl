<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>添加小组成员</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/css/beyond.min.css" rel="stylesheet" />
    <link href="https://cdnjs.loli.net/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
<div class="register-container animated fadeInDown">
    <div class="registerbox bg-white">
        <div class="registerbox-title">${name} 的小组</div>

        <div class="registerbox-caption "></div>

        <#list userList as user>
            <div class="form-group">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="${user['id']}">
                        <span class="text">${user['name']}</span>
                    </label>
                </div>
            </div>
        </#list>

        <div class="registerbox-submit">
            <input id="id" value="${id}" hidden/>
            <input type="button" class="btn btn-primary pull-right" id="addGroup" value="添加">
        </div>
    </div>
</div>
<script src="https://cdnjs.loli.net/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src="/static/js/beyond.min.js"></script>
<script src="/static/js/toastr.js"></script>
<script src="/static/js/utils.js"></script>
<script src="/static/js/user.js"></script>
</body>
</html>
