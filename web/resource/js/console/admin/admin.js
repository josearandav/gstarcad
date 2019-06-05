/**
 * Created by Administrator on 2017/7/26 0026.
 */
/**
 * 管理员列表
 */
var getAdminListUrl = "/console/admin/list";
var getAdminByIdUrl = "/console/admin/getAdminUser";

getAdminList();

/*管理员-编辑*/
function admin_edit(id) {
    index.loadContent('admins/addAdmin');
    location.hash=id;

    getAdminById(id);
}
function getAdminById(id) {
    $.ajax({
        type: 'POST',
        url: getAdminByIdUrl,
        dataType: 'json',
        data: {"id": id},
        success: function (data) {
            if (data.state) {
                var rs = data.rs;
                $("#userName").val(rs.name);
                $("#password").val(rs.password);
                $("#phone").val(rs.phone);
                $("#email").val(rs.email);
            }
        },
        error: function (data) {
            console.log(data.msg);
        }

    });
}

$.validator.setDefaults({
    submitHandler: function () {
        alert("提交事件!");
    }
});

/*管理员-删除*/
function admin_del(id) {
    layer.confirm('确认要删除吗？', function (index) {
        $.ajax({
            type: 'POST',
            url: "/console/admin/del",
            dataType: 'json',
            data: {id: id},
            success: function (data) {
                if (data.state) {
                    getAdminList(data);
                    layer.msg('已删除!', {icon: 1, time: 1000});
                }

            },
            error: function (data) {
                console.log(data.msg);
            }
        });
    });
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