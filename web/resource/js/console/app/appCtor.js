/**
 * Created by Administrator on 2017/9/13 0013.
 */
/**
 * application 分类
 */
var addAppCateAPI = "/api/application/saveCategory";
var delAppCateUrl = "/api/application/delCategory";
var getAppCateListUrl = "/api/application/categorylist";
var getAppCateAPI = "/api/application/getCategory";
var appId;

getInfoCateList();//加载应用分类列表；

/*应用分类-根据ID查询分类*/
function app_edit(id) {
    if (id) {
        $.ajax({
            type: 'POST',
            url: getAppCateAPI,
            dataType: 'json',
            data: {
                "id": id
            },
            success: function (data) {
                if (data.state) {
                    $("#infoCateName").val(data.rs.name);
                    $("#subInfoCatBtn").val("修改分类");
                    $("#subInfoCatBtn").attr("class", " btn btn-danger radius");
                    appId = id;
                } else {

                }
            },
            error: function (data) {
                console.log(data.msg);
            }
        });
    }

}

/*应用分类-添加、修改AJAX*/
function app_add_ajax() {
    var cateName = $.trim($("#infoCateName").val());
    if (!cateName) {
        alert("分类名称不能为空！");
        return;
    }
    var data = {
        "id": appId,
        "name": cateName
    };
    $.ajax({
        type: 'POST',
        url: addAppCateAPI,
        dataType: 'json',
        data: data,
        success: function (data) {
            if (data.state) {
                layer.msg('添加成功！', {icon: 1, time: 1000});
                infoCate_page();
                appId = undefined;
            } else {
                alert(data.message);
                infoCate_page();

            }
        },
        error: function (data) {
            console.log(data.msg);
            infoCate_page();
        }
    });
}

/* 成功后初始化页面 */
function infoCate_page() {
    index.loadContent("app/appCategory");//加载信息管理页面；
    inCateadd_cancel();
}

/*应用分类-取消添加*/
function inCateadd_cancel() {
    cancelSubmit("infoCateName", "subInfoCatBtn");
}

/*应用分类-删除*/
function app_del(id) {
    layer.confirm('确认要删除吗？', function () {
        $.ajax({
            type: 'POST',
            url: delAppCateUrl,
            dataType: 'json',
            data: {"id": id},
            success: function (data) {
                if (data.state) {
                    getInfoCateList();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                } else {
                    alert(data.message);
                }
            },
            error: function (data) {
                console.log(data.msg);
            }
        });
    });
}

/*应用分类-自动获取应用分类列表*/
function getInfoCateList() {
    $.ajax({
        type: 'POST',
        url: getAppCateListUrl,
        dataType: 'json',
        success: function (data) {
            addCateList(data);
        },
        error: function (data) {
            console.log(data.msg);
        }
    });

    function addCateList(data) {
        var htmlStr = "";
        for (var i = 0, len = data.rs.length; i < len; i++) {
            htmlStr += '<tr class="text-c"><td><input name="" type="checkbox" value=""></td>' +
                '<td>' + data.rs[i].id + '</td><td>' + data.rs[i].name + '</td><td class="td-manage"><a onclick="app_edit(' + data.rs[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a style="text-decoration:none" class="ml-5" onClick="app_del(' + data.rs[i].id + ')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td></tr>'
        }
        document.getElementById("tbody").innerHTML = htmlStr;
    }
}