/**
 * Created by Administrator on 2018/2/2 0002.
 */
/**
 * 四、SEO管理
 */
var SEOGetListURL = "/api/seo/list",
    getSEOListByIdAPID = "/api/seo/getSeoManage",
    SEODelURL = "/api/seo/del",
    SEOAddEditURL = "/api/seo/save";

btnSEOList();//自动添加分类及列表信息；

function btnSEOList() {

    autoFillCateData("SEOdCategory");//添加所有分类；

    if(SEOCateId){
        SEO_getList(SEOCateId);//获取SEO列表；
        fillCateNameById(SEOCateId, "SEOdCategory");
    }else{
        SEO_getList();//获取SEO列表；
    }


}

/*根据分类  进行筛选SEO列表*/
function SEO_queryCate() {
    //        获取并添加分类数据；
    var category = $("#SEOdCategory").find("option:selected").attr("data-id");
    SEOCateId = category;
    SEO_getList(category);
}

/*SEO-编辑*/
function SEO_edit(id) {
    location.hash = id;
    index.loadContent('SEO/addSEO');
    getSeoListById(id);
}

/*根据ID获取SEO详细信息*/
function getSeoListById(id) {
    if (id) {
        $.ajax({
            type: 'POST',
            url: getSEOListByIdAPID,
            dataType: 'json',
            data: {
                "id": id
            },
            success: function (data) {
                var rs = data.rs;
                var categoryId = "";
                try {
                    if (!rs.menuType) {
                    } else {
                        categoryId = rs.menuType.id;
                    }
                } catch (e) {
                    throw e;
                }

                if (data.state) {
                    fillCateNameById(categoryId, "SEOaddCategory");
                    $("#pageName").val(rs.pageName);
                    $("#title").val(rs.title);
                    $("#keywords").val(rs.keywords);
                    $("#description").val(rs.description);
                } else {

                }
            },
            error: function (data) {
                console.log(data.msg);
            }
        });


    }

}

/*SEO-删除*/
function SEO_del(id) {
    layer.confirm('确认要删除吗？', function (index) {
        $.ajax({
            type: 'POST',
            url: SEODelURL,
            dataType: 'json',
            data: {id: id},
            success: function (res) {
                if (res.state) {
                    layer.msg('删除成功!', {icon: 1, time: 1000});
                    btnSEOList();
                } else {
                    alert(res.message);
                    btnSEOList();
                }
            },
            error: function (res) {
                console.log(res.msg);
            }

        });
    })
}

/*SEO-获取列表*/
function SEO_getList(categoryId) {
    var data = {
        "categoryId": categoryId
    };
    $.ajax({
        type: 'POST',
        url: SEOGetListURL,
        dataType: 'json',
        data: data,
        success: function (res) {
            if (res.state) {
                showList(res);
            }
        },
        error: function (res) {
            console.log(res.msg);
        }

    });
    function showList(data) {
        var htmlStr = "";
        for (var i = 0, len = data.rs.length; i < len; i++) {
            htmlStr += '<tr class="va-m"><td id="pageID" class="text-c">' + data.rs[i].id + '</td><td id="pageName"><a  style="display: inline-block;width:100%;height:100%;" href="javascript:;"  >' + data.rs[i].pageName + '</td><td id="title">' + data.rs[i].title + '</td><td  id="keywords">' + data.rs[i].keywords + '</td><td id="description">' + data.rs[i].description + '</td><td class="td-manage  text-c"><a onclick="SEO_edit(' + data.rs[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a onclick="SEO_del(' + data.rs[i].id + ')"  style="text-decoration:none" class="ml-5" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td></tr>'
        }
        document.getElementById("SEOWrap").innerHTML = htmlStr;
    }
}