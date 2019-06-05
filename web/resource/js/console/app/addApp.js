/**
 * Created by Administrator on 2017/9/13 0013.
 */

var appIconURL = "",
    appsnipImgURL = "",
    appSaveURL = "/api/application/save",
    getAppCateListUrl = "/api/application/categorylist";
getApp = "/api/application/getApplication";
// 加载详细数据；
loadDownloadDetail(ApplicationId);

function app_submit_cancel() {
    ApplicationId = undefined;
    index.loadContent('app/appManage');
}

function loadDownloadDetail(id) {
    autoFillAppCateData("appCategory");// 获取并添加分类数据；

    if (id) {
        download_queryID_ajax(id);
    } else {
    }
}

/*应用-根据ID查询应用数据*/
function download_queryID_ajax(id) {

    $.ajax({
        type: 'POST',
        url: getApp,
        dataType: 'json',
        data: {
            "id": id
        },
        success: function (res) {
            showList(res);
        },
        error: function (res) {
            console.log(res.msg);
        }
    });
    function showList(res) {

        var id = res.rs.applicationCategory.id;
        fillAppCateNameById(id, "appCategory");
        $(".js-ctorIcon").text(res.rs.thumbImg);
        $("#SnipImgsInput").val(res.rs.snipImg);
        var imgsArr = res.rs.snipImg.split("#");
        var imgsHtml = '';
        imgsArr.forEach(function (item) {
            imgsHtml += '<img src="' + item + '" alt="">'
        });

        $(".js-downloadIcon").html(imgsHtml);

        var iconHtml = '<img src="' + res.rs.thumbImg + '" alt="">';
        $(".js-appIcon").html(iconHtml);

        appIconURL = res.rs.thumbImg;
        $("#fileUrl").val(res.rs.fileUrl);
        $("#fileUrl64").val(res.rs.fileUrl64);
        $("#appFeatures").text(res.rs.feature);
        appsnipImgURL = res.rs.snipImg;
        $("#appSite").val(res.rs.websiteUrl);
        $("#appInfo").val(res.rs.content);
        $("#appDesc").val(res.rs.descp);
        $("#appTitle").val(res.rs.title);
        $("#seoTitle").val(res.rs.seoTitle);
        $("#seoKeywords").val(res.rs.seoKeywords);
        $("#seoDescription").val(res.rs.seoDescription);
    }
}

/*根据分类ID获取分类名称*/
function fillAppCateNameById(categoryId, DOMid) {

    $.ajax({
        type: 'POST',
        url: getAppCateListUrl,
        dataType: 'json',
        success: function (data) {
            showCateList(categoryId, DOMid, data);
        },
        error: function (data) {
            console.log(data.msg);
        }
    });
    function showCateList(categoryId, DOMid, data) {
        for (var i = 0, len = data.rs.length; i < len; i++) {
            try {
                if (categoryId == data.rs[i].id) {
                    document.getElementById(DOMid).value = data.rs[i].name;
                }
            } catch (e) {
                throw e;
            }

        }
    }
}

/*应用-添加/编辑-AJAX*/
function app_submit_ajax() {
    var data = {
        "id": ApplicationId,
        "categoryId": parseInt($("#appCategory").find("option:selected").attr("data-id")),
        "title": $("#appTitle").val(),
        "descp": $("#appDesc").val(),
        "content": $("#appInfo").val(),
        "thumbImg": appIconURL,
        "fileUrl": $("#fileUrl").val(),
        "fileUrl64": $("#fileUrl64").val(),
        "feature": $("#appFeatures").val(),
        "snipImg": $("#SnipImgsInput").val(),
        "websiteUrl": $("#appSite").val(),
        "seoTitle": $("#seoTitle").val(),
        "seoKeywords": $("#seoKeywords").val(),
        "seoDescription": $("#seoDescription").val()
    };
    $.ajax({
        type: 'POST',
        url: appSaveURL,
        dataType: 'json',
        data: data,
        success: function (res) {
            if (res.state) {
                layer.msg('提交成功!', {icon: 1, time: 1000});
                appIconURL = "";
                ApplicationId = undefined;
                index.loadContent("app/appManage");
            } else {
                alert(res.message);
            }
        },
        error: function (res) {
            console.log(res);
        }

    });

}

/*应用-上传icon图片-大小1MB-类型png,jpg,jpeg*/
function uploadIconImg(target) {
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
            // if (width === allowWidth && height === allowHeight) {
                fileUpload();
            // } else {
            //     alert("图片尺寸不符合要求！");
            //     $("#appIcon").val("");
            // }
        };
        image.src = imagePath;
    }
    function fileUpload() {
        $.ajaxFileUpload({
            url: '/api/upload', //用于文件上传的服务器端请求地址
            secureuri: false, //是否需要安全协议，一般设置为false
            fileElementId: 'appIcon', //文件上传域的ID
            dataType: 'json', //返回值类型 一般设置为json
            success: function (data) {
                alert("图片上传成功!");
//                返回图片的UTL地址；
                data = JSON.parse(data.responseText);
                appIconURL = data.rs.imgUrl;
                var imgsHtml = '<img src="' + appIconURL + '" alt="">';
                $(".js-appIcon").html(imgsHtml);

            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                data = JSON.parse(data.responseText);
                appIconURL = data.rs.imgUrl;
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
/* 应用上传程序截图 */
function uploadSnipImg(target) {
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
            fileElementId: 'snipImg', //文件上传域的ID
            dataType: 'json', //返回值类型 一般设置为json
            success: function (data) {
                alert("图片上传成功!");
//                返回图片的UTL地址；
                data = JSON.parse(data.responseText);
                appsnipImgURL = appsnipImgURL + "#" + data.rs.imgUrl;
                showUploadImg("SnipImgsInput", "js-downloadIcon", appsnipImgURL);
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                data = JSON.parse(data.responseText);
                appsnipImgURL = appsnipImgURL + "#" + data.rs.imgUrl;
                showUploadImg("SnipImgsInput", "js-downloadIcon", appsnipImgURL);
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
function deleteImg() {
    $(".js-downloadIcon img").hover(function () {
    }, function () {
    })
}
function showUploadImg(textId, wrapClass, imgs) {
    $("#" + textId).val(imgs);
    var imgsArr = imgs.split("#");
    var imgsHtml = '';
    imgsArr.forEach(function (item) {
        imgsHtml += '<img src="' + item + '" alt="">'
    });
    $("." + wrapClass).html(imgsHtml);
}