package com.kpfu.itis.gasstation.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Rustem.
 */
@Controller
public class AccessDeniedController {
    @RequestMapping(value = "/access-denied", method = RequestMethod.GET)
    public String accessDenied(ModelMap model) {
        return "access_denied";
    }
}
