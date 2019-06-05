/**
 * Created by Administrator on 2017/9/13 0013.
 */

var appSaveURL = "/api/reseller/save",
    getEnquiryByIdURL = "/api/reseller/getReseller";

$("#logoIcon").change(function () {
    uploadLogoImg(this,'logoIcon');
});

// 加载详细数据；
download_queryID_ajax(PartnerId);
/*应用-根据ID查询应用数据*/
function download_queryID_ajax(id) {
    if(id){
        $.ajax({
            type: 'POST',
            url: getEnquiryByIdURL,
            dataType: 'json',
            data: {
                "id": id
            },
            success: function (res) {
                showList(res.rs);
            },
            error: function (res) {
                console.log(res.msg);
            }
        });
    }

    function showList(res) {
        logoIconImgURL = res.thumbImg;
        $(".js-logoIcon").text(logoIconImgURL);
        $("#country").val(res.country);
        $("#company").val(res.company);
        $("#descp").val(res.descp);
        $("#address").val(res.address);
        $("#phone").val(res.phone);
        $("#fax").val(res.fax);
        $("#eMail").val(res.eMail);
        $("#webUrl").val(res.webUrl);
    }
}

// 取消
function partner_add_cancel(){
    PartnerId = undefined;
    index.loadContent('partner/partner');
}


/*应用-添加/编辑-AJAX*/
function app_submit_ajax() {
    var data = {
        "id": PartnerId,
        "country": $("#country").val(),
        "company": $("#company").val(),
        "descp": $("#desc").val(),
        "thumbImg": logoIconImgURL,
        "address": $("#address").val(),
        "phone": $("#phone").val(),
        "fax": $("#fax").val(),
        "eMail": $("#eMail").val(),
        "webUrl": $("#webUrl").val()
    };
    $.ajax({
        type: 'POST',
        url: appSaveURL,
        dataType: 'json',
        data: data,
        success: function (res) {
            if (res.state) {
                layer.msg('提交成功!', {icon: 1, time: 1000});
                logoIconImgURL = "";
                PartnerId = undefined;
                index.loadContent("partner/partner");
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
function uploadLogoImg(target,id) {
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
                logoIconImgURL = data.rs.imgUrl;
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                data = JSON.parse(data.responseText);
                logoIconImgURL = data.rs.imgUrl;
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
