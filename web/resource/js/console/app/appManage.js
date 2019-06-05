/**
 * Created by Administrator on 2017/9/13 0013.
 */
/**
 * 应用管理
 */
var getAppListUrl = "/api/application/list";
var delInfoUrl = "/api/application/del";

btnReleaseInfo();//自动添加分类数据；
function btnReleaseInfo(infoView) {
    if (infoView != 1) {
        autoFillAppCateData("catFilter");// 获取并添加分类数据；
        appPage(getAppListUrl);
    }
}

//根据分类查询信息列表；
function info_queryCate() {
    var cateID = $("#catFilter").find("option:selected").attr("data-id");//新闻、案例分类；
    var keyWords = $("#searchInfo_words").val();
    appPage(getAppListUrl, cateID, keyWords);
}

/*根据分类和关键字-搜索资讯*/
function searchInfo() {
    var keywords = $("#searchInfo_words").val();
    var cateID = $("#catFilter").find("option:selected").attr("data-id");//新闻、案例分类；
    appPage(getAppListUrl, cateID, keywords);
}
//键盘回车搜索；
$("#searchInfo_words").focus(function () {
    searchInfoByKeydown();
});

/* 信息-编辑*/
function app_edit(id) {
    ApplicationId = id;
    index.loadContent("app/addApp");
}

/*信息-删除*/
function app_del(id) {
    sendAjax();
    function sendAjax() {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: delInfoUrl,
                dataType: 'json',
                data: {
                    "id": id
                },
                success: function (data) {
                    if (data.state) {
                        layer.msg('已删除!', {icon: 1, time: 1000});
                        appPage(getAppListUrl);
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
            appPage(getAppListUrl, cateID, keywords);
        }
    };
}

/** 公共- 分页功能**/
function appPage(getListAPI, categoryId, keywords) {
    var pageNumber = 1,
        pageSize = 20,
        totalPage = 1,
        callback = getAppInfos;

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
        var data = {
            "pageNumber": pageNumber,
            "pageSize": pageSize,
            "category": categoryId,
            "keywords": keywords
        };

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

/*显示信息列表信息*/
function getAppInfos(res) {
    var htmlStr = "";
    for (var i = 0, len = res.data.length; i < len; i++) {
        var number = i + 1;

        htmlStr += '<tr class="text-c"><td>' + number + '</td><td>' + res.data[i].id + '</td><td >' + res.data[i].title + '</td><td >' + res.data[i].websiteUrl + '</td><td class="f-14 td-manage"><a data-id="infoFlag" onclick="app_edit( ' + res.data[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a data-id="infoFlag" onclick="app_del( ' + res.data[i].id + ')" title="删除" href="javascript:;" class="delAdmin ml-5" style="text-decoration:none"><i  class="Hui-iconfont">&#xe6e2;</i></a></td></tr>';

    }
    document.getElementById("infoList_wrap").innerHTML = htmlStr;
}
