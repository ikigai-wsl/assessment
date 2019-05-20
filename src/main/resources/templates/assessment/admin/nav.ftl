<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li <#if active == 1>class="active"</#if>><a href="/admin/index">用户管理</a></li>
                <li <#if active == 2>class="active"</#if>><a href="/admin/group">小组管理</a></li>
                <li <#if active == 3>class="active"</#if>><a href="/admin/kpi">绩效管理</a></li>
                <li><a href="javascript:if (confirm('确定登出？')) {window.location.href = '/admin/user/logout'}">${loginUser['name']}：登出</a></li>
            </ul>
        </div>
    </div>
</nav>
