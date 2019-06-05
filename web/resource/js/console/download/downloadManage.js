/**
 * Created by Administrator on 2017/9/13 0013.
 */

/**
 * 五、下载管理
 */
var testDownloadCate = {
        rs: [
            {"id": "", "category": "全部"},
            {"id": "GstarCAD", "category": "GstarCAD"},
            {"id": "DWG_FastView", "category": "DWG_FastView"}
        ]
    },
    getDownloadListURL = "/api/down/list",
    downloadDelURL = "/api/down/del";

/* 点击左侧下载管理按钮 */
btnDownloadList();

function btnDownloadList() {
    page(getDownloadListURL);
    getDCateList("dSearchCategory");
}

/*下载-自动获取分类列表*/
function getDCateList(id, noAll) {

    addCateList(testDownloadCate, noAll);
    function addCateList(data, noAll) {
        var i = 0,
            len = data.rs.length;
        if (noAll) {
            i = 1;
        }
        var htmlStr = '';
        for (i; i < len; i++) {
            htmlStr += '<option data-id="' + data.rs[i].id + '">' + data.rs[i].category + '</option>'
        }
        document.getElementById(id).innerHTML = htmlStr;
    }
}

/*下载-分类筛选*/
function download_queryCate() {
    var category = $("#dSearchCategory").find("option:selected").attr("data-id");
    page(getDownloadListURL, category);
}

/*下载-编辑*/
function download_edit(id) {
    index.loadContent('download/addDownload');
    DownloadId = id;
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

/*加载下载信息列表*/
function showDownloadList(res) {
    var htmlStr = "";
    for (var i = 0, len = res.data.length; i < len; i++) {
        var orderNum = i + 1;
        htmlStr += '<tr class="text-c"><td>' + orderNum + '</td><td>' + res.data[i].softName + '</td><td>' + res.data[i].category + '</td><td><img style="width: 50px;" src="' + res.data[i].downIcon + '" alt=""></td><td class="text-l">' + res.data[i].local32Url + '</td><td>' + res.data[i].local64Url + '</td><td>' + res.data[i].createtime + '</td><td>' + res.data[i].sort + '</td><td class="td-manage"><a onclick="download_edit(' + res.data[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a onclick="download_del(' + res.data[i].id + ')"  style="text-decoration:none" class="ml-5" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td></tr>'
    }
    document.getElementById("downloadWarp").innerHTML = htmlStr;
}