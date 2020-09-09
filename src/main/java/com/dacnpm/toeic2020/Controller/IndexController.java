package com.dacnpm.toeic2020.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dacnpm.toeic2020.Model.User;
import com.dacnpm.toeic2020.Utils.Constant;

@Controller
public class IndexController {

	@RequestMapping(value= {"/home","/","/index"})
	
	public String index(ModelMap map,HttpSession session) {
		if(session.getAttribute(Constant.USER_INFO) != null) {
			User user=(User) session.getAttribute(Constant.USER_INFO);
			map.addAttribute("user", user);
			
		}
		return "home";
	}
	
}
