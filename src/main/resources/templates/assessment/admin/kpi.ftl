<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>绩效管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/static/css/beyond.min.css" rel="stylesheet"/>
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
                                <span class="widget-caption">绩效管理</span>
                            </div>
                            <div class="widget-body">
                                <div class="row">
                                    <#list userList as user>
                                        <div class="col-md-12">
                                            <div class="well with-header with-footer">
                                                <div class="header bg-palegreen">
                                                    ${user['name']} 的小组
                                                </div>
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
                                                    <tr>
                                                        <td>
                                                            ${user['user']}
                                                        </td>
                                                        <td>
                                                            ${user['name']}
                                                        </td>
                                                        <td>
                                                            组长
                                                        </td>
                                                        <td>
                                                            ${user['createTime']?string('yyyy.MM.dd HH:mm')}
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-success btn-xs" onclick="addKpi(${user['id']}, '${user['name']}')">
                                                                <i class="fa fa-trash-o"></i>添加绩效
                                                            </a>
                                                            <a href="#" class="btn btn-info btn-xs" onclick="updateKpi(${user['id']}, '${user['name']}')">
                                                                <i class="fa fa-trash-o"></i>修改绩效
                                                            </a>
                                                            <a href="#" class="btn btn-primary btn-xs" onclick="viewKpi(${user['id']}, '${user['name']}')">
                                                                <i class="fa fa-trash-o"></i>查看绩效
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <#list userMap[user['id']?string] as u>
                                                        <tr>
                                                            <td>
                                                                ${u['user']}
                                                            </td>
                                                            <td>
                                                                ${u['name']}
                                                            </td>
                                                            <td>
                                                                员工
                                                            </td>
                                                            <td>
                                                                ${u['createTime']?string('yyyy.MM.dd HH:mm')}
                                                            </td>
                                                            <td>
                                                                <a href="#" class="btn btn-success btn-xs" onclick="addKpi(${u['id']}, '${u['name']}')">
                                                                    <i class="fa fa-trash-o"></i>添加绩效
                                                                </a>
                                                                <a href="#" class="btn btn-info btn-xs" onclick="updateKpi(${u['id']}, '${u['name']}')">
                                                                    <i class="fa fa-trash-o"></i>修改绩效
                                                                </a>
                                                                <a href="#" class="btn btn-primary btn-xs" onclick="viewKpi(${u['id']}, '${u['name']}')">
                                                                    <i class="fa fa-trash-o"></i>查看绩效
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </#list>
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
