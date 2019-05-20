<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>用户注册</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/css/beyond.min.css" rel="stylesheet" />
</head>
<body>
<div class="register-container animated fadeInDown">
    <div class="registerbox bg-white">
        <div class="registerbox-title">用户</div>

        <div class="registerbox-caption "></div>
        <div class="registerbox-textbox">
            <input type="text" class="form-control" id="user" placeholder="用户名" maxlength="6" />
        </div>
        <div class="registerbox-textbox">
            <input type="password" class="form-control" id="pass" placeholder="密码" maxlength="8" />
        </div>
        <div class="registerbox-textbox">
            <input type="password" class="form-control" id="cofrim_pass" placeholder="确认密码" maxlength="8" />
        </div>
        <div class="registerbox-textbox">
            角色：
            <select id="role" style="min-width: 85%;">
                <option value="2">员工</option>
                <option value="1">组长</option>
            </select>
        </div>
        <hr class="wide" />
        <div class="registerbox-textbox">
            <input type="text" class="form-control" id="name" placeholder="姓名" maxlength="4" />
        </div>
        <div class="registerbox-submit">
            <input type="button" class="btn btn-primary pull-right" id="add" value="添加">
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
