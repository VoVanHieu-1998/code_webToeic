package com.dacnpm.toeic2020.Scurity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.dacnpm.toeic2020.Model.Menu;
import com.dacnpm.toeic2020.Model.Role;
import com.dacnpm.toeic2020.Model.User;
import com.dacnpm.toeic2020.Utils.Constant;



public class FilterSystem implements HandlerInterceptor {
	

// khi 1 url dc goi , thi no di qua ham nay truoc, roi sau do ms di qua cac Controller
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		User users = (User) request.getSession().getAttribute(Constant.USER_INFO);

		if (users == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		if (users != null) {
			String url = request.getServletPath();
			// neu khog co quyen
			if (!this.hasPermission(url, users)) {
				response.sendRedirect(request.getContextPath() + "/access-denied");
				return false;
			}

		}

		return true;
	}

	private boolean hasPermission(String url, User users) {
		
		if (url.contains("/access-denied") ) {
			return true;
		}
		
		Role role = users.getRoles().iterator().next();
		for (Menu menu : role.getMenus()) {
			if (url.contains(menu.getUrl())) {
				return true;
			}
		}
		return false;
	}

// sau khi controller tra ve thi se di qua post handle
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
}
