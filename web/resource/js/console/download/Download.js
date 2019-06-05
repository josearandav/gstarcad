/**
 * Created by Administrator on 2017/9/13 0013.
 */

var downloadIconURL = "",
    testDownloadCate = {
        rs: [
            {"id": "", "category": "全部"},
            {"id": "GstarCAD", "category": "GstarCAD"},
            {"id": "DWG_FastView", "category": "DWG_FastView"}
        ]
    },
    getDownloadListURL = "/api/down/list",
    getDownTableAPI = '/api/down/getReport',
    downloadSaveURL = "/api/down/save",
    deleteBatchAPI = "/api/down/delRecords",
    downloadDelURL = "/api/down/del";

// 加载详细数据；
loadDownloadDetail(DownloadId);
function loadDownloadDetail(id) {
    if (id) {
        download_queryID_ajax(id);
    }
    getDCateList("dSearchDownload");
}


/*下载-自动获取软件产品列表*/
function getDCateList(id, noAll) {
    var softNames = {};
    $.ajax({
        type: 'POST',
        url: getDownloadListURL,
        dataType: 'json',
        success: function (data) {
            softNames = data.data;
            addCateList(softNames, noAll);
        },
        error: function (data) {
            console.log(data.msg);
        }
    });

    function addCateList(data, noAll) {
        var i = 0,
            len = data.length;
        if (noAll) {
            i = 1;
        }
        var htmlStr = '<option value="">所有</option>';
        for (i; i < len; i++) {
            htmlStr += '<option data-id="' + data[i].id + '">' + data[i].softName + '</option>'
        }
        document.getElementById(id).innerHTML = htmlStr;
    }
}

// 批量删除
function deleteBatch() {
    layer.confirm('确认要删除吗？', function (index) {

        var idS = '';
        $.each($('input:checkbox:checked'), function () {
            idS += $(this).val() + ',';
        });
        $.ajax({
            type: 'POST',
            url: deleteBatchAPI,
            dataType: 'json',
            data: {
                "ids": idS
            },
            success: function (res) {
                showList(res);
            },
            error: function (res) {
            }
        });
        function showList(res) {
            var htmlStr = "";
            try {

                for (var i = 0, len = res.data.length; i < len; i++) {
                    var orderNum = i + 1;
                    htmlStr += '<tr>'
                        + '<td><input class="js-check" type="checkbox" name="' + res.data[i].id + '" value="' + res.data[i].id + '"></td>'
                        + '<td>' + orderNum + '</td>'
                        + '<td>' + res.data[i].id + '</td>'
                        + '<td>' + res.data[i].softName + '</td>'
                        + '<td>' + res.data[i].userName + '</td>'
                        + '<td>' + res.data[i].email + '</td>'
                        + '<td>' + res.data[i].phone + '</td>'
                        + '<td>' + res.data[i].workunit + '</td>'
                        + '<td>' + res.data[i].country + '</td>'
                        + '<td>' + res.data[i].downTime + '</td>'
                        + '</tr>'
                }
                totalPage = res.totalPage;
                $("#currentPage").text(pageNumber);
                $("#totalPage").text(totalPage);
                $("#totalNums").text(res.totalRow);
            } catch (e) {
                console.log(e);
            }

            document.getElementById("downloadTable").innerHTML = htmlStr;
        }

    });

}


/* 下载-查询下载报表 */
var pageNumber = 1;
var totalPage = 1;
function download_queryList(pageNumber) {
    var softwareName = $("#dSearchDownload").val();
    // var category = $("#dSearchDownload").find("option:selected").attr("data-id");
    var dStartTime = $('#dStartTime').val();//开始时间；
    var dEndTime = $('#dEndTime').val();//截止时间；

    //TODO:需要根据接口的要求，传入对应的参数名称。
    $.ajax({
        type: 'POST',
        url: getDownTableAPI,//获取报表的API
        dataType: 'json',
        data: {
            "pageNumber": pageNumber,
            "pageSize": 20,
            "startTime": dStartTime,
            "endTime": dEndTime,
            "softwareName": softwareName
        },
        success: function (res) {
            showList(res);
        },
        error: function (res) {
        }
    });

    /*加载下载信息列表*/
    //TODO:需要根据返回的数据名称及结构，更改下面的变量。
    function showList(res) {
        var htmlStr = "";
        try {

            for (var i = 0, len = res.data.length; i < len; i++) {
                var orderNum = i + 1;
                htmlStr += '<tr>'
                    + '<td><input class="js-check" type="checkbox" name="' + res.data[i].id + '" value="' + res.data[i].id + '"></td>'
                    + '<td>' + orderNum + '</td>'
                    + '<td>' + res.data[i].id + '</td>'
                    + '<td>' + res.data[i].softName + '</td>'
                    + '<td>' + res.data[i].userName + '</td>'
                    + '<td>' + res.data[i].email + '</td>'
                    + '<td>' + res.data[i].phone + '</td>'
                    + '<td>' + res.data[i].workunit + '</td>'
                    + '<td>' + res.data[i].country + '</td>'
                    + '<td>' + res.data[i].downTime + '</td>'
                    + '</tr>'
            }
            totalPage = res.totalPage;
            $("#currentPage").text(pageNumber);
            $("#totalPage").text(totalPage);
            $("#totalNums").text(res.totalRow);
        } catch (e) {
            console.log(e);
        }

        document.getElementById("downloadTable").innerHTML = htmlStr;
    }

}

//上一页
function getPrePage() {
    pageNumber = pageNumber - 1;
    if (pageNumber < 1) {
        pageNumber = 1;
    }
    download_queryList(pageNumber);
}

//下一页
function getNextPage() {
    pageNumber = pageNumber + 1;
    if (pageNumber > totalPage) {
        pageNumber = totalPage;
    }
    download_queryList(pageNumber);
}

/* 导出下载数据报表 */
function export_downloadTable() {
    //TODO:需要根据接口，完成相应参数的传递；
    var softName = $("#dSearchDownload").val();
    var dStartTime = $('#dStartTime').val();//开始时间；
    var dEndTime = $('#dEndTime').val();//截止时间；
    window.location.href = "api/down/generateExcel?startTime=" + dStartTime + "&endTime=" + dEndTime + "&category=" + softName;
}

/*下载-根据ID查询下载数据*/
function download_queryID_ajax(id) {
    $.ajax({
        type: 'POST',
        url: "/api/down/getSoftInfo",
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
        $("#dCategory").val(res.rs.category);
        downloadIconURL = res.rs.downIcon;
        $(".js-downloadIcon").text(res.rs.downIcon);
        $("#softName").val(res.rs.softName);
        $("#descp").val(res.rs.descp);
        $("#dContent").val(res.rs.content);
        $("#runEnvir").val(res.rs.runEnvir);
        $("#local32Url").val(res.rs.local32Url);
        $("#local64Url").val(res.rs.local64Url);
        $("#softSize").val(res.rs.softSize);
        $("#releaseTime").val(res.rs.releaseTime.substring(0, 10));
        $("#moreUrl").val(res.rs.moreUrl);
        $("#showTarget").val(res.rs.showTarget);
        $("#sortNum").val(res.rs.sort);
    }
}

/*下载-删除*/
function download_del(id) {
    layer.confirm('确认要删除吗？', function (index) {
        $.ajax({
            type: 'POST',
            url: downloadDelURL,
            dataType: 'json',
            data: {id: id},
            success: function (res) {
                if (res.state) {
                    layer.msg('删除成功!', {icon: 1, time: 1000});
                    btnDownloadList();
                } else {
                    alert(res.message);
                    btnDownloadList();
                }
            },
            error: function (res) {
                console.log(res.msg);
            }

        });
    });
}

/*下载-添加/编辑-AJAX*/
function download_submit_ajax() {
    var data = {
        "id": DownloadId,
        "category": $("#dCategory").val(),
        "downIcon": downloadIconURL,
        "softName": $("#softName").val(),
        "content": $("#dContent").val(),
        "descp": $("#descp").val(),
        "runEnvir": $("#runEnvir").val(),
        "local32Url": $("#local32Url").val(),
        "local64Url": $("#local64Url").val(),
        "softSize": $("#softSize").val(),
        "releaseTime": $("#releaseTime").val(),
        "moreUrl": $("#moreUrl").val(),
        "showTarget": $("#showTarget").val(),
        "sort": $("#sortNum").val()
    };
    if (!$("#releaseTime").val()) {
        alert("请选择发布时间！");
        return
    }
    $.ajax({
        type: 'POST',
        url: downloadSaveURL,
        dataType: 'json',
        data: data,
        success: function (res) {
            if (res.state) {
                layer.msg('提交成功!', {icon: 1, time: 1000});
                downloadIconURL = "";
                DownloadId = undefined;
                index.loadContent('download/downloadManage');
            } else {
                alert(res.message);
            }
        },
        error: function (res) {
            console.log(res);
        }

    });

}


/*下载-上传icon图片-大小1MB-类型png,jpg,jpeg*/
function uploadIconImg(target) {
    /*图片类型和大小的限制*/
    var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
    var fileSize = 0;
    var category = $("#getCate").val();
    var allowWidth = 122;
    var allowHeight = 122;
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
            if (width === allowWidth && height === allowHeight) {
                fileUpload();
            } else {
                alert("图片尺寸不符合要求！");
                $("#iconPic").val("");
            }
        };
        image.src = imagePath;
    }
    function fileUpload() {
        $.ajaxFileUpload({
            url: '/api/down/uploadIcon', //用于文件上传的服务器端请求地址
            secureuri: false, //是否需要安全协议，一般设置为false
            fileElementId: 'iconPic', //文件上传域的ID
            dataType: 'json', //返回值类型 一般设置为json
            success: function (data) {
                alert("图片上传成功!");
//                返回图片的UTL地址；
//                $("#thumbImgUrl").val(data.url);
                data = JSON.parse(data.responseText);
                downloadIconURL = data.rs.imgUrl;
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                data = JSON.parse(data.responseText);
                downloadIconURL = data.rs.imgUrl;
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

function cancel_submit_ajax() {
    DownloadId = undefined;
    index.loadContent('download/downloadManage');
}
