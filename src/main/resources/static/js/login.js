$("#login_user").click(function () {
   var text = '账号或密码错误！';
   var user = $("#user").val();
   if (isEmpty(user)) {
      alertMsg(text);
      return;
   }

   var pass = $("#pass").val();
   if (isEmpty(pass)) {
      alertMsg(text);
      return;
   }

   $.ajax({
      url : '/login',
      data : {'user' : user, 'pass' : pass},
      method : "POST",
      dataType : "JSON",
      success : function (response) {
         var code = response['code'];
         if (code != 0) {
            var message = response['message'];
            alertMsg(message);
            return;
         }

         window.location.href = "/";
      }
   })
});