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