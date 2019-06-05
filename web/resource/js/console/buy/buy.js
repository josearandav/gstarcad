/**
 * Created by Administrator on 2017/7/26 0026.
 */
/**
 * 电商Buy列表
 */
var getSoftListUrl = "/api/price/list";
var delSoftAPI = "/api/price/del";

getSoftList();

/*电商Buy-删除*/
function soft_del(id) {
    layer.confirm('确认要删除吗？', function (index) {
        $.ajax({
            type: 'POST',
            url: delSoftAPI,
            dataType: 'json',
            data: {id: id},
            success: function (data) {
                if (data.state) {
                    getSoftList(data);
                    layer.msg('已删除!', {icon: 1, time: 1000});
                }
            },
            error: function (data) {
                console.log(data.msg);
            }
        });
    });
}

/*电商Buy-编辑*/
function soft_edit(id) {
    index.loadContent('buy/addBuy');
    buySoftId = id;
}

/*获取电商Buy列表*/
function getSoftList() {
    var htmlStr = "";
    var isSale = '是';
    var number = 1;
    $.ajax({
        type: 'POST',
        url: getSoftListUrl,
        dataType: 'json',
        success: function (data) {
            if (data.state) {
                showAdminList(data);
            }
        },
        error: function (data) {
            console.log(data.msg);
        }

    });
    function showAdminList(data) {
        for (var i = 0, len = data.rs.length; i < len; i++) {
            isSale = data.rs[i].isSale ? isSale : "否";
            number = i + 1;
            htmlStr += '<tr class="text-c"><td>' + number + '</td><td>' + data.rs[i].id + '</td> <td>' + data.rs[i].name + '</td><td>' + data.rs[i].formerprice + '</td><td>' + data.rs[i].price + '</td><td>' + data.rs[i].upgradePrice + '</td><td>' + data.rs[i].upgradeFormerprice + '</td><td>' + isSale + '</td><td>' + data.rs[i].thumbImg + '</td><td class="td-manage"><a title="编辑" onclick="soft_edit(' + data.rs[i].id + ')" href="javascript:;" class="delAdmin ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a><a title="删除" href="javascript:;" class="delAdmin ml-5" style="text-decoration:none"><i onclick="soft_del(' + data.rs[i].id + ')" class="Hui-iconfont">&#xe6e2;</i></a></td></tr>'

        }
        document.getElementById('adminListWrap').innerHTML = htmlStr;
    }
}