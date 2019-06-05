/**
 * Created by Administrator on 2017/12/15 0015.
 */
/**
 * 用户登录
 */
var logInUrl = "/api/login";

$("#login").click(function () {
    login();
});
document.onkeydown = function (event) {
    var e = event || window.event || arguments.callee.caller.arguments[0];
    if (e && e.keyCode == 27) { // 按 Esc
        //要做的事情
    }
    if (e && e.keyCode == 113) { // 按 F2
        //要做的事情
    }
    if (e && e.keyCode == 13) { // enter 键
        //要做的事情
        login();
    }
};
function login() {
    var userName = $.trim($("#userName").val());
    var password = $.trim($("#password").val());
    var data = {
        'userName': userName,//帐号
        'password': password//密码
//                'ts': new Date().getTime()//时间戳
    };
    if (userName == null || userName == '') {
        alert("用户名不能为空!");
        return false;
    }
    if (password == null || password == '') {
        alert("密码不能为空！");
        return false;
    }

    $.ajax({
        type: 'post',
        url: logInUrl,
        data: data,
        dataType: "json",
        success: function (res) {
            if (res.state) {
                document.location.href = "/console";
            } else {
                alert(res.message);
            }
            //
            if (res) {

            } else {
                alert("用户名或密码错误！");
                return false;
            }
        }
    })
}