/**
 * 一、栏目分类
 */
function Category() {
    this.data = null;
    this.catId = null;
    this.thumbImg = "";
    this.addCateAPI = "/api/feature/save";
    this.delCateUrl = "/api/feature/del";
    this.getCateListUrl = "/api/feature/list";
    this.getCateById = "/api/feature/getFeature";
}

Category.prototype.init = function () {
    this.getCateList();
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

/*分类-添加*/
feature_add = function (id) {
    buyFeatureId = id;
    index.loadContent("buy/addFeature");
};


/*分类-自动获取分类列表*/
Category.prototype.getCateList = function getCateList() {
    $.ajax({
        type: 'POST',
        url: "/api/feature/list",
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
                '<td>' + data.rs[i].id + '</td><td>' + data.rs[i].ecPrice.ecommerce.name+ '</td><td>' + data.rs[i].ecPrice.name + '</td><td>' + data.rs[i].sort + '</td><td>' + data.rs[i].feature + '</td><td><a onclick="feature_add(' + data.rs[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a style="text-decoration:none" class="ml-5" onClick="category.category_del(' + data.rs[i].id + ')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td></tr>'
        }
        $("#tbody").html(htmlStr);
    }
};
var category = new Category();
category.init();
