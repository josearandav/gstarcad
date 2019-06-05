/**
 * Created by Administrator on 2018/2/2 0002.
 */
/*公共变量*/
var iframeWrap = document.getElementById("iframe"),
    UMeditorWrap = document.getElementById("UMeditor"),
    preViewWrap = document.getElementById("preViewWrap"),
    oIframeTitle = document.getElementById('min_title_list'),
    SEOCateId,
    DownloadId,
    SupportInfoId,
    ApplicationId,
    EnquiryFormId,
    PartnerId,
    buySoftIcon,
    buySoftId,
    buyPriceId,
    buyFeatureId,
    htmlStr = "",
    myEeditor,
    htmlTitle = "",
    thumbImgURL = "",//首页新闻缩略图地址；
    thumbImg2URL = "",//新闻列表页缩略图地址；
    supportThumbImgURL = "",//支持页缩略图地址；
    logoIconImgURL = "",//经销商LOGOurl；
    getCateListUrl = "/api/menuType/list",
    getAppCateListUrl = "/api/application/categorylist",
    getInfoCateListUrl = "/api/news/categorylist";

/*自动添加栏目分类数据*/
function autoFillCateData(id, noAll) {
    $.ajax({
        type: 'POST',
        url: getCateListUrl,
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

/*自动添加资讯分类数据*/
function autoFillInfoCateData(id, noAll) {
    $.ajax({
        type: 'POST',
        url: getInfoCateListUrl,
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

/*自动添加应用分类数据*/
function autoFillAppCateData(id, noAll) {
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
        var htmlStr = '<option data-id="">Select</option>';
        if (noALl) {
            htmlStr = "";
        }
        for (var i = 0, len = data.rs.length; i < len; i++) {
            htmlStr += '<option data-id="' + data.rs[i].id + '">' + data.rs[i].name + '</option>'
        }
        document.getElementById(id).innerHTML = htmlStr;
    }
}

/*根据分类ID获取分类名称*/
function fillCateNameById(categoryId, DOMid) {

    $.ajax({
        type: 'POST',
        url: getCateListUrl,
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

/*公共-取消修改的功能*/
function cancelSubmit(idList, addBtnID) {
    var doc = document;
    var addBtn = doc.getElementById(addBtnID);
    //清空所以输入项；
    if (Object.prototype.toString.call(idList) === "[object Array]") {
        for (var i = 0, len = idList.length; i < len; i++) {
            doc.getElementById(idList[i]).value = "";//名称
        }
    } else if (typeof idList === "string") {
        doc.getElementById(idList).value = "";//名称
    } else if (arguments) {
        alert("请输入ID字符串或者数组！")
    }

    //改变添加按钮；
    addBtn.value = "添加";
    addBtn.className = "js-submit btn btn-primary radius";
}

/** 公共- 分页功能**/
function page(getListAPI, categoryId, keywords) {
    var pageNumber = 1,
        pageSize = 20,
        totalPage = 1,
        callback = getInfos;

    sendPageAjax();
    goToInputPage();
    goToPrePage();
    goToNextPage();

    function sendPageAjax() {
        if (pageNumber > totalPage) {
            pageNumber = totalPage
        }
        if (pageNumber < 0) {
            pageNumber = 0
        }
        categoryId = $("#catFilter").find("option:selected").attr("data-id");

        //信息（新闻、案例）页面；
        var data = {
            "pageNumber": pageNumber,
            "pageSize": pageSize,
            "keywords": keywords,
            "categoryId": categoryId
        };
        //下载页面；
        if (getListAPI.indexOf("down/list") > -1) {
            categoryId = $("#dSearchCategory").find("option:selected").attr("data-id");

            data = {
                "pageNumber": pageNumber,
                "pageSize": pageSize,
                "category": categoryId,
                "keywords": keywords
            };
            callback = showDownloadList;
        }

        //支持页面；
        if (getListAPI.indexOf("support/list") > -1) {
            categoryId = $("#dSearchSupportCat").find("option:selected").attr("data-id");

            data = {
                "pageNumber": pageNumber,
                "pageSize": pageSize,
                "keywords": keywords,
                "columnType": categoryId
            };
            callback = support.getSupportList;
        }

        $.ajax({
            type: 'POST',
            url: getListAPI,
            dataType: 'json',
            data: data,
            success: function (data) {
                helperTotalRow(data.totalRow);
                helperPageShow(data.pageNo, data.totalPage);
                totalPage = data.totalPage;
                clickToThisPage();
                callback(data);
            },
            error: function (data) {
                console.log(data.msg);
            }
        });
    }

    function helperTotalRow(totalRow) {
        $(".js-page .total").text(totalRow)//总条数；
    }

    function helperPageShow(pageNo, totalPage) {
        var strA = '';
        if (pageNo == 1) {
            $(".js-page .pre").hide();//隐藏上一页；
        } else {
            $(".js-page .pre").show();//隐藏上一页；
        }
        if (pageNo == totalPage) {
            $(".js-page .next").hide();//隐藏下一页；
        } else {
            $(".js-page .next").show();//隐藏下一页；
        }
        if (totalPage <= 10) {
            //总页数小于等于10时；
            for (var i = 1; i <= totalPage; i++) {
                if (pageNo == i) {
                    strA += '<a href="#" class="pageNo">' + i + '</a>';
                } else {
                    strA += '<a href="#">' + i + '</a>';
                }

            }
        } else {
            //总页数大于10时；
            for (var i = 1; i < totalPage; i++) {

                if (pageNo == i) {
                    strA += '<a href="#" class="pageNo">' + i + '</a>';
                } else {
                    if (i < 4) {
                        strA += '<a href="#">' + i + '</a>';
                    } else if (i > 3 && i < totalPage) {
                        strA += '<em>...</em>';
                    }
                }
            }
            strA += '<a href="#">' + totalPage + '</a>';


        }

        $(".js-page label").html(strA)//总条数；
    }

    //根据点击，跳转到指定页面；
    function clickToThisPage() {
        $(".js-page label a").click(function () {
            pageNumber = $(this).text();
            sendPageAjax();
        });
    }

    //根据输入框，跳转指定页数；go；
    function goToInputPage() {
        $(".js-page .go").click(function () {
            helper();
        });
    }

    function helper() {
        pageNumber = $.trim($(".js-page input").val());
        $(".js-page input").val("");
        var reg = /^[0-9]+$/;//输入验证，只能输入正整数；
        if (reg.test(pageNumber)) {
            sendPageAjax();
        } else {
            alert("请输入页码数！")
        }
    }

    //键盘回车跳转到指定页面；
    $(".js-page input").focus(function () {
        document.onkeydown = function (event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if (e && e.keyCode == 13) { // enter 键
                //要做的事情
                helper();
            }
        };
    });


    //上一页；
    function goToPrePage() {
        $(".js-page .pre").on("click", function () {
            pageNumber--;
            if (pageNumber == 0) {
                return
            }
            sendPageAjax()
        })
    }

    //下一页；
    function goToNextPage() {
        $(".js-page .next").on("click", function () {
            pageNumber++;
            if (pageNumber == totalPage) {
                pageNumber = totalPage
            }
            sendPageAjax()
        })
    }


}


/**公共-上传文件-类型png,jpg,jpeg.doc.pdf.pm4**/
function uploadImg(target) {
    /*图片类型和大小的限制*/
    var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
    var fileSize = 0;
    var supportCat = $("#supportCate").find("option:selected").attr("data-id");//支持栏目分类；
    var id = target.id;

    var allowWidth;
    var allowHeight;
    var imagePath;
    //浏览器兼容性处理；
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
    if (id != "uploadSupportFile") {
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
            return
        }
    }

    //根据栏目不同，对图片的尺寸进行约束；
    if (id == "uploadfile") {
        //上传新闻和案例的首页缩略图，验证ID；
        allowSize(299, 299);

        /*验证图片尺寸*/
        checkImgSize("uploadfile");

    } else if (id == "uploadNewsFile") {
        //上传新闻和案例的首页缩略图，验证ID；
        //新闻
        allowSize(290, 150);

        /*验证图片尺寸*/
        checkImgSize("uploadNewsFile");

    } else if (id == "supportuploadfile") {
        //上传支持页面缩略图；
        if (supportCat == 1 || supportCat == 2 || supportCat == 3) {
            //1 Installation & Activation；2 User Guide ; 3  Video Library
            allowSize(159, 160);
        } else if (supportCat == 4) {
            //Tips & Tricks
            allowSize(290, 150);
        }
        /*验证图片尺寸*/
        checkImgSize("supportuploadfile");
    } else if (id == "uploadSupportFile") {
        //上传文件；

        var fileType = helperJudgeFileType(id);//自动获取文件类型；
        fileType = File.type(fileType);//根据文件类型，选择对应的ID；
        if (fileType) {
            fileUpload(id, fileType);
        }
    }
    //图片尺寸的限制；
    function allowSize(width, height) {
        allowWidth = width;
        allowHeight = height;
    }

    /*验证图片尺寸*/
    function checkImgSize(id) {
        var image = new Image();
        image.onload = function () {
            var width = image.width;
            var height = image.height;
            if (width === allowWidth && height === allowHeight) {
                fileUpload(target.id, File.type("img"));
            } else {
                alert("图片尺寸不符合要求！");
                document.getElementById(id).value = "";
            }
        };
        image.src = imagePath;
    }

    //执行上传的ajax
    function fileUpload(id, fileType) {
        var uploadfileUrl;
        $.ajaxFileUpload({
            url: '/api/upload', //用于文件上传的服务器端请求地址
            secureuri: false, //是否需要安全协议，一般设置为false
            fileElementId: id, //文件上传域的ID,filename不能改变必须是uploadfile；
            dataType: 'json', //返回值类型 一般设置为json
            data: {
                "type": fileType
            },
            success: function (data) {
                alert("图片上传成功!");
//                返回图片的UTL地址；
                data = JSON.parse(data.responseText);
                uploadfileUrl = data.rs.imgUrl;
                if (id === "uploadfile") {
                    $('.js-uploadfile').hide();
                    thumbImgURL = uploadfileUrl;
                } else if (id === "uploadNewsFile") {
                    thumbImg2URL = uploadfileUrl;
                    $('.js-uploadNewsFileName').hide();
                } else if (id === "supportuploadfile") {
                    $('.js-supportuploadfile').hide();
                    supportThumbImgURL = uploadfileUrl;
                } else if (id === "uploadSupportFile") {
                    var file = new File();
                    file.setFileUrl(uploadfileUrl);
                    $('.js-uploadSupportFile').hide();
                }
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                data = JSON.parse(data.responseText);
                uploadfileUrl = data.rs.imgUrl;
                if (id === "uploadfile") {
                    $('.js-uploadfile').hide();
                    thumbImgURL = uploadfileUrl;
                } else if (id === "uploadNewsFile") {
                    $('.js-uploadNewsFileName').hide();
                    thumbImg2URL = uploadfileUrl;
                } else if (id === "supportuploadfile") {
                    $('.js-supportuploadfile').hide();
                    supportThumbImgURL = uploadfileUrl;
                } else if (id === "uploadSupportFile") {
                    var file = new File();
                    file.setFileUrl(uploadfileUrl);
                    $('.js-uploadSupportFile').hide();
                }
            }
        });
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

    //判断文件类型；
    function helperJudgeFileType(id) {
        var obj = document.getElementById(id);
        if (obj.value == '' || obj == null) {
            alert('请选择要上传的文件');
            return false;
        }

        var fileType = obj.value.substring(obj.value.lastIndexOf(".")).toLowerCase();//（把路径中的所有字母全部转换为小写）

        if (File.allowTypes.indexOf(fileType + "|") == -1) {
            ErrMsg = "该文件类型不允许上传。请上传 " + File.allowTypes + " 类型的文件，当前文件类型为" + fileType;
            alert(ErrMsg);
            $("#uploadSupportFile").val("");
            return false;
        } else {
            return fileType;
        }

    }
}

/*显示信息列表信息*/
function getInfos(res) {
    var htmlStr = "";
    for (var i = 0, len = res.data.length; i < len; i++) {
        var releaseStatus = res.data[i].releaseStatus === 1 ? "已发布" : "草稿";
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
        var releaseTime = res.data[i].releaseTime.substring(0, 10);
        var number = i + 1;

        htmlStr += '<tr class="text-c"><td><input type="checkbox" value="" name=""></td><td>' + number + '</td><td>' + res.data[i].id + '</td><td >' + res.data[i].title + '</td><td>' + res.data[i].newsCategory.name + '</td><td>' + releaseTime + '</td><td>' + adminName + '</td><td class="td-status"><span class="label label-success radius">' + releaseStatus + '</span></td><td class="f-14 td-manage"><a data-id="infoFlag" onclick="info_edit( this,' + res.data[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a data-id="infoFlag" onclick="info_del( this,' + res.data[i].id + ')" title="删除" href="javascript:;" class="delAdmin ml-5" style="text-decoration:none"><i  class="Hui-iconfont">&#xe6e2;</i></a></td></tr>';

    }
    document.getElementById("infoList_wrap").innerHTML = htmlStr;
}

//重新加载页面；
function reloadPage(pageName) {
    window.location.reload();
    //通过本地缓存实现页面加载；
    sessionStorage.setItem("pageName", pageName);
}

//加载资讯页面；
function loadInfoPage() {
    showInfoModule();
}

//url为穿过来的链接，id为参数名
function GetParam(url, id) {
    // url：  http://www.189dg.com/ajax/sms_query.ashx?action=smsdetail&sid=22&stime=2014-06-27&etime=2014-06-27
    url = url + "";
    var regstr = "/(\\?|\\&)" + id + "=([^\\&]+)/";
    var reg = eval(regstr);//eval可以将 regstr字符串转换为 正则表达式
    var result = url.match(reg);//匹配的结果是：result[0]=?sid=22 result[1]=sid result[2]=22。所以下面我们返回result[2]

    if (result && result[2]) {
        return result[2];
    }
}

//加载支持页面；
function loadSupportPage() {
    showSupportModule();
}

// 显示信息模块；
function showInfoModule() {
    $(".js-support-module").hide();
    $(".js-info-module").show();
}

// 显示信息模块；
function showSupportModule() {
    $(".js-info-module").hide();
    $(".js-support-module").show();
}

//添加下拉列表；
function helperAddSelectList(API, id) {
    $.ajax({
        type: 'POST',
        url: API,
        dataType: 'json',
        success: function (data) {
            var htmlStr = "";

            for (var i = 0, len = data.rs.length; i < len; i++) {
                htmlStr += '<option data-id="' + data.rs[i].id + '">' + data.rs[i].name + '</option>'
            }
            document.getElementById(id).innerHTML = htmlStr;
        },
        error: function (data) {
            console.log(data.msg);
        }
    });
}