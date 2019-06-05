/**
 * 六、支持管理
 */
var info_edit_id = null;
function Support() {
    this.updateVersionAPI = "/api/version/saveVersion";
    this.delVersionAPI = "/api/version/delVersion";
    this.getVersionListAPI = "/api/version/list";
    this.getVersionByIdAPI = "/api/version/getVersion";
    this.getSupportListAPI = "/api/support/list";
    this.delSupportAPI = "/api/support/del";
    this.addSupportAPI = "/api/support/save";
    this.getSupportByIdAPI = "/api/support/getSupport";
    this.getProCateListUrl = "/api/product/categorylist";
    this.flag = "全部";
}

//支持栏目分类；
var supportColumnTypeList = {
    rs: [
        {
            "id": 1,
            "name": "Installation & Activation"
        },
        {
            "id": 2,
            "name": "User Guide"
        },
        {
            "id": 3,
            "name": "Video Library"
        },
        {
            "id": 4,
            "name": "Tips & Tricks"
        }
    ]
};

//添加支持分类；
function addSupportCateList(id, noAll) {
    var htmlStr = '<option data-id="">全部</option>';
    if (noAll) {
        htmlStr = ''
    }

    for (var i = 0, len = supportColumnTypeList.rs.length; i < len; i++) {
        htmlStr += '<option data-id="' + supportColumnTypeList.rs[i].id + '">' + supportColumnTypeList.rs[i].name + '</option>'
    }
    $("#" + id).html(htmlStr);
}

Support.id = null;

/*显示支持管理页面*/
Support.prototype.init = function () {

    //添加支持分类；
    addSupportCateList("supportCate", "noAll");

    //添加产品分类；
    helperAddSelectList(this.getProCateListUrl, "getProCate");

    //添加版本列表；
    helperAddSelectList(this.getVersionListAPI, "getVersionCate");

    //
    // $("#dSearchSupportCat").val(support.flag)

    var url = window.location.href;
    var id = GetParam(url, "id");
    var tag = GetParam(url, "tag");

    this.getDetailById(id);
};

/*支持管理-根据ID查询分类*/
Support.version_add = function (id) {
    if (id) {
        $.ajax({
            type: 'POST',
            url: version.getVersionByIdAPI,
            dataType: 'json',
            data: {
                "id": id
            },
            success: function (data) {
                if (data.state) {
                    $("#js-versionName").val(data.rs.name);
                    $("#js-subVersionBtn").val("修改版本");
                    $("#js-subVersionBtn").attr("class", " btn btn-danger radius");
                    Version.id = id;
                } else {

                }
            },
            error: function (data) {
                console.log(data.msg);
            }
        });
    }
};

/*支持管理-保存*/
Support.submit = function () {
    var title = $("#supportTitle").val();
    var categoryID = $("#supportCate").find("option:selected").attr("data-id");//栏目；
    var proCategoryID = $("#getProCate").find("option:selected").attr("data-id");//产品分类；
    var versionID = $("#getVersionCate").find("option:selected").attr("data-id");//版本；
    var videoType = $("#videoType").val();//视频分类；
    var seoShow = $.trim($("#supportSEOShow").val());

    if (seoShow === "自动抓取") {
        seoShow = 0;
    } else if (seoShow === "手动设置") {
        seoShow = 1;
    }
    var url = window.location.href;
    var id = GetParam(url, "id");

    var data = {
        "id": id,
        "title": title,
        "columnType": categoryID,
        "productCategoryId": proCategoryID,
        "versionId": versionID,
        "releaseTime": $.trim($("#supportReleaseTime").val()),
        "tags": $.trim($("#supportTags").val()),
        "seoShow": seoShow,
        "seoTitle": $("#supportseoTitle").val(),
        "seoKeywords": $("#supportseoKeyword").val(),
        "seoDescription": $("#supportseoDescription").val(),
        "thumbImg": supportThumbImgURL,
        "fileUrl": file.getFileUrl(),
        "descp": $("#supportDescribe").val(),
        "videoType": videoType,
        "content": myEeditor.html()
    };

    $.ajax({
        type: 'POST',
        url: support.addSupportAPI,
        dataType: 'json',
        data: data,
        success: function (data) {
            if (data.state) {
                layer.msg('发布成功!', {icon: 1, time: 1000});
                index.loadContent("support/support");
                support_edit_id = undefined;
            } else {
                alert(data.message)
            }
        },
        error: function (data) {
            alert("发布失败！");
        }
    });

};

/*支持管理-删除*/
Support.version_del = function (id) {
    var self = this;
    layer.confirm('确认要删除吗？', function () {
        $.ajax({
            type: 'POST',
            url: self.delSupportAPI,
            dataType: 'json',
            data: {"id": id},
            success: function (data) {
                if (data.state) {
                    self.getVersionList();
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

/*支持-根据ID查询详情*/
Support.prototype.getDetailById = function (id) {
    if (!id) {
        return
    }

    $.ajax({
            type: 'POST',
            url: support.getSupportByIdAPI,
            dataType: 'json',
            data: {
                "id": id
            },
            success: function (data) {
                try {
                    var data = data.rs;
                    var columnType = data.columnType - 1;
                    var columnName = supportColumnTypeList.rs[columnType].name;
                    $("#supportTitle").val(data.title);
                    $("#supportCate").val(columnName);//栏目；
                    $("#getProCate").val(data.productCategory.name);//产品分类；
                    var releaseTime = data.releaseTime.substring(0, 10);
                    var seoShow = data.seoShow;
                    var version = data.version.name;
                    if (seoShow == 0) {
                        seoShow = "自动抓取"
                    } else if (seoShow == 1) {
                        seoShow = "手动设置"
                    }
                    console.log(data);
                    $("#getVersionCate").val(version);//版本；
                    $("#supportReleaseTime").val(releaseTime);//发布时间；
                    $("#supportTags").val(data.tags);
                    $("#supportSEOShow").val(seoShow);
                    $("#supportseoTitle").val(data.seoTitle);
                    $("#supportseoKeyword").val(data.seoKeywords);
                    $("#supportseoDescription").val(data.seoDescription);
                    $('.js-supportuploadfile').text(data.thumbImg);
                    $('.js-uploadSupportFile').text(data.fileUrl);
                    $("#videoType").val(data.type);
                    supportThumbImgURL = data.thumbImg;
                    file.setFileUrl(data.fileUrl);
                    $("#supportDescribe").val(data.descp);

                    myEeditor.html(data.content);
                    info_edit_id = id;
                } catch (e) {
                    console.log(e);
                }

            },
            error: function (data) {
                console.log(data.msg);
            }
        }
    )
};

//实例化；
var support = new Support();
support.init();
