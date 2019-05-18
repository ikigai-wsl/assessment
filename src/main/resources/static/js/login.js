function login() {
   var text = '账号或密码错误！';
   var user = $("#user").val();
   if (isEmpty(user)) {
      Notify('账号或密码错误！', 'top-right', '5000', 'danger', 'fa-bolt', true);
      return;
   }

   var pass = $("#pass").val();
   if (isEmpty(pass)) {
      Notify('账号或密码错误！', 'top-right', '5000', 'danger', 'fa-bolt', true);
      return;
   }

   $.ajax({
      url : '/login',
      data : {'user' : user, 'pass' : pass},
      type : "POST",
      dataType : "JSON",
      success : function (response) {
         var code = response['code'];
         if (code != 0) {
            var message = response['message'];
            Notify(message, 'top-right', '5000', 'danger', 'fa-bolt', true);
            return;
         }

         window.location.href = "/";
      }
   })
};

$(document).keyup(function(event){
   if(event.keyCode == 13){
      login();
   }
});