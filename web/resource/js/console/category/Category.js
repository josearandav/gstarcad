/**
 * 一、栏目分类
 */
function Category() {
    this.data = null;
    this.catId = null;
    this.addCateAPI = "/api/menuType/save";
    this.delCateUrl = "/api/menuType/del";
    this.getCateListUrl = "/api/menuType/list";
    this.getCateById = "/api/menuType/getMenuType";
}

Category.prototype.init = function () {
    this.getCateList();
};


/*分类-添加*/
Category.prototype.category_add = function (id) {
    var self = this;
    if (id) {
        $.ajax({
            type: 'POST',
            url: this.getCateById,
            dataType: 'json',
            data: {
                "id": id
            },
            success: function (data) {
                if (data.state) {
                    $("#cateName").val(data.rs.name);
                    $("#subCatBtn").val("修改分类");
                    $("#subCatBtn").attr("class", " btn btn-danger radius");
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


/*分类-添加、修改AJAX*/
Category.prototype.category_add_ajax = function () {
    var cateName = $.trim($("#cateName").val());
    if (!cateName) {
        alert("分类名称不能为空！");
        return;
    }
    var data = {
        "id": category.catId,
        "name": cateName

    };
    $.ajax({
        type: 'POST',
        url: this.addCateAPI,
        dataType: 'json',
        data: data,
        success: function (data) {
            if (data.state) {
                layer.msg('添加成功！', {icon: 1, time: 1000});
                category.getCateList();
                category.infoCateadd_cancel();
                category.catId = null;
            } else {
                alert(data.message);
            }
        },
        error: function (data) {
            console.log(data.message);
        }
    });
};

/*分类-取消添加*/
Category.prototype.infoCateadd_cancel = function () {
    var listInput = ["cateName"];
    cancelSubmit(listInput, "subCatBtn")
};

/*分类-删除*/
Category.prototype.category_del = function (id) {
    layer.confirm('确认要删除吗？', function () {
        $.ajax({
            type: 'POST',
            url: category.delCateUrl,
            dataType: 'json',
            data: {"id": id},
            success: function (data) {
                if (data.state) {
                    category.getCateList();
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

/*分类-自动获取分类列表*/
Category.prototype.getCateList = function getCateList() {
    $.ajax({
        type: 'POST',
        url: this.getCateListUrl,
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
            num;
        for (var i = 0, len = data.rs.length; i < len; i++) {
            num = i + 1;
            htmlStr += '<tr class="text-c"><td>' + num + '</td>' +
                '<td>' + data.rs[i].id + '</td><td>' + data.rs[i].name + '</td><td class="td-manage"><a onclick="category.category_add(' + data.rs[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a style="text-decoration:none" class="ml-5" onClick="category.category_del(' + data.rs[i].id + ')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td></tr>'
        }
        $("#tbody").html(htmlStr);
    }
};


var category = new Category();
category.init();
