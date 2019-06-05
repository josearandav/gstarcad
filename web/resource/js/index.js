/**
 * Created by Administrator on 2018/2/7 0007.
 */
//move up to see
$(function () {
    $('.cspan2').hover(function () {
        $('.text', this).stop().animate({
            height: '100%'
        });

        $(this).find("h2").stop().animate({
            marginTop: '60px'
        });
    }, function () {
        $('.text', this).stop().animate({
            height: '72px'
        });
        $(this).find("h2").stop().animate({
            marginTop: '0px'
        });
    });
});
//left and right
$(function () {
    $('.design .col').hover(function () {
        $(this).addClass("hover");
    }, function () {
        $(this).removeClass("hover");
    });
});

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
//Background shaking
$(function () {
    var positionX = 0;
    var positionY = 0;

    $('.news .con').mousemove(function (e) {
        var x = e.clientX, y = e.clientY;
        if (positionX === 0 && positionY === 0) {
            positionX = x;
            positionY = y;
        }
        if (x > positionX && y < positionY) {
            $('.pic').stop().animate({
                'background-positionX': 5,
                'background-positionY': 10
            }, '800', "easeOutCubic");

            positionX = x;
            positionY = y;
        } else if (x > positionX && y > positionY) {
            $('.pic').stop().animate({
                'background-positionX': -5,
                'background-positionY': 5
            }, '800', "easeOutCubic");

            positionX = x;
            positionY = y;
        } else if (x < positionX && y < positionY) {
            $('.pic').stop().animate({
                'background-positionX': 5,
                'background-positionY': 10
            }, '800', "easeOutCubic");

            positionX = x;
            positionY = y;
        } else if (x < positionX && y > positionY) {
            $('.pic').stop().animate({
                'background-positionX': -5,
                'background-positionY': 5
            }, '800', "easeOutCubic");

            positionX = x;
            positionY = y;
        }

    })

    $.extend($.easing, {
        easeOutBack: function (x, t, b, c, d, s) {
            if (s == undefined) s = 1.70158;
            return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b;
        },
        easeOutCubic: function (x, t, b, c, d) {
            return c * ((t = t / d - 1) * t * t + 1) + b;
        }
    });
});
$(function () {
    $('.news .list').hover(function () {
        $(this).find(".bluebg").addClass("hover");
        $(this).find(".bpic").addClass("hover");

    }, function () {
        $(this).find(".bluebg").removeClass("hover");
        $(this).find(".bpic").removeClass("hover");

    });
});