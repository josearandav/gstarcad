/**
 * 一、栏目分类
 */
function ProCategory() {
    this.data = null;
    this.catId = null;
    this.addProCateAPI = "/api/product/saveCategory";
    this.delProCateUrl = "/api/product/delCategory";
    this.getProCateListUrl = "/api/product/categorylist";
    this.getProCateById = "/api/product/getCategory";
}

ProCategory.prototype.init = function () {
    this.getProCateList();
};

/*修改产品分类名称*/
ProCategory.prototype.proCategory_add = function (id) {
    var self = this;
    if (id) {
        $.ajax({
            type: 'POST',
            url: self.getProCateById,
            dataType: 'json',
            data: {
                "id": id
            },
            success: function (data) {
                if (data.state) {
                    $("#procateName").val(data.rs.name);
                    $("#prosubCatBtn").val("修改分类");
                    $("#prosubCatBtn").attr("class", " btn btn-danger radius");
                    self.catId = id;
                } else {

                }
            },
            error: function (data) {
                console.log(data.msg);
            }
        });


    }

};

/*产品分类-添加、修改AJAX*/
ProCategory.prototype.proCategory_add_ajax = function () {
    var cateName = $.trim($("#procateName").val());
    if (!cateName) {
        alert("分类名称不能为空！");
        return;
    }
    var data = {
        "id": this.catId,
        "name": cateName
    };
    var self = this;
    $.ajax({
        type: 'POST',
        url: self.addProCateAPI,
        dataType: 'json',
        data: data,
        success: function (data) {
            if (data.state) {
                layer.msg('添加成功！', {icon: 1, time: 1000});
                self.getProCateList();
                self.add_cancel();
                self.catId = null;
            } else {
                alert(data.message);
            }
        },
        error: function (data) {
            console.log(data.msg);
            self.add_cancel();
        }
    });
};

/*产品分类-取消添加*/
ProCategory.prototype.add_cancel = function () {
    cancelSubmit("procateName", "prosubCatBtn");
};

/*产品分类-删除*/
ProCategory.prototype.delete = function (id) {
    var self = this;
    layer.confirm('确认要删除吗？', function () {
        $.ajax({
            type: 'POST',
            url: self.delProCateUrl,
            dataType: 'json',
            data: {"id": id},
            success: function (data) {
                if (data.state) {
                    // proCategory.getProCateList();
                    self.getProCateList();
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

/*产品分类-自动获取分类列表*/
ProCategory.prototype.getProCateList = function () {
    var self = this;
    $.ajax({
        type: 'POST',
        url: self.getProCateListUrl,
        dataType: 'json',
        success: function (data) {
            addCateList(data);
        },
        error: function (data) {
            console.log(data.msg);
        }
    });

    function addCateList(data) {
        var htmlStr = "",
            num = 0;
        for (var i = 0, len = data.rs.length; i < len; i++) {
            num++;
            htmlStr += '<tr class="text-c"><td>' + num + '</td>' +
                '<td>' + data.rs[i].id + '</td><td>' + data.rs[i].name + '</td><td>' + data.rs[i].createtime + '</td><td class="td-manage"><a onclick="proCategory.proCategory_add(' + data.rs[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a style="text-decoration:none" class="ml-5" onClick="proCategory.delete(' + data.rs[i].id + ')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td></tr>'
        }
        $("#tbody").html(htmlStr);
    }
};

var proCategory = new ProCategory();
proCategory.init();
