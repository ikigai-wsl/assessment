<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>后台首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/static/css/beyond.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="/admin/index">用户管理</a></li>
                <li class="active"><a href="/admin/group">小组管理</a></li>
                <li><a href="#">绩效管理</a></li>
                <li>
                    <a href="javascript:if (confirm('确定登出？')) {window.location.href = '/admin/user/logout'}">${loginUser['name']}
                        ：登出</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="main-container container-fluid">
    <div class="page-container">
        <div class="page-content">
            <div class="page-body">
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="widget">
                            <div class="widget-header ">
                                <span class="widget-caption">小组管理页</span>
                            </div>
                            <div class="widget-body">
                                <div class="row">
                                    <#list userMap?keys as user>
                                        <div class="col-xs-12 col-md-6">
                                            <div class="well with-header with-footer">
                                                <div class="header bg-palegreen">
                                                    ${user['name']} 的小组
                                                </div>
                                                <a class="btn btn-default" style="margin-bottom: 10px;" onclick="addGroup(${user['id']}, '${user['name']}')">
                                                    添加小组成员
                                                </a>
                                                <table class="table table-bordered table-hover">
                                                    <thead>
                                                    <tr>
                                                        <th>
                                                            用户名
                                                        </th>
                                                        <th>
                                                            姓名
                                                        </th>
                                                        <th>
                                                            创建时间
                                                        </th>
                                                        <th>
                                                        </th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td>
                                                                <a href="javascript:if (confirm('确定将此用户移除小组？')) {}" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i>移除小组</a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </#list>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.loli.net/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src="/static/layui/layui.all.js"></script>
<script src="/static/js/beyond.min.js"></script>
<script src="/static/js/toastr.js"></script>
<script src="/static/js/utils.js"></script>
<script src="/static/js/index.js"></script>
</body>
</html>