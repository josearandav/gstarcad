/**
 * Created by Administrator on 2017/9/12 0012.
 */
//点击下载按钮
$(document).ready(function ($) {
    $(".downloadbtn").click(function (e) {
        e.stopPropagation();
        $(".hide").removeClass("active");
        $(".downloadbtn").removeClass("hover");
        $(this).find('.hide').addClass("active");
        $(this).addClass("hover");
    });

    $(document).bind("click", function (e) {
        $(".hide").removeClass("active");
        $(".downloadbtn").removeClass("hover");

    });

    $(".hide a").on("click", function (e) {
        e.stopPropagation();
        $(this).parent().removeClass("active");
        $(this).parent().parent().removeClass("hover");

    })

});

//add by fengzf 2018-03-20  start 
$(".js-downloadbtn a").click(function(){
	var softName = $(this).attr("targetVal");
	if(softName==""){
		return;
	}
	$.ajax({
        type: 'POST',
        url:baseUrl+'api/down/addDowns',
        data: {
        	softName:softName
        },
        dataType: 'json',
        success: function (res) {
        }
    });
	
});
//add by fengzf 2018-03-20  end 