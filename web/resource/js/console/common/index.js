function Index() {
    this.url = '/console/loadContent'
}
Index.prototype.init = function () {
    /* 点击menu 加载不同页面 */
    var that = this;
    $('.js-menu-ul').delegate("a", "click", function () {
        var viewHref = $(this).attr("data-title");
        that.loadContent(viewHref)
    });
};

Index.prototype.loadContent = function (menu) {
    $.ajax({
        type: 'POST',
        url: this.url,
        data: {
            'menu': menu,
            ts: new Date().getTime()
        },
        success: function (res) {
            $("#dataView").html(res);
        }
    });
};


var index = new Index();
index.init();
