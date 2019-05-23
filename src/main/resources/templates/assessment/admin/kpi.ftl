<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>绩效管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/static/css/beyond.min.css" rel="stylesheet"/>
    <style>
    </style>
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
                                <#if loginUser['role'] != 0>
                                    <div style="margin-bottom: 20px;">
                                        <a class="btn btn-default" onclick="saveOverview()">
                                            添加任务概述
                                        </a>
                                        <a class="btn btn-default" onclick="user(${loginUser['id']})">
                                            个人资料
                                        </a>
                                        <div id="overview" class="registerbox bg-white" style="width: 250px; margin: 20px 0 0 0" hidden>
                                            <div class="registerbox-textbox">
                                                <textarea id="overviewNote" style="width: 100%; height: 100px; resize: none;" placeholder="任务概述备注" maxlength="200"></textarea>
                                            </div>
                                            <div class="registerbox-submit" style="margin-bottom: 40px;">
                                                <input type="button" class="btn btn-primary pull-right" value="保存" onclick="saveOverView(${loginUser['id']})">
                                            </div>
                                        </div>
                                </div>
                                </#if>
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
                                                            <#if loginUser['role'] == 0 || user['id'] == loginUser['id']>
                                                                <a href="#" class="btn btn-success btn-xs" onclick="addKpi(${user['id']}, '${user['name']}')">
                                                                    <i class="fa fa-trash-o"></i>添加绩效
                                                                </a>
                                                                <#else >
                                                                    <a class="btn btn-default btn-xs disabled">
                                                                        <i class="fa fa-trash-o"></i>添加绩效
                                                                    </a>
                                                            </#if>
                                                            <#if loginUser['role'] == 0>
                                                                <a href="#" class="btn btn-info btn-xs" onclick="updateKpi(${user['id']}, '${user['name']}')">
                                                                    <i class="fa fa-trash-o"></i>修改绩效
                                                                </a>
                                                                <#else >
                                                                    <a class="btn btn-default btn-xs disabled">
                                                                        <i class="fa fa-trash-o"></i>修改绩效
                                                                    </a>
                                                            </#if>
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
                                                                <#if loginUser['role'] == 0 || user['id'] == loginUser['id']>
                                                                    <a href="#" class="btn btn-success btn-xs" onclick="addKpi(${u['id']}, '${u['name']}')">
                                                                        <i class="fa fa-trash-o"></i>添加绩效
                                                                    </a>
                                                                    <#else >
                                                                        <a class="btn btn-default btn-xs disabled">
                                                                            <i class="fa fa-trash-o"></i>添加绩效
                                                                        </a>
                                                                </#if>
                                                                <#if loginUser['role'] == 0>
                                                                    <a href="#" class="btn btn-info btn-xs" onclick="updateKpi(${u['id']}, '${u['name']}')">
                                                                        <i class="fa fa-trash-o"></i>修改绩效
                                                                    </a>
                                                                    <#else >
                                                                        <a class="btn btn-default btn-xs disabled">
                                                                            <i class="fa fa-trash-o"></i>修改绩效
                                                                        </a>
                                                                </#if>
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
