/**
 * Created by Administrator on 2017/9/13 0013.
 */
/**
 * 询价表单
 */
var getEnquiryListAPI = "/api/enquiry/list";
var getEnquiryByIdUrl = "/api/enquiry/getEnquiry";
var saveEnquiryUrl = "/api/enquiry/save";
var delEnquiryUrl = "/api/enquiry/del";
var info_edit_id = null;//修改询价表单的ID

btnReleaseInfo();//自动添加分类数据；
function btnReleaseInfo() {
    enquiryPage();
}

/* 询价表单-编辑*/
function enquiry_edit(id) {
    EnquiryFormId = id;
    index.loadContent("enquiry/addEnquiry");
}

/*询价表单-显示已添加询价表单*/
function getEnquiryList(pageNumber, pageSize) {
    var data = {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "startTimeStr": $("#dStartTime").val(),
        "endTimeStr": $("#dEndTime").val(),
        "isDeal": $("#isDeal").val()
    };
    $.ajax({
        type: 'POST',
        url: getEnquiryListAPI,
        dataType: 'json',
        data: data,
        success: function (data) {
            getAppInfos(data);
        },
        error: function (data) {
            console.log(data.msg);
        }
    });
}

/** 公共- 分页功能**/
function enquiryPage() {
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
            "startTimeStr": $("#dStartTime").val(),
            "endTimeStr": $("#dEndTime").val(),
            "isDeal": $("#isDeal").val()
        };

        $.ajax({
            type: 'POST',
            url: getEnquiryListAPI,
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
function enquiry_del(id){
    layer.confirm('确认要删除吗？', function () {

        $.ajax({
            type: 'POST',
            url: delEnquiryUrl,
            dataType: 'json',
            data: {
                id: id
            },
            success: function () {
                $("#layui-layer1").hide();
                $("#layui-layer-shade1").hide();
                index.loadContent("enquiry/enquiryManage");
            },
            error: function (data) {
                console.log(data.msg);
            }
        });

    });
}

/*显示信息列表信息*/
function getAppInfos(res) {
    var htmlStr = "";
    var isDeal = "";
    for (var i = 0, len = res.data.length; i < len; i++) {
        var number = i + 1;
        isDeal = res.data[i].isDeal === 1 ? "已处理" : "未处理";

        var str = res.data[i].isReceive === 1 ? "是" : "否";

        htmlStr += '<tr class="text-c"><td>' + number + '</td><td >' + res.data[i].givenName + '</td><td>' + res.data[i].familyName + '</td><td>' + res.data[i].company + '</td><td >' + res.data[i].software + '</td><td >' + res.data[i].EMail + '</td><td >' + res.data[i].phone + '</td><td >' + res.data[i].country + '</td><td >' + str + '</td><td >' + isDeal + '</td><td >' + res.data[i].processor + '</td><td class="f-14 td-manage"><a data-id="infoFlag" onclick="enquiry_edit( ' + res.data[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a data-id="infoFlag" onclick="enquiry_del( ' + res.data[i].id + ')" title="删除" href="javascript:;" class="delAdmin ml-5" style="text-decoration:none"><i  class="Hui-iconfont">&#xe6e2;</i></a></td></tr>';

    }
    document.getElementById("infoList_wrap").innerHTML = htmlStr;
}

