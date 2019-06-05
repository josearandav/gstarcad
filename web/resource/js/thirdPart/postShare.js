/**
 * Created by Shan Tong on 2018/3/8 0008.
 */
    //TODO:上线时将连接地址改成正式；
    //    var pageUrl = location.href;
var pageUrl = "http://en.gstarcad.com/news/20171120";
var pageTtitle = "${seo.title}";
//    添加三方分享功能；
postShare("#sharecontainer", pageTtitle, pageUrl);

function postShare(container, title, url) {
    /* add share components dom elements */
    document.querySelector(container).innerHTML = '<div>' +
        '<h4 class="sharetips">Share this post: </h4> ' +
        '<div class="sharebtns">' +
        '<a class="share-facebook js-facebook" href="javascript:void(0)"><i class="shareicon fa-facebook"></i></a> ' +
        '<a class="share-twitter js-twitter" href="javascript:void(0)"><i class="shareicon fa-twitter"></i></a>' +
        '<a class="share-google-plus js-google-plus" href="javascript:void(0)"><i class="shareicon fa-google-plus"></i></a> ' +
        '<a class="share-pinterest js-pinterest" href="javascript:void(0)"><i class="shareicon fa-pinterest"></i></a> ' +
        '<a class="share-linkedin js-linkedin" href="javascript:void(0)"><i class="shareicon fa-linkedin"></i></a> ' +
        '</div> ' +
        '</div>';
    /* share base data */
    var baseArr = [
        {
            name: 'facebook',
            url: 'https://www.facebook.com/sharer/sharer.php?u='
        },
        {
            name: 'twitter',
            url: 'https://twitter.com/intent/tweet?text=' + title + ";url="
        },
        {
            name: 'google-plus',
            url: 'https://plus.google.com/share?url='
        },
        {
            name: 'pinterest',
            url: 'https://pinterest.com/pin/create/button/?url=&media=&description='
        },
        {
            name: 'linkedin',
            url: 'https://www.linkedin.com/cws/share?url='
        }
    ], fulUrl, tip; //fulUrl:  full share url; tip: do not show in the share window
    /* add DOM click share events */
    for (var i = 0; i < baseArr.length; i++) {
        (function (i) {
            $(".js-" + baseArr[i].name).click(function () {
                fulUrl = baseArr[i].url + url;
                tip = baseArr[i].name + "-share";
                window.open(fulUrl, tip, "width=490,height=530");
            });
        })(i);
    }
}
