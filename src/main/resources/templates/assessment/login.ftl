<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>绩效考核后台登录</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/static/css/login.css" />
    <link rel="stylesheet" href="/static/layui/css/layui.css" />
</head>
<body>
<div id="login">
    <h1>绩效考核登录页面</h1>
    <div>
        <p><input type="text" id="user" placeholder="请输入用户名..." maxlength="6"></p>
        <p><input type="password" id="pass" placeholder="请输入密码..." maxlength="18"></p>
        <p><input type="submit" id="login_user" value="登录"></p>
    </div>
</div>
<script src="https://cdnjs.loli.net/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script src="/static/layui/layui.all.js"></script>
<script src="/static/js/utils.js"></script>
<script src="/static/js/login.js"></script>
</body>
</html>