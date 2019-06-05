/**
 * Created by Administrator on 2017/9/13 0013.
 */
/**
 * 询价表单
 */
var getEnquiryList = "/api/reseller/list";
var getEnquiryByIdUrl = "/api/reseller/getReseller";
var saveEnquiryUrl = "/api/reseller/save";
var info_edit_id = null;//修改询价表单的ID

// btnReleaseInfo();//自动添加分类数据；
function btnReleaseInfo() {
    page(getEnquiryList);
}

/* 询价表单-编辑*/
function enquiry_edit(id) {
    PartnerId = id;
    index.loadContent("partner/addPartner");
}
getAdds();

/*显示询价表单列表*/
function getAdds(res) {
    $.ajax({
        type: 'POST',
        url: getEnquiryList,
        dataType: 'json',
        success: function (data) {
            addCateList(data.rs);
        },
        error: function (data) {
            console.log(data.msg);
        }
    });
    function addCateList(res){
        var htmlStr = "";
        for (var i = 0, len = res.data.length; i < len; i++) {
            var number = i + 1;
            htmlStr += '<tr class="text-c"><td>' + number + '</td><td>' + res.data[i].id + '</td><td >' + res.data[i].country + '</td><td >' + res.data[i].thumbImg + '</td><td>' + res.data[i].company + '</td><td>' + res.data[i].descp + '</td><td>' + res.data[i].address + '</td><td>' + res.data[i].eMail + '</td><td>' + res.data[i].phone + '</td><td>' + res.data[i].fax + '</td><td>' + res.data[i].webUrl + '</td><td class="f-14 td-manage"><a data-id="infoFlag" onclick="enquiry_edit(' + res.data[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a data-id="infoFlag" onclick="app_del( ' + res.data[i].id + ')" title="删除" href="javascript:;" class="delAdmin ml-5" style="text-decoration:none"><i  class="Hui-iconfont">&#xe6e2;</i></a></td></tr>';

        }
        document.getElementById("infoList_wrap").innerHTML = htmlStr;
    }

}

