/**
 * Created by Administrator on 2017/9/22 0022.
 */
//导航定位
jQuery(function () {
    $ = jQuery;

    $("#templatemo_menu ul").singlePageNav({offset: $('#templatemo_menu').outerHeight()});

});

$(function () {
//滚动定位
    var casebanner = $(".casebanner").height() - 69;
    $(window).scroll(function () {
        var topScr = $(window).scrollTop();
        if (topScr > casebanner) {
            $(".downloadbox .tab").addClass("fixed");
        } else {
            $(".downloadbox .tab").removeClass("fixed");
        }
    })
});

/*下载-获取列表*/
var testDownloadCate = {
    rs: [
        {"category": "cad"},
        {"category": "engineer"},
        {"category": "manufacture"},
        {"category": "webgstar"},
        {"category": "others"}
    ]
};
var localDownloadID =1;
var webDownloadID =2;

//A1 浩辰CAD
download_getList(showCADList, 1, 100, "cad");

function showCADList(res) {
    var htmlStr = '<div class="top or">浩辰CAD</div>';
    var dow = "";
    for (var i = 0, len = res.data.length; i < len; i++) {
        //了解更多；
        var knowMore='';
        try{
            if(res.data[i].moreUrl){
                knowMore = '&nbsp;&nbsp;<a target="_blank" href="'+res.data[i].moreUrl+'">了解更多 ></a>';
            }else{
                knowMore='';
            }
        }catch (e){
            console.log(e);
        }

        dow = "cad_" + i;
        // if (i !== 0) {
        //     knowMore = ''
        // }
        htmlStr += '<div class="list"><div class="pic"><img alt="下载" src="' + res.data[i].downIcon + '"></div><ul><li><h2>' + res.data[i].softName + '</h2></li><li><p>' + res.data[i].content + '</p></li><li><span>' + res.data[i].runEnvir + knowMore + '</li></ul><dl><dt class="downloadbtn"><a  href="javascript:;">立即下载（32位）</a> <div class="hide"> <a onclick="countDownloadTimes(' + res.data[i].id + ',' + dow + ',' + localDownloadID + ')" href="' + res.data[i].local32Url + '" target="_blank" class="download"><i class="b1"></i>本地下载</a> <a onclick="countDownloadTimes(' + res.data[i].id + ',' + dow + ',' + webDownloadID + ')" href="' + res.data[i].baiduPan32Url + '" target="_blank" class="download"><i class="b2"></i>网盘下载</a> </div> </dt> <dt class="downloadbtn"><a href="javascript:;">立即下载（64位）</a> <div class="hide"> <a onclick="countDownloadTimes(' + res.data[i].id + ',' + dow + ',' + localDownloadID + ')" href="' + res.data[i].local64Url + '" target="_blank" class="download"><i class="b1"></i>本地下载</a> <a onclick="countDownloadTimes(' + res.data[i].id + ',' + dow + ',' + webDownloadID + ')" href="' + res.data[i].baiduPan64Url + '" target="_blank" class="download"><i class="b2"></i>网盘下载</a> </div> </dt> <dd >已下载：<span id="' + dow + '">' + res.data[i].downloads + '</span> 次</dd> </dl> </div><div class="cl"></div>'
    }
    document.getElementById("downloadCADWrap").innerHTML = htmlStr;
    showCADDownloadURL();
}

//A2 工程建设
   download_getList(showEngineerList, 1, 100, "engineer");

function showEngineerList(res) {
    var htmlStr = '<div class="top or">工程建设</div>';
    var num = 0;
    var down = "";
    var dowMore = "";
    for (var i = 0, len = res.data.length; i < len; i++) {

        if (res.data[i].isMore !== 0) {
            down = "mec_" + i;
            //了解更多产品；
            var knowMore='';
            try{
                if(res.data[i].moreUrl){
                    knowMore = '&nbsp;&nbsp;<a target="_blank" href="'+res.data[i].moreUrl+'">了解更多 ></a>';
                }else{
                    knowMore='';
                }
            }catch (e){
                console.log(e);
            }
            num++;
            htmlStr += '<div class="list"><div class="pic"><img alt="下载"  src="' + res.data[i].downIcon + '"></div><ul><li><h2>' + res.data[i].softName + '</h2></li><li><p>' + res.data[i].content + '</p></li><li><span>' + res.data[i].runEnvir + knowMore + '</li></ul><dl><dt class="downloadbtn"><a href="javascript:;">立即下载</a> <div class="hide"> <a onclick="countDownloadTimes(' + res.data[i].id + ',' + down + ',' + localDownloadID + ')" href="' + res.data[i].local32Url + '" target="_blank" class="download" ><i class="b1"></i>本地下载</a> <a onclick="countDownloadTimes(' + res.data[i].id + ',' + down + ',' + webDownloadID + ')" href="' + res.data[i].baiduPan32Url + '" target="_blank" class="download" ><i class="b2"></i>网盘下载</a> </div> </dt><dd>已下载：<span id="' + down + '">' + res.data[i].downloads + '</span> 次</dd> </dl> </div><div class="cl"></div>'
        }
    }
    htmlStr += '<div class="listmore"><a  href="javascript:;" class="bt showListMore">更多产品</a><div class="list-item"><table width="100%" border="0"><tbody><tr><td width="41%" align="left" valign="top">软件名称</td><td width="15%" align="center" valign="top"><span class="list-item" style="display: block;">软件大小</span></td> <td width="9%" align="center" valign="top"><span class="list-item" style="display: block;">发布时间</span></td><td width="22%" align="center" valign="top"><span class="list-item" style="display: block;">下载次数</span></td><td width="13%" align="center" valign="top"><span class="list-item" style="display: block;">单击下载</span></td></tr>';
    for (var j = 0, length = res.data.length; j < length; j++) {
        var size = res.data[j].softMSize + "M";
        if (size < 1) {
            size = res.data[j].softKbSize;
        }
        if (res.data[j].isMore === 0) {
            dowMore = "mecMore_" + j;
            var downloadHtml = '<div class="downloadbtn"><a href="javascript:;" class="nt">立即下载</a><div class="hide"><a href="' + res.data[j].local32Url + '" onclick="countDownloadTimes(' + res.data[j].id + ',' + dowMore + ',' + localDownloadID + ')" target="_blank" class="download" ><i class="b1"></i>本地下载</a><a href="' + res.data[j].baiduPan32Url + '" onclick="countDownloadTimes(' + res.data[j].id + ',' + dowMore + ',' + webDownloadID + ')" target="_blank" class="download" ><i class="b2"></i>网盘下载</a></div></div>';
            if (res.data[j].local32Url === "联系我们") {
                downloadHtml = '<div class="downloadbtn"><a href="javascript:;" class="btnctarc nt">联系我们</a></div>';
            }
            htmlStr += '<tr><td>' + res.data[j].softName + '</td><td align="center">' + size + '</td><td align="center">' + res.data[j].releaseTime.substring(0, 10) + '</td><td align="center" id="' + dowMore + '">' + res.data[j].downloads + '</td><td align="center">' + downloadHtml + '</td></tr>'
        }
    }
    htmlStr += '</tbody></table></div></div>';
    document.getElementById("engineerCADWrap").innerHTML = htmlStr;
//        显示更多产品
    $(".listmore .showListMore").click(function () {
        $(this).toggleClass("hover").parent().find(".list-item").toggleClass("block");
    });
    //点击联系我们；
    $(".btnctarc").click(function () {
        $(".ladaybox").show();
        $(".ladaybox").height($(document).height());
        $(".popover1").slideDown(200);
    });
    //关闭联系我们；
    $(".close").click(function () {
        $(".ladaybox").hide();
        $(".popover1").slideUp(200);
    });
    showArcDownloadURL();
}

//A3制造业
   download_getList(showManufactureList, 1, 100, "manufacture");

function showManufactureList(res) {
    var htmlStr = '<div class="top or">制造业</div>';
    var downloadHtml = '';
    var num = 0;
    var dow;
    var dowMore;
    for (var i = 0, len = res.data.length; i < len; i++) {
        dow = "mec_" + i;
        if (res.data[i].local32Url === "了解更多") {
            downloadHtml = '<dt><a target="_blank" href="http://plm.gstarcad.com/index.html" class="btnct nt">了解更多</a></dt>';
        }
        if (res.data[i].isMore !== 0) {
            //了解更多；
            var knowMore='';
            try{
                if(res.data[i].moreUrl){
                    knowMore = '&nbsp;&nbsp;<a target="_blank" href="'+res.data[i].moreUrl+'">了解更多 ></a>';
                }else{
                    knowMore='';
                }
            }catch (e){
                console.log(e);
            }
            num++;
            downloadHtml = '<dt class="downloadbtn"><a href="javascript:;">立即下载</a> <div class="hide"> <a onclick="countDownloadTimes(' + res.data[i].id + ',' + dow + ',' + localDownloadID + ')" href="' + res.data[i].local32Url + '" target="_blank" class="download" targetid="dow_01"><i class="b1"></i>本地下载</a> <a onclick="countDownloadTimes(' + res.data[i].id + ',' + dow + ',' + webDownloadID + ')" href="' + res.data[i].baiduPan32Url + '" target="_blank" class="download" targetid="dow_01"><i class="b2"></i>网盘下载</a> </div> </dt><dd>已下载：<span id="' + dow + '">' + res.data[i].downloads + '</span> 次</dd>  ';
            if (res.data[i].local32Url === "了解更多") {
                downloadHtml = '<dt><div class="downloadbtn"><a target="_blank" href="http://plm.gstarcad.com/index.html" >了解更多</a></dt></div>';
            }
            htmlStr += '<div class="list"><div class="pic"><img alt="下载"  src="' + res.data[i].downIcon + '"></div><ul><li><h2>' + res.data[i].softName + '</h2></li><li><p>' + res.data[i].content + '</p></li><li><span>' + res.data[i].runEnvir + knowMore + '</li></ul><dl>' + downloadHtml + '</dl></div><div class="cl"></div>'
        }
    }
    htmlStr += '<div class="listmore"><a href="javascript:;" class="bt mShowListMore">更多产品</a><div class="list-item"><table width="100%" border="0"><tbody><tr><td width="41%" align="left" valign="top">软件名称</td><td width="15%" align="center" valign="top"><span class="list-item" style="display: block;">软件大小</span></td> <td width="9%" align="center" valign="top"><span class="list-item" style="display: block;">发布时间</span></td><td width="22%" align="center" valign="top"><span class="list-item" style="display: block;">下载次数</span></td><td width="13%" align="center" valign="top"><span class="list-item" style="display: block;">单击下载</span></td></tr>';

//        更多里面显示；
    for (var j = 0, length = res.data.length; j < length; j++) {
        dowMore = "mecMore_" + j;
        var size = res.data[j].softMSize + "M";
        var times = res.data[j].downloads;
        if (size === "0M") {
            size = " _ ";
            times = " _ ";
        }
        if (size < 1) {
            size = res.data[j].softKbSize;
        }
        if (res.data[j].isMore === 0) {
            var contactHtml = '<div class="downloadbtn"><a href="javascript:;" class="nt">立即下载</a><div class="hide"><a href="' + res.data[j].local32Url + '" onclick="countDownloadTimes(' + res.data[j].id + ',' + dowMore + ',' + localDownloadID + ')" target="_blank" class="download" targetid="dow_15"><i class="b1"></i>本地下载</a><a href="' + res.data[j].baiduPan32Url + '" onclick="countDownloadTimes(' + res.data[j].id + ',' + dowMore + ',' + webDownloadID + ')" target="_blank" class="download" targetid="dow_15"><i class="b2"></i>网盘下载</a></div></div>';
            if (res.data[j].local32Url === "了解更多") {
                contactHtml = '<dt><div class="downloadbtn"><a target="_blank" href="http://plm.gstarcad.com/index.html" class="nt">了解更多</a></dt></div>';
            }

            if (res.data[j].local32Url === "联系我们") {
                contactHtml = '<div class="downloadbtn"><a href="javascript:;" class="btncteng nt">联系我们</a></div>';
            }
            htmlStr += '<tr><td>' + res.data[j].softName + '</td><td align="center">' + size + '</td><td align="center">' + res.data[j].releaseTime.substring(0, 10) + '</td><td align="center" id="' + dow + '">' + times + '</td><td align="center">' + contactHtml + '</td></tr>'
        }
    }
    htmlStr += '</tbody></table></div></div>';
    document.getElementById("manufactureWrap").innerHTML = htmlStr;
//        显示更多产品
    $(".listmore .mShowListMore").click(function () {
        $(this).toggleClass("hover").parent().find(".list-item").toggleClass("block");
    });
    //点击联系我们；
    $(".btncteng").click(function () {
        $(".ladaybox").show();
        $(".ladaybox").height($(document).height());
        $(".popover1").slideDown(200);
    });
    //关闭联系我们；
    $(".close").click(function () {
        $(".ladaybox").hide();
        $(".popover1").slideUp(200);
    });
    showMecDownloadURL();
}

//A4 浩辰云图 电脑版
   download_getList(showWebGstarList, 1, 100, "webgstar");
function showWebGstarList(res) {
    var htmlStr = '';
    for (var i = 0, len = res.data.length; i < len; i++) {
        htmlStr += '<div class="pic"><img alt="下载"  src="/resource/images/download_icon_34.jpg"></div><ul> <li><h2>' + res.data[i].softName + '</h2></li><li><p>' + res.data[i].content + '</p></li> <li><span>' + res.data[i].runEnvir + '</span>&nbsp;&nbsp;<a href="http://yun.gstarcad.com/windows/" target="_blank">了解更多 &gt;</a></li></ul><dl><dt class="downloadbtn"><a  href="javascript:;">立即下载（32位）</a> <div class="hide"> <a onclick="countDownloadTimes(' + res.data[i].id + ',' + localDownloadID + ')" href="' + res.data[i].local32Url + '" target="_blank" class="download"><i class="b1"></i>本地下载</a> <a onclick="countDownloadTimes(' + res.data[i].id + ',' + webDownloadID + ')" href="' + res.data[i].baiduPan32Url + '" target="_blank" class="download"><i class="b2"></i>网盘下载</a> </div> </dt> <dt class="downloadbtn"><a href="javascript:;">立即下载（64位）</a> <div class="hide"> <a onclick="countDownloadTimes(' + res.data[i].id + ',' + localDownloadID + ')" href="' + res.data[i].local64Url + '" target="_blank" class="download"><i class="b1"></i>本地下载</a> <a onclick="countDownloadTimes(' + res.data[i].id + ',' + webDownloadID + ')" href="' + res.data[i].baiduPan64Url + '" target="_blank" class="download"><i class="b2"></i>网盘下载</a> </div> </dt></dl> </div><div class="cl"></div>'
    }
    document.getElementById("webgstarWrap").innerHTML = htmlStr;
    showCADDownloadURL();
}

//A5 其它工具
   download_getList(showOthersList, 1, 100, "others");

function showOthersList(res) {
    var htmlStr = '';
    var dow;
    htmlStr += '<div class="list-item" style="display: block;"><table width="100%" border="0" style="border: 0;"><tbody><tr><td width="41%" align="left" valign="top">软件名称</td><td width="15%" align="center" valign="top"><span class="list-item" style="display: block;">软件大小</span></td><td width="9%" align="center" valign="top"><span class="list-item" style="display: block;">发布时间</span></td><td width="22%" align="center" valign="top"><span class="list-item" style="display: block;">下载次数</span></td><td width="13%" align="center" valign="top"><span class="list-item" style="display: block;">单击下载</span></td></tr>';

    for (var j = 0, length = res.data.length; j < length; j++) {
        dow = "other_" + j;
        var size = res.data[j].softMSize + "M";
        if (size < 1) {
            size = res.data[j].softKbSize;
        }
        htmlStr += '<tr><td>' + res.data[j].softName + '</td><td align="center">' + size + '</td><td align="center">' + res.data[j].releaseTime.substring(0, 10) + '</td><td align="center" id="' + dow + '">' + res.data[j].downloads + '</td><td align="center"><div class="downloadbtn"><a href="javascript:;" class="nt">立即下载</a><div class="hide"><a href="' + res.data[j].local32Url + '" onclick="countDownloadTimes(' + res.data[j].id + ',' + dow + ',' + localDownloadID + ')" target="_blank" class="download" targetid="dow_15"><i class="b1"></i>本地下载</a><a href="' + res.data[j].baiduPan32Url + '" onclick="countDownloadTimes(' + res.data[j].id + ',' + dow + ',' + webDownloadID + ')" target="_blank" class="download" ><i class="b2"></i>网盘下载</a></div></div></td></tr>'

    }
    htmlStr += '</tbody></table></div></div>';
    document.getElementById("listmoreWrap").innerHTML = htmlStr;
    showOtherDownloadURL();
}

//统计下载次数；
function countDownloadTimes(softId, downId,type) {
    console.log(type);
    var typeID;
    try {
        var num = parseInt(downId.innerText);
        typeID = parseInt(type);
        downId.innerText = num + 1;
    } catch (e) {
        console.log(e);
    }

    $.ajax({
        type: 'POST',
        url: "/api/down/addDowns",
        dataType: 'json',
        data: {id: softId,type:typeID},
        success: function (res) {

        },
        error: function (res) {
            console.log(res.msg);
        }

    });
}

function download_getList(callback, pageNumber, pageSize, category, keywords, isMore, isSort) {
    var data = {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "category": category,
        "keywords": keywords,
        "isMore": isMore,
        "isSort": 1
    };
    $.ajax({
        type: 'POST',
        url: "/api/down/list",
        dataType: 'json',
        data: data,
        success: function (res) {
            callback(res);
        },
        error: function (res) {
            console.log(res.msg);
        }
    });
}

   (function () {
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

       });
   })();

function showCADDownloadURL() {
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

    });
}
function showArcDownloadURL() {
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

    });
}
function showMecDownloadURL() {
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

    });
}
function showOtherDownloadURL() {
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

    });
}