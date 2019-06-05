ajaxList(1);//首次加载
//add by fengzf 2017-09-20 start

//点击搜索按钮；
searchAjax();
/* {*/
    //点击搜索按钮
	function searchAjax(){
		ajaxList(1)
	}
        
    //键盘事件；
    document.onkeydown = function (event) {
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if (e && e.keyCode == 13) { // enter 键
            ajaxList(1)
        }
    };
/*}*/

function ajaxList(page) {
    $(document).scrollTop("0");
    //分栏id
    var columnType = $(".select_option .selected").attr("targetid"); //栏目分类
    var keywords=$(".inp_srh").val();  //搜索关键词
    $.ajax({
        type: 'POST',
        url:'/support/ajaxList',
        data: {
            page: page,
            pageSize: 10,
            keywords:keywords,
            categoryName:"",
            versionId:"",
            columnType:columnType,
            isFromSearch:true
        },
        success: function (res) {
            $("#ajaxList").html(res);
            $("#resultNum").html();
        }
    });
}
//add by fengzf 2017-09-20 end
