$('#add').click(function () {
    var date = $('#date').val();
    if (isEmpty(date)) {
        date = new Date();
    } else {
        var now = new Date();
        var year = now.getFullYear();       //年
        var month = now.getMonth() + 1;     //月
        var day = now.getDate();            //日
        var clock = year + "-";
        if(month < 10) {
            clock += "0";
        }
        clock += month + "-";
        if(day < 10) {
            clock += "0";
        }
        clock += day;

        date = new Date(date);

        if (date.getTime() > new Date(clock)) {
            Notify('请正确选择日期！', 'top-right', '5000', 'danger', 'fa-bolt', true);
            return;
        }
    }
    var overview = $('#overview').val();
    if (isEmpty(overview)) {
        Notify('任务概述不能为空！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    var completion = $('#completion').val();
    var completionNote = $('#completionNote').val();
    if (isEmpty(completionNote)) {
        Notify('任务概述备注不能为空！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    var score = $('#score').val();
    var scoreNote = $('#scoreNote').val();
    if (isEmpty(scoreNote)) {
        Notify('任务完成质量备注不能为空！', 'top-right', '5000', 'danger', 'fa-bolt', true);
        return;
    }
    var pid = $("#id").val();

    $.ajax({
        url : '/admin/kpi/add',
        type : 'POST',
        dataType : 'JSON',
        data : {'createTime' : date, 'overview' : overview, 'completion' : completion, 'completionNote' : completionNote,
        'score' : score, 'scoreNote' : scoreNote, 'pid' : pid},
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