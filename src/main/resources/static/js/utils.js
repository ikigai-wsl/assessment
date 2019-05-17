function isEmpty(str) {
    if (str.replace(/(^s*)|(s*$)/g, "").length == 0) {
        return true;
    }

    return false;
}

function alertMsg(text) {
    var type = 'auto';
    layer.open({
        type: 1,
        offset: type,
        id: 'layerDemo' + type,
        content: '<div style="padding: 20px 100px;">'+ text +'</div>',
        btn: '关闭全部',
        btnAlign: 'c',
        shade: 0,
        yes: function(){
            layer.closeAll();
        }
    });
}

function getNowTime() {
    var now = new Date();
    var year = now.getFullYear();       //年
    var month = now.getMonth() + 1;     //月
    var day = now.getDate();            //日
    var hh = now.getHours();            //时
    var mm = now.getMinutes();          //分
    var ss = now.getSeconds();           //秒
    var clock = year + "-";
    if(month < 10) {
        clock += "0";
    }
    clock += month + "-";
    if(day < 10) {
        clock += "0";
    }
    clock += day + " ";
    if(hh < 10) {
        clock += "0";
    }
    clock += hh + ":";
    if (mm < 10) {
        clock += '0';
    }
    clock += mm + ":";
    if (ss < 10) {
        clock += '0'
    };
    clock += ss;

    return clock;
}