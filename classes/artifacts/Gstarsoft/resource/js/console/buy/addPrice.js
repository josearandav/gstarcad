/**
 * Created by Administrator on 2017/9/13 0013.
 */

var appSaveURL = "/api/price/save",
    getPriceById = "/api/price/getPrice",
    getAppCateListUrl = "/api/ecommerce/list";

/*自动添加资讯分类数据*/

function autoFillBuyProductData(id, noAll) {
    $.ajax({
        type: 'POST',
        url: getAppCateListUrl,
        dataType: 'json',
        success: function (data) {
            showCateList(data, noAll);
        },
        error: function (data) {
            console.log(data.msg);
        }
    });
    function showCateList(data, noALl) {
        var htmlStr = '<option data-id="">All</option>';
        if (noALl) {
            htmlStr = "";
        }
        for (var i = 0, len = data.rs.length; i < len; i++) {
            htmlStr += '<option data-id="' + data.rs[i].id + '">' + data.rs[i].name + '</option>'
        }
        document.getElementById(id).innerHTML = htmlStr;
    }
}
autoFillBuyProductData("getProCate", "noAll");

$("#priceIcon").change(function () {
    uploadPriceImg(this,'priceIcon');
});

// 加载详细数据；
loadDownloadDetail(buyPriceId);
function loadDownloadDetail(id) {
    if (id) {
        download_queryID_ajax(id);
    } else {
        autoFillBuyProductData("getProCate", "noAll");
    }
}

/*应用-根据ID查询应用数据*/
function download_queryID_ajax(id) {

    $.ajax({
        type: 'POST',
        url: getPriceById,
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
        var id = res.rs.ecommerce.id;
        fillAppCateNameById(id, "getProCate");
        $("#cateName").val(res.rs.name);
        $(".js-downloadIcon").text(res.rs.thumbImg);
        priceIconImgURL = res.rs.thumbImg;
        $("#isSale").val(res.rs.isSale);
        $("#buyURL").val(res.rs.buyUrl);
        $("#updateURL").val(res.rs.upgradeUrl);
        $("#price").val(res.rs.price);
        $("#sort").val(res.rs.sort);
        $("#formerprice").val(res.rs.formerprice);
        $("#updatePrice").val(res.rs.upgradePrice);
        $("#nowupdatePrice").val(res.rs.upgradeFormerprice);
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
    var imgUrl = "";
    try{
        imgUrl = priceIconImgURL
    }catch(e){
    }
    var data = {
        "ecId": $("#getProCate").find("option:selected").attr("data-id"),
        "id": buyPriceId,
        "name": $("#cateName").val(),
        "thumbImg": imgUrl,
        "isSale": $("#isSale").val(),
        "sort": $("#sort").val(),
        "price": $("#price").val(),
        "buyUrl":$("#buyURL").val(),
        "upgradeUrl":$("#updateURL").val(),
        "formerprice": $("#formerprice").val(),
        "upgradePrice": $("#updatePrice").val(),
        "upgradeFormerprice": $("#nowupdatePrice").val()
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
                index.loadContent("buy/price");
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
function uploadPriceImg(target,id) {
    /*图片类型和大小的限制*/
    var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
    var fileSize = 0;
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
                priceIconImgURL = data.rs.imgUrl;
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                data = JSON.parse(data.responseText);
                priceIconImgURL = data.rs.imgUrl;
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
