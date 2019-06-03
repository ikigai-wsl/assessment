<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>用户管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/css/beyond.min.css" rel="stylesheet" />
    <link rel="shortcut icon" href="https://www.easyicon.net/download/ico/1181656/128/" />
</head>
<body>

<#include "nav.ftl">

<div class="main-container container-fluid">
    <div class="page-container">
        <div class="page-content">
            <div class="page-body">
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="widget">
                            <div class="widget-header ">
                                <span class="widget-caption">用户管理页</span>
                            </div>
                            <div class="widget-body">
                                <div class="table-toolbar">
                                    <#if loginUser['role'] == 0>
                                        <a onclick="user_commont(-1)" class="btn btn-default">
                                            新增用户
                                        </a>
                                    </#if>
                                    <a class="btn btn-default" onclick="user(${loginUser['id']})">
                                        个人资料
                                    </a>
                                </div>
                                <table class="table table-striped table-hover table-bordered" id="editabledatatable">
                                    <thead>
                                    <tr role="row">
                                        <th>
                                            用户名
                                        </th>
                                        <th>
                                            姓名
                                        </th>
                                        <th>
                                            角色
                                        </th>
                                        <th>
                                            创建时间
                                        </th>
                                        <th>
                                        </th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <#list userList as user>
                                        <#if user['name'] != loginUser['name']>
                                            <#assign role = user['role']>
                                            <tr>
                                                <td>${user['user']}</td>
                                                <td>${user['name']}</td>
                                                <td>
                                                    <#if role == 0>
                                                        管理员
                                                        <#elseif role == 1>
                                                        组长
                                                        <#else >
                                                        员工
                                                    </#if>
                                                </td>
                                                <td>${user['createTime']?string('yyyy.MM.dd HH:mm')}</td>
                                                <td>
                                                    <#if loginUser['role'] == 0>
                                                        <a href="#" class="btn btn-info btn-xs edit" onclick="user_commont(${user['id']})"><i class="fa fa-edit"></i> 修改用户</a>
                                                        <a href="javascript:if (confirm('确定删除此用户？')) {window.location.href = '/admin/user/delete?id=' + ${user['id']}}" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> 删除用户</a>
                                                    </#if>
                                                </td>
                                            </tr>
                                        </#if>
                                    </#list>
                                    </tbody>
                                </table>
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