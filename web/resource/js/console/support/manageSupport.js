/**
 * 六、支持管理
 */

function Support() {
    this.updateVersionAPI = "/api/version/saveVersion";
    this.delVersionAPI = "/api/version/delVersion";
    this.getVersionListAPI = "/api/version/list";
    this.getVersionByIdAPI = "/api/version/getVersion";
    this.getSupportListAPI = "/api/support/list";
    this.delSupportAPI = "/api/support/del";
    this.addSupportAPI = "/api/support/save";
    this.getSupportByIdAPI = "/api/support/getSupport";
    this.flag = "全部";
}

//支持栏目分类；
var supportColumnTypeList = {
    rs: [
        {
            "id": 1,
            "name": "Installation & Activation"
        },
        {
            "id": 2,
            "name": "User Guide"
        },
        {
            "id": 3,
            "name": "Video Library"
        },
        {
            "id": 4,
            "name": "Tips & Tricks"
        }
    ]
};

//添加支持分类；
function addSupportCateList(id, noAll) {
    var htmlStr = '<option data-id="">全部</option>';
    if (noAll) {
        htmlStr = ''
    }

    for (var i = 0, len = supportColumnTypeList.rs.length; i < len; i++) {
        htmlStr += '<option data-id="' + supportColumnTypeList.rs[i].id + '">' + supportColumnTypeList.rs[i].name + '</option>'
    }
    $("#" + id).html(htmlStr);
}

Support.id = null;

/*显示支持管理页面*/
Support.prototype.init = function () {
    // 添加支持分类；
    addSupportCateList("dSearchSupportCat");

    // 添加支持文件列表
    page(support.getSupportListAPI);

};

/*支持管理-获取支持列表*/
Support.prototype.getSupportList = function (res) {
    var htmlStr = "";
    var columnType = "";
    for (var i = 0, len = res.data.length; i < len; i++) {
        var adminName;
        try {
            if (res.data[i].adminUsers.name) {
                adminName = res.data[i].adminUsers.name
            } else {
                adminName = ""
            }
        } catch (e) {
            console.log(e);
        }

        //根据ID转换成汉字；
        columnType = res.data[i].columnType - 1;
        //添加支持分类栏目；
        for (var j = 0, length = supportColumnTypeList.rs.length; j < length; j++) {
            if (j == columnType) {
                columnType = supportColumnTypeList.rs[j].name;
            }
        }
        htmlStr += '<tr class="text-c"><td><input type="checkbox" value="" name=""></td><td>' + res.data[i].id + '</td><td >' + res.data[i].title + '</td><td>' + columnType + '</td><td>' + res.data[i].productCategory.name + '</td><td>' + res.data[i].releaseTime.substring(0,10) + '</td><td>' + adminName + '</td><td class="f-14 td-manage"><a  data-id="supportFlag" onclick="support_edit(this,' + res.data[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a data-id="supportFlag" onclick="support_del(' + res.data[i].id + ')" title="删除" href="javascript:;" class="delAdmin ml-5" style="text-decoration:none"><i  class="Hui-iconfont">&#xe6e2;</i></a></td></tr>';

    }
    document.getElementById("infoList_wrap").innerHTML = htmlStr;
};

/* 根据分类查询支持列表 */
Support.prototype.queryCate = function () {
    var category = $("#dSearchSupportCat").find("option:selected").attr("data-id");
    page(support.getSupportListAPI, category);
};

/* 根据关键字查询支持列表 */
Support.prototype.searchInfo = function () {
    var keywords = $("#support_searchInfo_words").val();
    var cateID = $("#catFilter").find("option:selected").attr("data-id");//新闻、案例分类；
    page(support.getSupportListAPI, cateID, keywords);
};

/* 支持-编辑*/
function support_edit(target, id) {
    var btnName = $(target).attr("data-id");
    window.location.href = "/console/support" + "?id=" + id + "&tag=" + btnName;
}

/*支持管理-删除*/
Support.version_del = function (id) {
    var self = this;
    layer.confirm('确认要删除吗？', function () {
        $.ajax({
            type: 'POST',
            url: support.delSupportAPI,
            dataType: 'json',
            data: {"id": id},
            success: function (data) {
                if (data.state) {
                    // support.getVersionList();
                    support.getSupportList();
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

/*信息-删除*/
function support_del(id) {
    layer.confirm('确认要删除吗？', function () {
        $.ajax({
            type: 'POST',
            url: support.delSupportAPI,
            dataType: 'json',
            data: {
                "id": id
            },
            success: function (data) {
                if (data.state) {

                    page(support.getSupportListAPI);

                    layer.msg('已删除!', {icon: 1, time: 1000});
                } else {
                    alert(data.message)
                }
            },
            error: function (data) {
                console.log(data.msg);
            }
        });
    });
}

//实例化；
var support = new Support();
support.init();
