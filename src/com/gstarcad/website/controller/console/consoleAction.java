package com.gstarcad.website.controller.console;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @ClassName: IndexAction.java
 * @Description:
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月19日  上午10:00:46
 */
@Controller
@RequestMapping(value = "/console")
public class consoleAction extends BaseAction {

    @RequestMapping
    public String console() {
        return "/page/console/index";
    }

//    资讯页面
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public String consoleInfo() {
        return "/page/console/views/information/info";
    }
//    支持页面
    @RequestMapping(value = "/support", method = RequestMethod.GET)
    public String consoleSupport() {
        return "/page/console/views/support/addSupport";
    }

    /* 根据菜单信息，返回不同的页面数据 */
    @RequestMapping(value = "/loadContent", method = RequestMethod.POST)
    public String loadContentByMenu(String menu) {
        String viewPath = "/page/console/views/";

        if (StringUtils.isNotEmpty(menu)) {
            return viewPath + menu;
        } else {
            return "/page/console/index";
        }
    }
}
