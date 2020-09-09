package com.dacnpm.toeic2020.Controller.Rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dacnpm.toeic2020.Service.UserService;



@Controller
@RequestMapping("api/")
public class APILoginController {

	@Autowired
	UserService userService;

	@PostMapping("checkUser")
	@ResponseBody
	public String checkUserName(@RequestParam String username) {

		boolean check = this.userService.checkUser(username);
		if (!username.isEmpty() || username != null) {
			if (check == true) {
				return "true";
			}

		}
		return "false";

	}

}

