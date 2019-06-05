/**
 * 一、栏目分类
 */
function Category() {
    this.data = null;
    this.catId = null;
    this.thumbImg = "";
    this.addCateAPI = "/api/price/save";
    this.delCateUrl = "/api/price/del";
    this.getCateListUrl = "/api/price/list";
    this.getCateById = "/api/price/getPrice";
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

function addPrice(id) {
    buyPriceId = id;
    index.loadContent("buy/addPrice");
}


/*分类-自动获取分类列表*/
Category.prototype.getCateList = function getCateList() {
    var self = this;
    $.ajax({
        type: 'POST',
        url: "/api/price/list",
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
                '<td>' + data.rs[i].id + '</td><td>' + data.rs[i].ecommerce.name + '</td><td>' + data.rs[i].name + '</td><td>' + data.rs[i].sort + '</td><td>' + data.rs[i].price + '</td><td>' + data.rs[i].formerprice + '</td><td>' + data.rs[i].upgradePrice + '</td><td>' + data.rs[i].upgradeFormerprice + '</td><td>' + data.rs[i].isSale + '</td><td>' + data.rs[i].thumbImg + '</td><td class="td-manage"><a onclick="addPrice(' + data.rs[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a style="text-decoration:none" class="ml-5" onClick="category.category_del(' + data.rs[i].id + ')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td></tr>'
        }
        $("#tbody").html(htmlStr);
    }
};
var category = new Category();
category.init();
