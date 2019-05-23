function user_commont(id) {
    var url = '/admin/user/register';
    var title = '新增用户';
    if (id != -1) {
        url = '/admin/user/update?id=' + id;
        title = '修改用户';
    }

    layer.open({
        title: title,
        area: ['500px', '560px'],
        type: 2,
        content: url
    });
}

function user(id) {
    layer.open({
        title: '个人资料',
        area: ['500px', '560px'],
        type: 2,
        content: '/admin/user?id=' + id
    });
}

function addGroup(id, name) {
    layer.open({
        title: '添加小组成员',
        area: ['500px', '560px'],
        type: 2,
        content: '/admin/group/add?id=' + id + "&name=" + name
    });
}

function addKpi(id, name) {
    layer.open({
        title: '添加绩效',
        area: ['500px', '750px'],
        type: 2,
        content: '/admin/kpi/add?id=' + id + "&name=" + name
    });
}

function updateKpi(id, name) {
    layer.open({
        title: '修改绩效',
        area: ['500px', '750px'],
        type: 2,
        content: '/admin/kpi/update?id=' + id + "&name=" + name
    });
}

function viewKpi(id, name) {
    layer.open({
        title: '查看绩效',
        area: ['95%', '95%'],
        type: 2,
        content: '/admin/kpi/view?id=' + id + "&name=" + name
    });
}

function saveOverview() {
    if ('hidden' == $("#overview").attr('hidden')) {
        $("#overview").removeAttr('hidden');
    } else {
        $("#overview").attr('hidden', 'hidden');
    }
}

function saveOverView(id) {
    // var overviewNote = $("#overviewNote").val();
    // if (isEmpty(overviewNote)) {
    //     Notify('任务概述不能为空！', 'top-right', '5000', 'danger', 'fa-bolt', true);
    //     return;
    // }
    //
    // $.ajax({
    //     url : '/admin/kpi/saveOverview',
    //     data : {'id' : id, 'overview' : overviewNote},
    //     type : 'POST',
    //     dataType : 'JSON',
    //     success : function (response) {
    //         var code = response['code'];
    //         if (code != 0) {
    //             var message = response['message'];
    //             Notify(message, 'top-right', '5000', 'danger', 'fa-bolt', true);
    //             return;
    //         }
    //
    //         window.parent.location.reload();
    //     }
    // })
}