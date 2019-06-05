/**
 * Created by Administrator on 2017/9/13 0013.
 */

/**
 * 五、链接管理
 */
function Links() {
    this.updateLinksAPI = "/api/links/save";
    this.delLinksAPI = "/api/links/delLinks";
    this.getLinksListAPI = "/api/links/getlist";
    this.getLinksByIdAPI = "/api/links/getLinks";
}

Links.id = null;

//链接页面初始化；
Links.prototype.init = function () {
    this.btnManageLinks();
};

//点击左侧菜单，显示链接管理页面；
Links.prototype.btnManageLinks = function () {
    var self = this;
    document.getElementById("manageLinks").onclick = function () {
        self.show();
    }
};

/*显示链接管理页面*/
Links.prototype.show = function () {
    UMeditorWrap.style.display = "none";
    htmlTitle = '<li class="active"><span title="友情链接" >友情链接</span><em></em></li>';
    oIframeTitle.innerHTML = htmlTitle;
    htmlStr = `<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 友情链接 <span ' + 'class="c-gray en">&gt;</span> 链接管理</nav><table class="table"><tr><td class="va-t"><div class="page-container" style="width:95%; height:600px"><form action="" method="post" class="form form-horizontal" id="form-user-add"><div class="row cl"><label class="form-label col-xs-4 col-sm-2">网站名称：</label><div class="formControls col-xs-6 col-sm-6"><input type="text" class="input-text " value="" placeholder="请输入网站名称，如：百度" id="js-linksName" name="links-name"></div></div><div class="row cl"><label class="form-label col-xs-4 col-sm-2">网站地址：</label><div class="formControls col-xs-6 col-sm-6"><input type="text" class="input-text " value="" placeholder="请输入网站地址，如：www.baidu.com" id="js-linksSiteName" name="linksSite-name"></div></div><div class="row cl"><label class="form-label col-xs-4 col-sm-2">渠道：</label><div class="formControls col-xs-6 col-sm-6"><input type="text" class="input-text " value="" placeholder="友情链接渠道，如：中国，填cn;英文填en" id="js-linksChannel" name="Channel-name"></div></div><div class="row cl"><label class="form-label col-xs-4 col-sm-2">显示位置：</label><div class="formControls col-xs-6 col-sm-6"><input type="text" class="input-text " value="" placeholder="友情链接的显示位置，0为首页；" id="js-linksShowWhere" name="ShowWhere-name"></div></div><div class="row cl"><div class="col-9 col-offset-2"><input id="js-subLinksBtn" class="js-submit btn btn-primary radius" onclick="Links.add_ajax()" value="&nbsp;&nbsp;添加&nbsp;&nbsp;"><input style="margin-left:20px;" id="js-cancelLinksBtn" class="js-submit btn btn-default radius" onclick="Links.add_cancel()" value="&nbsp;&nbsp;取消&nbsp;&nbsp;"></div></div></form><div class="mt-20"><table class="table table-border table-bordered table-bg table-hover table-sort"><thead><tr class="text-c"><th width="40"><input name="" type="checkbox" value=""></th><th width="80">序号</th></th><th width="80">ID</th><th>网址名称</th><th>网址地址</th><th>显示位置</th><th>渠道</th><th width="100">操作</th></tr> </thead> <tbody id="tbody"> </tbody> </table> </div></div></td></tr></table>`;
    iframeWrap.innerHTML = htmlStr;
    this.getList();
};

/*链接管理-根据ID查询分类*/
Links.add = function (id) {
    $("#iframe_box").scrollTop("-35");
    if (id) {
        $.ajax({
            type: 'POST',
            url: links.getLinksByIdAPI,
            dataType: 'json',
            data: {
                "id": id
            },
            success: function (data) {
                if (data.state) {
                    $("#js-linksName").val(data.rs.name);//名称
                    $("#js-linksSiteName").val(data.rs.website);//网址
                    $("#js-linksChannel").val(data.rs.channel);//渠道
                    $("#js-linksShowWhere").val(data.rs.showWhere);

                    $("#js-subLinksBtn").val("修改链接");
                    $("#js-cancelLinksBtn").show();
                    $("#js-subLinksBtn").attr("class", " btn btn-danger radius");
                    Links.id = id;
                } else {

                }
            },
            error: function (data) {
                console.log(data.msg);
            }
        });


    }

};

/*链接管理-取消修改*/
Links.add_cancel = function () {
    var list = ["js-linksName", "js-linksSiteName", "js-linksChannel", "js-linksShowWhere"];
    cancelSubmit(list, "js-subLinksBtn")
};

/*链接管理-添加、修改AJAX*/
Links.add_ajax = function () {
    var siteName = $.trim($("#js-linksName").val());
    var website = $.trim($("#js-linksSiteName").val());
    var channel = $.trim($("#js-linksChannel").val());
    var showWhere = $.trim($("#js-linksShowWhere").val());
    showWhere = parseInt(showWhere);
    if (!siteName) {
        alert("链接名称不能为空！");
        return;
    } else if (!website) {
        alert("链接网址不能为空！");
    } else if (!channel) {
        alert("链接渠道不能为空！");
    }
    data = {
        "id": Links.id,
        "name": siteName,
        "website": website,
        "channel": channel,
        "showWhere": showWhere
    };
    $.ajax({
        type: 'POST',
        url: links.updateLinksAPI,
        dataType: 'json',
        data: data,
        success: function (data) {
            if (data.state) {
                layer.msg('添加成功！', {icon: 1, time: 1000});
                links.show();
                Links.id = null;
            } else {
                alert(data.message);
                links.show();
            }
        },
        error: function (data) {
            console.log(data.msg);
            links.show();
        }
    });
};

/*链接管理-删除*/
Links.del = function (id) {
    var self = this;
    layer.confirm('确认要删除吗？', function () {
        $.ajax({
            type: 'POST',
            url: links.delLinksAPI,
            dataType: 'json',
            data: {"id": id},
            success: function (data) {
                if (data.state) {
                    links.getList();
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

/*链接管理-自动获取新闻分类列表*/
Links.prototype.getList = function () {

    $.ajax({
        type: 'POST',
        url: this.getLinksListAPI,
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
            var number = i + 1;

            htmlStr += '<tr class="text-c"><td><input name="" type="checkbox" value=""></td>' +
                '<td>' + number + '</td><td>' + data.rs[i].id + '</td><td>' + data.rs[i].name + '</td><td>' + data.rs[i].website + '</td><td>' + data.rs[i].showWhere + '</td><td>' + data.rs[i].channel + '</td><td class="td-manage"><a onclick="Links.add(' + data.rs[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a style="text-decoration:none" class="ml-5" onClick="Links.del(' + data.rs[i].id + ')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td></tr>'
        }
        document.getElementById("tbody").innerHTML = htmlStr;
    }
};


//实例化；
var links = new Links();
links.init();
