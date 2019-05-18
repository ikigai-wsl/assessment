$("#add").click(function () {
    var user = $("#user").val();
    if (isEmpty(user)) {
        Notify('用户名不能为空！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    if (user.length < 5) {
        Notify('用户名长度5-6位！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    var pass = $("#pass").val();
    if (isEmpty(pass)) {
        Notify('密码不能为空！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    if (pass.length < 6) {
        Notify('密码长度6-8位！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    var cofrim_pass = $("#cofrim_pass").val();
    if (isEmpty(cofrim_pass) || (pass !== cofrim_pass)) {
        Notify('请重新输入确认密码！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    var name = $("#name").val();
    if (isEmpty(cofrim_pass)) {
        Notify('姓名不能为空！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    if (name.length < 2) {
        Notify('姓名长度2-4位！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    var role = $("#role").val();
    $.ajax({
        url : '/admin/user/register',
        type : 'POST',
        data : {'user' : user, 'pass' : pass, 'name' : name, 'role' : role},
        dataType : 'JSON',
        success : function (response) {
            var code = response['code'];
            if (code != 0) {
                var message = response['message'];
                Notify(message, 'top-right', '5000', 'danger', 'fa-bolt', true);
                return;
            }

            window.parent.location.reload();
        }
    })
})

$("#editUserPass").click(function () {
    var pass = $("#new_pass").val();
    if (isEmpty(pass)) {
        Notify('密码不能为空！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    if (pass.length < 6) {
        Notify('密码长度6-8位！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }

    var id = $("#id").val();

    $.ajax({
        url : '/admin/user/updatePass',
        data : {'id' : id, 'pass' : pass},
        dataType : 'JSON',
        success : function (response) {
            var code = response['code'];
            if (code != 0) {
                var message = response['message'];
                Notify(message, 'top-right', '5000', 'danger', 'fa-bolt', true);
                return;
            }

            window.parent.location.href = '/admin/user/logout';
        }
    })
})

$("#editUser").click(function () {
    var user = $("#user").val();
    if (isEmpty(user)) {
        Notify('用户名不能为空！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    if (user.length < 5) {
        Notify('用户名长度5-6位！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    var pass = $("#pass").val();
    if (isEmpty(pass)) {
        Notify('密码不能为空！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    if (pass.length < 6) {
        Notify('密码长度6-8位！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    var name = $("#name").val();
    if (name.length < 2) {
        Notify('姓名长度2-4位！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }

    var role = $("#role").val();
    var id = $("#id").val();

    $.ajax({
        url : '/admin/user/update',
        type : 'POST',
        data : {'user' : user, 'pass' : pass, 'name' : name, 'role' : role, 'id' : id},
        dataType : 'JSON',
        success : function (response) {
            var code = response['code'];
            if (code != 0) {
                var message = response['message'];
                Notify(message, 'top-right', '5000', 'danger', 'fa-bolt', true);
                return;
            }
            window.parent.location.reload();
        }
    })

})