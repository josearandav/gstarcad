/**
 * Created by Administrator on 2017/9/13 0013.
 */

var appSaveURL = "/api/enquiry/save",
    getEnquiryByIdURL = "/api/enquiry/getEnquiry",
    getAppCateListUrl = "/api/enquiry/list";

// 加载详细数据；
if (EnquiryFormId) {
    download_queryID_ajax(EnquiryFormId);
}

/*应用-根据ID查询应用数据*/
function download_queryID_ajax(id) {

    $.ajax({
        type: 'POST',
        url: getEnquiryByIdURL,
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
        var data = res.rs;
        EnquiryFormId = res.rs.id;
        $("#givenName").val(data.givenName);
        $("#familyName").val(data.familyName);
        $("#company").val(data.company);
        $("#country").val(data.country);
        $("#phone").val(data.phone);
        $("#eMail").val(data.EMail);
        $("#processor").val(data.processor);
        $("#software").val(data.software);
        $("#isReceive").val(data.isReceive);
        $("#isDeal").val(data.isDeal);
        $("#note").val(data.note);
        $("#createtime").val(data.createtime)
    }
}

/*应用-添加/编辑-AJAX*/
function enquiry_submit_ajax() {
    var data = {
        "id": EnquiryFormId,
        "givenName": $("#givenName").val(),
        "familyName": $("#familyName").val(),
        "company": $("#company").val(),
        "country": $("#country").val(),
        "phone": $("#phone").val(),
        "eMail": $("#eMail").val(),
        "processor": $("#processor").val(),
        "software": $("#software").val(),
        "isReceive": $("#isReceive").val(),
        "isDeal": $("#isDeal").val(),
        "note": $("#note").val()
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
                EnquiryFormId = undefined;
                index.loadContent("enquiry/enquiryManage");
            } else {
                alert(res.message);
            }
        },
        error: function (res) {
            console.log(res);
        }

    });

}

