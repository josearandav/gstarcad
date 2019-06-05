/**
 * Created by Administrator on 2017/9/13 0013.
 */
/**
 * 编辑信息
 */
var getInfoListUrl = "/api/news/list";
var saveInfoUrl = "/api/news/save";
var delInfoUrl = "/api/news/del";
var info_edit_id = null;//修改信息的ID
var catId;

btnReleaseInfo();//自动添加管理数据；
function btnReleaseInfo(infoView) {
    if (infoView != 1) {
        //添加分类栏目；
        autoFillCateData("getCate");
        // 添加新闻分类；
        autoFillInfoCateData("getInfoCate");//获取新闻分类数据；
    }
    var url = window.location.href;
    var id = GetParam(url, "id");
    var tag = GetParam(url, "tag");

    if(id){
        info_getDetail_ajax(id);
    }

}

/* 信息-添加*/
function info_add(target) {
    hideAllUploadItems();

    support.flag = $("#dSearchSupportCat").val();
    //新闻、案例
    $("#infoTitle").val("");
    $("#getCate").val("");
    $("#getInfoCate").val("");
    $("#getCaseCate").val("");
    $("#newsReleaseTime").val("");
    $("#tags").val("");
    $("#seoShow").val("");
    $("#showIndex").val("");
    $("#caseShowIndex").val("");
    $("#seoTitle").val("");
    $("#seoKeyword").val("");
    $("#seoDescription").val("");
    $("#uploadfile").val("");
    $("#uploadNewsFile").val("");
    thumbImgURL = "";
    thumbImg2URL = "";
    //支持
    $("#supportTitle").val("");
    $("#supportSEOShow").val("");
    $("#supportReleaseTime").val("");
    $("#supportTags").val("");
    $("#supportseoTitle").val("");
    $("#supportseoKeyword").val("");
    $("#supportseoDescription").val("");
    supportThumbImgURL = "";
    file.resetFileUrl();
    $("#supportDescribe").val("");

    myEeditor.html("");
//        获取并添加分类数据；
    $.ajax({
        type: 'POST',
        url: getCateListUrl,
        dataType: 'json',
        success: function (data) {

        },
        error: function (data) {
            console.log(data.msg);
        }
    });


}

/* 信息-取消 发布成功后加载 “信息管理” 页面*/
function info_cancel() {
    index.loadContent("information/infoManage");
}

/* 信息-预览并发布*/
function info_view_submit() {
    var title = $("#infoTitle").val(),
        releaseTime = $.trim($("#newsReleaseTime").val());
    $("#UMeditor-cont").html('<div class="top"><h1>' + title + '</h1><span>发布日期：  ' + releaseTime + '</span></div>' + myEeditor.html());
    $('#UMeditor').hide();
    $("#preViewWrap").show();
}

/* 信息-发布/保存草稿-action*/
function info_submit(releaseStatus) {
    info_submit_ajax(releaseStatus);
}

/* 返回编辑页面 */
function backToDetail() {
    $("#preViewWrap").hide();
    $('#UMeditor').show();
}

/*信息-发布/保存草稿-ajax*/
function info_submit_ajax(releaseStatus) {
//        如果releaseStatus = 1，则发布;如果releaseStatus = 0，则保存草稿；
    var title = $("#infoTitle").val();
    var newsCategoryID = $("#getInfoCate").find("option:selected").attr("data-id");
    //此参数必须未number;
    if (!newsCategoryID) {
        newsCategoryID = 999
    }
    var showIndexID = $("#showIndex").find("option:selected").attr("data-id");
    var seoShow = $.trim($("#seoShow").val());
    if (seoShow === "自动抓取") {
        seoShow = 1
    } else if (seoShow === "手动设置") {
        seoShow = 0
    }
    var data = {
        "id": info_edit_id,
        "title": title,
        "newsCategoryId": newsCategoryID,
        "releaseTime": $.trim($("#newsReleaseTime").val()),
        "tags": $.trim($("#tags").val()),
        "seoShow": seoShow,
        "indexShow": showIndexID,
        "seoTitle": $("#seoTitle").val(),
        "seoKeywords": $("#seoKeyword").val(),
        "seoDescription": $("#seoDescription").val(),
        "thumbImg": thumbImgURL,
        "thumbImg2": thumbImg2URL,
        "content": myEeditor.html(),
        "digest": $("#abstract").val(),
        "releaseStatus": releaseStatus
    };
    console.log(data);
    var alertWords = releaseStatus == 1 ? "发布" : "保存草稿";
    if (title && $("#newsReleaseTime").val()) {
        $.ajax({
            type: 'POST',
            url: saveInfoUrl,
            dataType: 'json',
            data: data,
            success: function (data) {
                if (data.state) {
                    layer.msg(alertWords + '成功!', {icon: 1, time: 1000});
                    btnReleaseInfo();
                    info_cancel();
                } else {
                    alert(data.message)
                }
            },
            error: function () {
                alert(alertWords + "失败！");
            }
        });
    } else {
        alert("请填写完整信息！");
    }


}


function hideAllUploadItems() {
    //清空图片上传的记录；
    $('.js-uploadfile').text("");
    $('.js-uploadNewsFileName').text("");
    $('.js-supportuploadfile').text("");
    $('.js-uploadSupportFile').text("");
    //隐藏图片上传的记录；
    $('.js-uploadfile').show();
    $('.js-uploadNewsFileName').show();
    $('.js-supportuploadfile').show();
    $('.js-uploadSupportFile').show();

    /* 清空上传组件的记录*/
    $('#uploadfile').val("");
    $('#uploadNewsFile').val("");
    $('#supportuploadfile').val("");
    $('#uploadSupportFile').val("");

}

/*信息-根据ID查询消息*/
function info_getDetail_ajax(id) {
    // 获取并添加分类数据；
    var newsCategory = '';//新闻分类名称；
    var cateName = $("#getCate").find("option:selected").attr("data-cateName");//栏目；
    $.ajax({
        type: 'POST',
        url: "/api/news/getNews",
        dataType: 'json',
        data: {
            "id": id
        },
        success: function (data) {
            var autoCatch = data.rs.seoShow;
            if (autoCatch == 1) {
                autoCatch = "自动抓取"
            } else if (autoCatch == 0) {
                autoCatch = "手动设置"
            }
            if (data.state) {
                var releaseTime = data.rs.releaseTime.substring(0, 10);
                $("#infoTitle").val(data.rs.title);

                //如果已经有所属分类；
                try {
                    if (data.rs.newsCategory.name) {
                        newsCategory = data.rs.newsCategory.name;
                    }
                    $("#getInfoCate").val(newsCategory);
                    $("#newsReleaseTime").val(releaseTime);
                    $("#tags").val(data.rs.tags);
                    var indexShow = data.rs.indexShow;
                    if (indexShow == 1) {
                        indexShow = "是"
                    } else {
                        indexShow = "否"
                    }
                    $("#seoShow").val(autoCatch);
                    $("#showIndex").val(indexShow);
                    $("#seoTitle").val(data.rs.seoTitle);
                    $("#seoKeyword").val(data.rs.seoKeywords);
                    $("#seoDescription").val(data.rs.seoDescription);
                    $(".js-uploadfile").text(data.rs.thumbImg);
                    $(".js-uploadNewsFileName").text(data.rs.thumbImg2);
                    thumbImgURL = data.rs.thumbImg;
                    thumbImg2URL = data.rs.thumbImg2;
                    myEeditor.html(data.rs.content);
                    $("#abstract").val(data.rs.digest);
                    releaseStatus = data.rs.releaseStatus;
                    info_edit_id = id;
                } catch (e) {
                    console.log(e);
                }
            }
        },
        error: function (data) {
            console.log(data.msg);
        }
    });
}

/*信息-删除*/
function info_del(target, id) {

    var btnName = $(target).attr("data-id");
    var ajaxAPI = delInfoUrl;
    if (btnName == "supportFlag") {
        //删除支持
        ajaxAPI = support.delSupportAPI;
    } else {
        //删除信息
        ajaxAPI = delInfoUrl
    }
    sendAjax(btnName);

    function sendAjax(btnName) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: ajaxAPI,
                dataType: 'json',
                data: {
                    "id": id
                },
                success: function (data) {
                    if (data.state) {
                        if (btnName == "infoFlag") {
                            page(getInfoListUrl);
                        } else {
                            page(support.getSupportListAPI);

                        }

                        layer.msg('已删除!', {icon: 1, time: 1000});
                    } else {
                        alert(data.message)
                    }
                },
                error: function (data) {
                    console.log(data.msg);
                }
            });
        });

    }

}
