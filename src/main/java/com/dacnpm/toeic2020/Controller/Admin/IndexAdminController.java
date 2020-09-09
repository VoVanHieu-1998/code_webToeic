package com.dacnpm.toeic2020.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class IndexAdminController {

	@RequestMapping("/home")
	public String index(ModelAndView modelAndView) {
		
		return "admin/index";
	}
}
