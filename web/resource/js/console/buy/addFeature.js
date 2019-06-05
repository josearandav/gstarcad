/**
 * Created by Administrator on 2017/9/13 0013.
 */

var appIconURL = "",
    priceIconImgURL = "",
    appSaveURL = "/api/feature/save",
    getPriceById = "/api/feature/getfeature",
    getAppCateListUrl = "/api/feature/list";
    getPriceListUrl = "/api/price/list";

/*自动添加资讯分类数据*/
function fillSelectData(API,id, noAll) {
    $.ajax({
        type: 'POST',
        url: API,
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
fillSelectData(getPriceListUrl,"getPrice", "noAll");

// 加载详细数据；
loadDownloadDetail(buyFeatureId);
function loadDownloadDetail(id) {
    if (id) {
        download_queryID_ajax(id);
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
        fillAppCateNameById("/api/price/list",res.rs.ecPrice.id,"getPrice");

        $("#feature").val(res.rs.feature);
        $("#isSupport").val(res.rs.isSupport);
        $("#sort").val(res.rs.sort);
    }
}

/*应用-添加/编辑-AJAX*/
function app_submit_ajax() {
    var data = {
        "priceId": $("#getPrice").find("option:selected").attr("data-id"),
        "id": buyFeatureId,
        "feature": $("#feature").val(),
        "isSupport": $("#isSupport").val(),
        "sort": $("#sort").val()
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
                buyFeatureId = undefined;
                index.loadContent("buy/features");
            } else {
                alert(res.message);
            }
        },
        error: function (res) {
            console.log(res);
        }

    });

}

/*根据分类ID获取分类名称*/
function fillAppCateNameById(API,categoryId, DOMid) {

    $.ajax({
        type: 'POST',
        url: API,
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

