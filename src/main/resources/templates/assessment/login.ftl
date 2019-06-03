<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/layui/css/layui.css" rel="stylesheet" />
    <link href="/static/css/beyond.min.css" rel="stylesheet" />
    <link rel="shortcut icon" href="https://www.easyicon.net/download/ico/1181656/128/" />
</head>
<body>
<div class="login-container animated fadeInDown">
    <div class="loginbox bg-white">
        <div class="loginbox-title">绩效考核登录页</div>
        <div class="loginbox-or">
            <div class="or-line"></div>
        </div>
        <div class="loginbox-textbox">
            <input type="text" class="form-control" id="user" placeholder="账号" />
        </div>
        <div class="loginbox-textbox">
            <input type="password" class="form-control" id="pass" placeholder="密码" />
        </div>
        <div class="loginbox-submit">
            <input type="button" class="btn btn-primary btn-block" onclick="login();" value="登录">
        </div>
    </div>
</div>
<script src="https://cdnjs.loli.net/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src="/static/layui/layui.all.js"></script>
<script src="/static/js/beyond.min.js"></script>
<script src="/static/js/toastr.js"></script>
<script src="/static/js/utils.js"></script>
<script src="/static/js/login.js"></script>
</body>
</html>