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
        <div class="registerbox-title">${userVo['name']}</div>

        <div class="registerbox-caption "></div>
        <div class="registerbox-textbox">
            <input type="text" class="form-control" value="用户名：${userVo['user']}" disabled />
        </div>
        <div class="registerbox-textbox">
            <input type="text" class="form-control" value="角色：${userVo['role']}" disabled />
        </div>
        <div class="registerbox-textbox">
            <input type="text" class="form-control" value="上级：${userVo['pName']}" disabled />
        </div>
        <div class="registerbox-textbox">
            <input type="text" class="form-control" value="姓名：${userVo['name']}" disabled />
        </div>
        <hr class="wide" />
        <div class="registerbox-textbox">
            <input type="password" class="form-control" id="pass" placeholder="密码" maxlength="8" />
            <input type="text" id="id" value="${userVo['id']}" hidden />
        </div>
        <div class="registerbox-submit">
            <input type="button" class="btn btn-primary pull-right" id="editUserPass" value="修改密码">
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
