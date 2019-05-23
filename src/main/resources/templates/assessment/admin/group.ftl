<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>小组管理</title>
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
                                <span class="widget-caption">小组管理页</span>
                            </div>
                            <div class="widget-body">
                                <div class="row">
                                    <#list userList as user>
                                        <div class="col-md-12">
                                            <div class="well with-header with-footer">
                                                <div class="header bg-palegreen">
                                                    ${user['name']} 的小组
                                                </div>
                                                <#if loginUser['role'] == 0 || user['id'] == loginUser['id']>
                                                    <a class="btn btn-default" style="margin-bottom: 10px;"
                                                       onclick="addGroup(${user['id']}, '${user['name']}')">
                                                        添加小组成员
                                                    </a>
                                                </#if>
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
                                                    <#list userMap[user['id']?string] as u>
                                                        <tr>
                                                            <td>
                                                                ${u['user']}
                                                            </td>
                                                            <td>
                                                                ${u['name']}
                                                            </td>
                                                            <td>
                                                                ${u['createTime']?string('yyyy.MM.dd HH:mm')}
                                                            </td>
                                                            <td>
                                                               <#if loginUser['role'] == 0 || user['id'] == loginUser['id']>
                                                                   <a href="javascript:if (confirm('确定将此用户移除小组？')) {window.location.href = '/admin/group/removeGroup?id=${u['id']}'}" class="btn btn-danger btn-xs delete">
                                                                       <i class="fa fa-trash-o"></i>移除小组
                                                                   </a>
                                                                   <#else >
                                                                       <a class="btn btn-default btn-xs disabled">
                                                                           <i class="fa fa-trash-o"></i>移除小组
                                                                       </a>
                                                               </#if>
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