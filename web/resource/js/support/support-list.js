//add by fengzf 2017-09-12 start
// if($(".curr").attr("targetId")!=3 && $(".curr").attr("targetId")!=4){
// 	$(".search_so").hide();
// }

//点击切换分类
function changeCategory(obj) {
    $(".curr").removeClass("curr");
    $(obj).addClass("curr");

	if($(obj).attr("targetId")==3 || $(obj).attr("targetId")==4){
		$(".bottom_cor").show();
		$("#versionList").hide();

		if($(obj).attr("targetId")==3 || $(obj).attr("targetId")==4 ){
			$(".search_so").show();
		}else{
			$(".search_so").hide();
		}
    }else if($(obj).attr("targetId")==1 || $(obj).attr("targetId")==2){
    	$(".bottom_cor").show();
    	$("#versionList").show();
    	$(".search_so").hide();
    }else{
    	$(".bottom_cor").hide();
    	$("#ajaxList").removeClass("bottom");
    	$("#ajaxList").removeClass("con small");
    	$("#ajaxList").addClass("faqboxlist");
    }

	if($(obj).attr("targetId")==4){
    	$(".s_support").removeClass("s_support");
    	$("#contentAjax").addClass("known_qiye");
    	$("#ajaxList").removeClass("bottom");
    	$("#ajaxList").addClass("con small");
    }else{
    	$(".known_qiye").removeClass("known_qiye");
    	$("#contentAjax").addClass("s_support");
    	$("#ajaxList").removeClass("con small");
    	$("#ajaxList").addClass("bottom");
    }
    $("#mianbaoxie").html("<em class='c3'></em>"+$(obj).text());
    $("#keywords").val("");
    ajaxList(1);
}


//首次加载

if($(".curr").attr("targetId")==3 || $(".curr").attr("targetId")==4){
	$(".bottom_cor").show();
	$("#versionList").hide();
}
ajaxList(1);
//
// $(".so").click(function(){
// 	ajaxList(1)
// });

function ajaxList(page) {
    //分栏id
    var columnType = $("input[name='columnType']").val();
    var categoryName=$("#categoryName").attr("targetId");
    var videoType=$("#videoType").attr("targetId");
    try{
        if(categoryName.indexOf("FastView")>0){
            $('#versionList').hide();
        }else{
            $('#versionList').show();
        }
    }catch(e){

    }

    var versionId = $("#versionId").attr("targetid");
    var typeId = $("#typeId").attr("targetid");//TODO 需要整合

    /* TODO: 需要验证*/
    document.body.scrollTop=118;

    $.ajax({
        type: 'POST',
        url: baseUrl+'support/ajaxList',
        data: {
            page: page,
            pageSize: 10,
            keywords:"",
            categoryName:categoryName,
            versionId:versionId,
            columnType:columnType,
            videoType:videoType,
            isFromSearch:false
        },
        success: function (res) {
            $("#ajaxList").html(res);
        }
    });
}




//add by fengzf 2017-09-12 end