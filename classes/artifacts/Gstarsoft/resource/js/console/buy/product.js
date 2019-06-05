/**
 * 一、栏目分类
 */
var backgroundImg;
function Category() {
    this.data = null;
    this.catId = null;
    this.addCateAPI = "/api/ecommerce/save";
    this.delCateUrl = "/api/ecommerce/del";
    this.getCateListUrl = "/api/ecommerce/list";
    this.getCateById = "/api/ecommerce/getEcommerce";
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
            url: self.getCateById,
            dataType: 'json',
            data: {
                "id": id
            },
            success: function (data) {
                if (data.state) {
                    $("#cateName").val(data.rs.name);
                    $("#descp").val(data.rs.descp);
                    backgroundImg = data.rs.backgroundImg;
                    $("#subCatBtn").val("修改产品");
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
        "name": cateName,
        "descp": $("#descp").val(),
        "backgroundImg": backgroundImg
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
    $("#descp").val("");
    $("#backgroundImg").val("");
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
                '<td>' + data.rs[i].id + '</td><td>' + data.rs[i].name + '</td><td>' + data.rs[i].descp + '</td><td class="td-manage"><a onclick="category.category_add(' + data.rs[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a style="text-decoration:none" class="ml-5" onClick="category.category_del(' + data.rs[i].id + ')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td></tr>'
        }
        $("#tbody").html(htmlStr);
    }
};
/* 应用上传程序截图 */
function uploadImg(target, id) {
    /*图片类型和大小的限制*/
    var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
    var fileSize = 0;
    var category = $("#getCate").val();
    var allowWidth = 89;
    var allowHeight = 87;
    var imagePath;
    if (isIE && !target.files) {
        var filePath = target.value;
        imagePath = target.value;
        var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
        var file = fileSystem.GetFile(filePath);
        fileSize = file.Size;
    } else {
        fileSize = target.files[0].size;
        imagePath = getObjectURL(target.files[0]);
    }
    /*判断文件类型*/
    var name = target.value;
    var fileName = name.substring(name.lastIndexOf(".") + 1).toLowerCase();
    if (fileName !== "jpg" && fileName !== "jpeg" && fileName !== "png" && fileName !== "gif") {
        alert("请选择图片格式文件上传(jpg,jpeg，png,gif)！");
        target.value = "";
        return
    }
    /*判断文件大小*/
    var size = fileSize / 1024;
    if (size > 1024) {
        alert("附件不能大于1MB");
        target.value = "";
    } else {
        /*验证图片尺寸*/
        var image = new Image();
        image.onload = function () {
            var width = image.width;
            var height = image.height;
            //TODO:暂时未对截图尺寸进行限制；
            // if (width === allowWidth && height === allowHeight) {
            //     fileUpload();
            // } else {
            //     alert("图片尺寸不符合要求！");
            //     $("#appIcon").val("");
            // }

            fileUpload();

        };
        image.src = imagePath;
    }
    function fileUpload() {
        $.ajaxFileUpload({
            url: '/api/upload', //用于文件上传的服务器端请求地址
            secureuri: false, //是否需要安全协议，一般设置为false
            fileElementId: id, //文件上传域的ID
            dataType: 'json', //返回值类型 一般设置为json
            success: function (data) {
                alert("图片上传成功!");
//                返回图片的UTL地址；
                data = JSON.parse(data.responseText);
                backgroundImg = data.rs.imgUrl;
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                data = JSON.parse(data.responseText);
                backgroundImg = data.rs.imgUrl;
            }
        })
    }

    //获取图片本地地址；
    function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }

}

var category = new Category();
category.init();
