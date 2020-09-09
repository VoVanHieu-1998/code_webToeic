package com.dacnpm.toeic2020.Controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dacnpm.toeic2020.Model.Menu;
import com.dacnpm.toeic2020.Model.Role;
import com.dacnpm.toeic2020.Model.User;
import com.dacnpm.toeic2020.Service.UserService;
import com.dacnpm.toeic2020.Utils.Constant;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;

	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("loginForm", new User());
		return "login";
	}

	@PostMapping("/processLogin")
	public String processLogin(Model model, @ModelAttribute("loginForm") User u, HttpSession session) {

		User user = userService.findByProperty("username", u.getUsername()).get(0);
		Role role = user.getRoles().iterator().next();
		
		
		List<Menu> menuList = new ArrayList<>();
		List<Menu> menuChildList = new ArrayList<>();

		// loc ra dau la menu cha , dau la nhung menu con
		for (Menu menu : role.getMenus()) {

			// list menu parent
			if (menu.getParent_Id() == 0 && menu.getActiveFlag() == 1 && menu.getOrder_Index() != -1) {
				menu.setMenuId(menu.getUrl().replace("/", "") + "Id");
				menuList.add(menu);

			}

			// list menu con
			else if (menu.getParent_Id() != 0 && menu.getActiveFlag() == 1 && menu.getOrder_Index() != -1) {
				menu.setMenuId(menu.getUrl().replace("/", "") + "Id");
				menuChildList.add(menu);
			}
		}

		// add menu con vao menu cha cua no
		for (Menu menu : menuList) {
			List<Menu> childMenu = new ArrayList<>();

			for (Menu menuChild : menuChildList) {
				if (menuChild.getParent_Id() == menu.getId()) {
					childMenu.add(menuChild);
				}
			}
			menu.setChild(childMenu);
		}

		// sort menu
		sortMenu(menuList);
		for (Menu menu : menuList) {
			sortMenu(menu.getChild());
		}

		session.setAttribute(Constant.MENU_SESSION, menuList);
		session.setAttribute(Constant.USER_INFO, user);

		if (session.getAttribute(Constant.MSG_LOGINBACKEXAM) != null) {
			
			String s = (String) session.getAttribute(Constant.MSG_LOGINBACKEXAM);
			session.removeAttribute(Constant.MSG_LOGINBACKEXAM);
			return s;
			
		}
		
		if(role.getRoleName().equalsIgnoreCase("ROLE_ADMIN")) {
			return "redirect:/admin/home";
		}
		
		if(role.getRoleName().equalsIgnoreCase("ROLE_CLIENT")) {
			return "redirect:/";
		}
		return "redirect:/access-denied";
	}

	@GetMapping("/access-denied")
	public String accessDenied() {
		return "access-denied";
	}

	public void sortMenu(List<Menu> menus) {
		Collections.sort(menus, new Comparator<Menu>() {

			@Override
			public int compare(Menu o1, Menu o2) {

				return o1.getOrder_Index() - o2.getOrder_Index();
			}

		});
	}
}
