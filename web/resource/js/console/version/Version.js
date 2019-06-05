/**
 * Created by Administrator on 2017/9/13 0013.
 */

/**
 * 五、版本管理
 */
function Version() {
    this.updateVersionAPI = "/api/version/saveVersion";
    this.delVersionAPI = "/api/version/delVersion";
    this.getVersionListAPI = "/api/version/list";
    this.getVersionByIdAPI = "/api/version/getVersion";
}

Version.id = null;

//版本页面初始化；
Version.prototype.init = function () {
    this.getVersionList();
};

/*版本管理-根据ID查询分类*/
Version.version_add = function (id) {
    if (id) {
        $.ajax({
            type: 'POST',
            url: version.getVersionByIdAPI,
            dataType: 'json',
            data: {
                "id": id
            },
            success: function (data) {
                if (data.state) {
                    $("#js-versionName").val(data.rs.name);
                    $("#js-subVersionBtn").val("修改版本");
                    $("#js-subVersionBtn").attr("class", " btn btn-danger radius");
                    Version.id = id;
                } else {

                }
            },
            error: function (data) {
                console.log(data.msg);
            }
        });


    }

};

/*版本管理-添加、修改AJAX*/
Version.version_add_ajax = function () {
    var cateName = $.trim($("#js-versionName").val());
    if (!cateName) {
        alert("版本名称不能为空！");
        return;
    }
    var data = {
        "id": Version.id,
        "name": cateName
    };
    $.ajax({
        type: 'POST',
        url: version.updateVersionAPI,
        dataType: 'json',
        data: data,
        success: function (data) {
            if (data.state) {
                layer.msg('添加成功！', {icon: 1, time: 1000});
                Version.add_cancel();
                version.getVersionList();
            } else {
                alert(data.message);
                version.init();
            }
        },
        error: function (data) {
            console.log(data.msg);
            version.init();
        }
    });
};

/*版本管理-自动获取新闻分类列表*/
Version.prototype.getVersionList = function () {
    var self = this;

    $.ajax({
        type: 'POST',
        url: self.getVersionListAPI,
        dataType: 'json',
        success: function (data) {
            helperAddCateList(data);
        },
        error: function (data) {
            console.log(data.msg);
        }
    });

    function helperAddCateList(data) {
        var htmlStr = "";
        for (var i = 0, len = data.rs.length; i < len; i++) {
            htmlStr += '<tr class="text-c"><td><input name="" type="checkbox" value=""></td>' +
                '<td>' + data.rs[i].id + '</td><td>' + data.rs[i].name + '</td><td class="td-manage"><a onclick="Version.version_add(' + data.rs[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a style="text-decoration:none" class="ml-5" onClick="Version.version_del(' + data.rs[i].id + ')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td></tr>'
        }
        document.getElementById("tbody").innerHTML = htmlStr;
    }
};

/*版本管理-删除*/
Version.version_del = function (id) {
    var self = this;
    layer.confirm('确认要删除吗？', function () {
        $.ajax({
            type: 'POST',
            url: version.delVersionAPI,
            dataType: 'json',
            data: {"id": id},
            success: function (data) {
                if (data.state) {
                    version.getVersionList();
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
};

/*链接管理-取消修改*/
Version.add_cancel = function () {
    cancelSubmit("js-versionName","js-subVersionBtn");
    Version.id = null;
    $("#js-versionName").val("");
};

//实例化；
var version = new Version();
version.init();
