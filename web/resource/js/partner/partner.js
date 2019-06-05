/**
 * Created by Administrator on 2018/3/5 0005.
 */
$(document).ready(function () {
    $("[data-fancybox]").fancybox({});
});
var getProCateListUrl = "/api/software/list";
var partnerSaveAPI = "/api/enquiry/save";
var softName = [];

//自动添加软件产品数据；
autoFillProductsData();

/*产品分类-自动获取分类列表*/
function autoFillProductsData() {
    $.ajax({
        type: 'POST',
        url: getProCateListUrl,
        dataType: 'json',
        success: function (data) {
            addCateList(data);
        },
        error: function (data) {
            console.log(data.msg);
        }
    });
    function addCateList(data) {
        var htmlStr = "";
        var rs = data.rs;
        for (var i = 0, len = rs.length; i < len; i++) {
            softName.push(rs[i].name);
            htmlStr += '<li><input class="js-softwarename" id="' + rs[i].name + '"  name="' + rs[i].name + '" data-soft-id="' + rs[i].id + '" type="checkbox"> <label for="' + rs[i].name + '">' + rs[i].name + '</label></li>'
        }
        $(".js-software").html(htmlStr);
    }
}

// 添加国家列表；
fillCountriesData(countriesJSON);
function fillCountriesData(data) {
    var template = "<option value='0'>Select a country/region</option>";
    if (data) {
        var dataType = typeof data;
        switch (dataType) {
            case "[object array]":
                mapArr(value, index, current);
                break;
            case "[object object]":
                mapObj(data);
                break;
            default:
                mapObj(data);
        }
        // 遍历数组；
        function mapArr(value, index, current) {
            data.forEach(function (value, index, current) {
                template += "<option value='" + value.code + "'>" + value.name + "</option>";
            });
        }

        //  遍历JSON;
        function mapObj(obj) {
            for (var key in obj) {
                if (obj.hasOwnProperty(key)) {
                    template += "<option value='" + key + "'>" + obj[key] + "</option>";
                }
            }
        }

        $("#country").html(template);
    }
}

//根据勾选，高亮显示内容；
$(".js-emailyes-check").click(function () {
    $(".js-emailyes").addClass("checked");
    $(".js-emailno").removeClass("checked");
});
$(".js-emailno-check").click(function () {
    $(".js-emailno").addClass("checked");
    $(".js-emailyes").removeClass("checked");
});

//检测是否选择了软件名称；
function isChooseSoftware() {
    var softwarename = document.getElementsByClassName(" js-softwarename");
    var checkTag = false;
    for (var i = 0; i < softwarename.length; i++) {
        if (softwarename[i].checked) {
            checkTag = true;
            return checkTag;
        }
    }
    return checkTag;
}


/* 添加询价单 */
function submit() {
    var id;
    var inputs = $(".js-softwarename");
    var softName = "";
    for (var j = 0; j < inputs.length; j++) {
        if ($(".js-softwarename").eq(j).prop('checked')) {
            softName += $(".js-softwarename").eq(j).attr("name") + ",";
        }
    }
    var email = $("input[name='email']").val();
    var data = {
        "software": softName,
        "givenName": $("input[name='givenname']").val(),
        "familyName": $("input[name='familyname']").val(),
        "company": $("input[name='company']").val(),
        "country": $("select[name='country']").find("option:selected").text(),
        "veriCountry":$("select[name='country']").find("option:selected").val(),
        "eMail": email,
        "phone": $("input[name='phone']").val(),
        "isReceive": $("input[name='email-yes']").prop('checked') ? 1 : 2
    };
    if (!isChooseSoftware()) {
        alert("Please choose one type of SOFTWARE!");
        return;
    } else if (!data.givenName) {
        alert("Please input your Given Name!");
        return;
    } else if (!data.familyName) {
        alert("Please input your Family Name!");
        return;
    } else if (!data.company) {
        alert("Please input your Company!");
        return;
    } else if (data.veriCountry == 0) {
        alert("Please select your Country!");
        return;
    } else if (!data.phone) {
        alert("Please input your Phone Number!");
        return;
    }
    checkEmail(email);

    if (!isRegEmail(email)) {
        alert("Please input valid Email!");
        return;
    }
    $.ajax({
        id: id,
        type: 'POST',
        url: partnerSaveAPI,//提交询价表的API
        dataType: 'json',
        data: data,
        success: function (res) {
            alert("Submit success!");
            resetFormInput();
        },
        error: function (res) {
            alert(res.msg);
        }
    });

}
//重置form表单
function resetFormInput() {
    $(".js-software input").attr("checked", false);

    $("input[name='givenname']").val("");
    $("input[name='familyname']").val("");
    $("input[name='company']").val("");
    $("select[name='country']").val("0");
    $("input[name='email']").val("");
    $("input[name='phone']").val("");

    $(".js-emailyes").click();
    $(".js-email-input").removeClass("error");
    $(".js-email-tip").hide();
}

// 动态检查邮件输入；
$("input[name='email']").keyup(function () {
    var email = $("input[name='email']").val();
    checkEmail(email);
});
function checkEmail(email) {
    if (!isRegEmail(email)) {
        $(".js-email-input").addClass("error");
        $(".js-email-tip").show();
    } else {
        $(".js-email-input").removeClass("error");
        $(".js-email-tip").hide();
    }
}

//  检测邮件格式是否合格；
function isRegEmail(email) {
    var regEmail = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
    return regEmail.test(email);
}