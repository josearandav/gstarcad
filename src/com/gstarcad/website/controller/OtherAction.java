package com.gstarcad.website.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gstarcad.website.controller.console.BaseAction;

@Controller
public class OtherAction extends BaseAction {

    /**
     * about
     *
     * @return
     */
    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("About"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/other/about";
    }

    /**
     * map
     *
     * @return
     */
    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String map(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("Map"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/other/map";
    }

    /**
     * privacy
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/privacy", method = RequestMethod.GET)
    public String privacy(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("Privacy"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/other/privacy";
    }

    /**
     * Policy
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/policy", method = RequestMethod.GET)
    public String policy(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("Licensing_Policy"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/other/policy";
    }

    /**
     * springSale2018
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/project/2018spring", method = RequestMethod.GET)
    public String springSale(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("Spring_Sale"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/activities/springsale2018";
    }

    /**
     * privacy-policy
     * app 使用
     * @param model
     * @return
     */
    @RequestMapping(value = "/About/privacy-policy",method = RequestMethod.GET)
    public String privacys(Model model){
        return "/page/other/privacypolicy";
    }

    /**
     * items
     * app 使用
     * @param model
     * @return
     */
    @RequestMapping(value = "/About/Terms-of-use",method = RequestMethod.GET)
    public String items(Model model){
        return "/page/other/items";
    }

}
