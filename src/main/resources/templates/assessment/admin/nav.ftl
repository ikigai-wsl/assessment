<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/admin/index">用户管理</a></li>
                <li><a href="#">小组管理</a></li>
                <li><a href="#">绩效管理</a></li>
                <li><a href="javascript:if (confirm('确定登出？')) {window.location.href = '/admin/user/logout'}">${loginUser['name']}：登出</a></li>
            </ul>
        </div>
    </div>
</nav>
