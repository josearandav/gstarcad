/**
 * Created by Administrator on 2017/9/13 0013.
 */
/**
 * 信息管理
 */
var getInfoListUrl = "/api/news/list";
var delInfoUrl = "/api/news/del";
var info_edit_id = null;//修改信息的ID

btnReleaseInfo();//自动添加分类数据；
function btnReleaseInfo(infoView) {
    if (infoView != 1) {
        // autoFillCateData("catFilter");// 获取并添加分类数据；

        autoFillInfoCateData("catFilter");//获取新闻分类数据；

        // page(getInfoListUrl);//加载新闻列表；
        page(getInfoListUrl);
    }
}

//根据分类查询信息列表；
function info_queryCate() {
    var cateID = $("#catFilter").find("option:selected").attr("data-id");//新闻、案例分类；
    $("#searchInfo_words").val("");
    page(getInfoListUrl, cateID);
}

/*根据分类和关键字-搜索资讯*/
function searchInfo() {
    var keywords = $("#searchInfo_words").val();
    var cateID = $("#catFilter").find("option:selected").attr("data-id");//新闻、案例分类；
    page(getInfoListUrl, cateID, keywords);
}
//键盘回车搜索；
$("#searchInfo_words").focus(function () {
    searchInfoByKeydown();
});

/* 信息-编辑*/
function info_edit(target, id) {
    var btnName = $(target).attr("data-id");
    // support.flag = $("#dSearchSupportCat").val();
    window.location.href="/console/info"+"?id="+id +"&tag="+ btnName;
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
                        getInfoList();

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

/*信息-搜索资讯-回车按键*/
function searchInfoByKeydown() {

    document.onkeydown = function (event) {
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if (e && e.keyCode == 13) { // enter 键
            //要做的事情
            var keywords = $("#searchInfo_words").val();
            var cateID = $("#catFilter").find("option:selected").attr("data-id");//新闻、案例分类；
            page(getInfoListUrl, cateID, keywords);
        }
    };
}

/*信息-显示已添加信息*/
function getInfoList(pageNumber, pageSize, keywords, categoryId) {
    var data = {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "keywords": keywords,
        "categoryId": categoryId
    };
    $.ajax({
        type: 'POST',
        url: getInfoListUrl,
        dataType: 'json',
        data: data,
        success: function (data) {
            console.log(data);
            getInfos(data);
        },
        error: function (data) {
            console.log(data.msg);
        }
    });


}

