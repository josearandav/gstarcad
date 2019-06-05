/**
 * Created by Administrator on 2018/2/2 0002.
 */
/**
 * 四、SEO管理，增加SEO
 */
var SEOAddEditURL = "/api/seo/save";

//自动添加SEO分类；
autoFillCateData("SEOaddCategory", "noAll");

/*SEO-添加/编辑-AJAX*/
function SEO_submit_ajax() {
    var cagegoryId = $("#SEOaddCategory").find("option:selected").attr("data-id");
    var id= window.location.hash.substring(1);
    var data = {
        "id": id,
        "cagegoryId": cagegoryId,
        "pageName": $("#pageName").val(),
        "title": $("#title").val(),
        "keywords": $("#keywords").val(),
        "description": $("#description").val()
    };
    if (!cagegoryId || !$("#pageName").val() || !$("#title").val() || !$("#keywords").val() || !$("#description").val()) {
        alert("请填写完整信息！");
        return
    }
    $.ajax({
        type: 'POST',
        url: SEOAddEditURL,
        dataType: 'json',
        data: data,
        success: function (res) {
            if (res.state) {
                layer.msg('提交成功!', {icon: 1, time: 1000});
                index.loadContent('SEO/SEO');//添加页面；
                location.hash="";
            } else {
                alert(res.message);
                index.loadContent('SEO/SEO');//添加页面；
            }
        },
        error: function (res) {
            console.log(res.msg);
        }

    });

}
