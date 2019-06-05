/**
 * Created by Administrator on 2017/7/26 0026.
 */
/**
 * 管理员列表
 */
var getAdminListUrl = "/console/admin/list";

$.validator.setDefaults({
    submitHandler: function () {
        alert("提交事件!");
    }
});
/*验证输入框内容*/
function validateInput() {
    //验证
    $("#form-member-add").validate({
        debug: true,
        rules: {
            userName: {
                required: true
            },
            phone: {
                required: true

            },
            password: {
                required: true,
                rangelength: [6, 21],
                ispass: true
            },
            confirmPassword: {
                required: true,
                equalTo: "#password",
                rangelength: [6, 21]
            },
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            userName: {
                required: "请输入用户名"
            },
            phone: {
                required: "请输入邮箱或手机号"
            },
            password: {
                required: "请输入密码",
                rangelength: "密码在6~21个字符之间",
                ispass: "需至少包含数字、字母和符号中的两种类型"
            },
            confirmPassword: {
                required: "请输入确认密码",
                rangelength: "密码在6~21个字符之间",
                equalTo: "两次输入密码不一致"
            },
            email: {
                required: "请输入一个正确的邮箱"
            }
        },
        errorPlacement: function (error, element) {
            element.addClass("err_input");
            error.appendTo(element.parent().next());
        }
    });
    //input
    $(".phone_reg input").focus(function () {
        $(this).removeClass("err_input");
        $(this).removeClass("col_red");
        $('.reg_return').hide();
        $(".code_err").text("");
    });

}

/*管理员-增加/编辑 ajax: id = null为添加，否则传id*/
function admin_add_ajax() {
    var id =window.location.hash.substring(1);
    validateInput();
    var userName = $.trim($("#userName").val()),
        password = $.trim($("#password").val()),
        confirmPassword = $.trim($("#confirmPassword").val()),
        email = $.trim($("#email").val()),
        phone = $.trim($("#phone").val()),
        data = {
            "id": id,
            "userName": userName,
            "password": password,
            "email": email,
            "phone": phone
        };
    var alertMessage = id ? "修改成功！" : "添加成功！";
    if (userName && password && confirmPassword && (email || phone)) {
        if (confirmPassword === password) {
            if (isRegPhone(phone) || isRegEmail(email)) {
                $.ajax({
                    type: 'POST',
                    url: "/console/admin/save",
                    dataType: 'json',
                    data: data,
                    success: function (data) {
                        if (data.state) {
                            location.hash="";
                            layer.msg(alertMessage, {icon: 1, time: 1000});
                            index.loadContent('admins/admin');
                            getAdminList();
                        } else {
                            alert(data.message);
                        }
                    },
                    error: function (data) {
                        console.log("error");
                    }
                });
            } else {
                alert("邮箱或手机号格式不正确！")
            }
        }
    } else {
        alert("请填填写完整信息!")
    }
}

function isRegPhone(phone) {
    return /^1[3|4|5|7|8]\d{9}$/.test(phone);
}

function isRegEmail(email) {
    var regEmail = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
    return regEmail.test(email);
}

/*获取管理员列表*/
function getAdminList() {
    var htmlStr = "";
    $.ajax({
        type: 'POST',
        url: getAdminListUrl,
        dataType: 'json',
        success: function (data) {
            if (data.state) {
                showAdminList(data);
            }
        },
        error: function (data) {
            console.log(data.msg);
        }

    });
    function showAdminList(data) {
        for (var i = 0, len = data.rs.length; i < len; i++) {
            htmlStr += '<tr class="text-c"><td>' + data.rs[i].id + '</td> <td>' + data.rs[i].name + '</td><td>' + data.rs[i].password + '</td><td>' + data.rs[i].phone + '</td><td>' + data.rs[i].email + '</td><td class="td-manage"><a title="编辑" onclick="admin_edit(' + data.rs[i].id + ')" href="javascript:;" class="delAdmin ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a><a title="删除" href="javascript:;" class="delAdmin ml-5" style="text-decoration:none"><i onclick="admin_del(' + data.rs[i].id + ')" class="Hui-iconfont">&#xe6e2;</i></a></td></tr>'
        }
        document.getElementById('adminListWrap').innerHTML = htmlStr;
    }
}