/**
 * Created by Administrator on 2018/4/2 0002.
 */
// 添加国家列表；
var hotCountriesAPI = "/reseller/getHotWords";
var searchCountryAPI = "/api/country/list";
var hotCountries = "<option>Select a country/region</option>";

// 获取热搜国家
getHotCountries();
function getHotCountries() {
    $.ajax({
        type: 'POST',
        url: hotCountriesAPI,
        dataType: "json",
        success: function (res) {
            res.forEach(function (item) {
                hotCountries += '<option >' + item.keywords + '</option>';
            });
            hotCountries += '<option>------------------------------------------</option>';
            fillCountriesData(countriesJSON, hotCountries);
        }
    })
}
// 添加所有国家信息
function fillCountriesData(data, html) {
    var template = html;
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
//                    template += "<option value='" + value.code + "'>" + value.name + "</option>";
                template += "<option>" + value.name + "</option>";
            });
        }
        //  遍历JSON;
        function mapObj(obj) {
            for (var key in obj) {
                if (obj.hasOwnProperty(key)) {
                    template += "<option>" + obj[key] + "</option>";
//                        template += "<option value='" + key + "'>" + obj[key] + "</option>";
                }
            }
        }
        $("#country").html(template);
    }
}

// ajaxData();
// 根据国家，搜索经销商信息
function ajaxData() {
    var country = $('#country').val();
    $.ajax({
        type: 'POST',
        url: '/partner/ajaxReseller',
        data: {
            country: country
        },
        dataType:"html",
        success: function (res) {
            $("#ajaxList").html(res);
            $(".js-keywords").val("");
            $("#country").val("Select a country/region");
        },
        error:function(res){
            console.log(res)
        }
    })
}
// 点击下拉菜单，显示热搜国家及全部国家；
$(".js-keywords").click(function(){
    fillCountriesData(countriesJSON, hotCountries);
});
// 点击推荐国家，将推荐国家的个数显示为1个；
$("#hotcountries").click(function(){
    var countryName = $(this).val();
    $(this).attr("size",1);
    $(".js-keywords").val("");
    $("#country").val(countryName);
    $(this).removeClass("white");
    $(this).removeClass("show");
});
//  输入时，让背景不透明， 并且赋值给val
$(".js-keywords").focus(function () {
    $(this).addClass("white");
    var countryName = $(this).val();
    $('#country').val(countryName);
});
//  失去焦点时，隐藏下拉列表；
$(".js-keywords").blur(function () {
    $(this).val("");
    $(this).removeClass("white");
    $(document).click(function(){
        $("#hotcountries").removeClass("show");
    });
});
//  实时监控值的变化；
$('.js-keywords').keyup(function () {
    var countryName = $(this).val();
    $('#country').val(countryName);
    searchByKeyWords();
});
//  根据关键字，模糊推荐国家名称
function searchByKeyWords() {
    var keywords = $.trim($(".js-keywords").val());
    if (keywords) {
        $.ajax({
            type: 'POST',
            url: searchCountryAPI,
            dataType: "json",
            data: {
                keywords: keywords
            },
            success: function (res) {
                var html = "";
                res.forEach(function (item) {
                    html += '<option >' + item + '</option>';
                });
                $("#hotcountries").addClass("show");
                $("#hotcountries").attr("size",res.length)
                $("#hotcountries").html(html);
            }
        })
    }

}

//取消提交用户信息
function cancel_userInfo() {
	
}

//  提交用户信息
function submit_userInfo() {
	var data = {
	uid: uid, 
    country: $('#country').val(),
    phone : $('.js-userInfo-phone').val(),
    workunit: $('.js-userInfo-company').val()
	};

    
    $.ajax({
        type: 'POST',
        url: '/api/saveUserInfo',
        data: data,
        dataType:"json",
        success: function (res) {
            
        },
        error:function(res){
            console.log(res)
        }
    })
	
}

//  取消提交用户信息
function cancel_userInfo() {
	
}
