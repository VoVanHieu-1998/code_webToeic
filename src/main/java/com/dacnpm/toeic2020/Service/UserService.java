package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dacnpm.toeic2020.DAO.UserDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.User;
import com.dacnpm.toeic2020.Utils.HashingPassword;



@Service
public class UserService {

	
	@Autowired
	private UserDAO<User> userDAO;
	
	public List<User> findByProperty(String property, Object value) {
		
		return userDAO.findByProperty(property, value);

	}

	public User findById(int id) {
		return userDAO.findById(User.class, id);
	}

	public int saveUser(User user) throws Exception {
		user.setCreateDate(new Date());
		user.setUpdateDate(new Date());
		user.setActiveFlag(1);
		user.setPassword(HashingPassword.encrypt(user.getPassword()));		
		return userDAO.save(user);
	}
	
	public void updateUser(User user) throws Exception{
		user.setUpdateDate(new Date());
		user.setActiveFlag(1);

		this.userDAO.update(user);
	}

	public void deleteUser(User user) throws Exception{
		user.setUpdateDate(new Date());
		user.setActiveFlag(0);
		this.userDAO.update(user);
	}
	
	public int checkLogin(User user) {
		return userDAO.Login(user.getUsername(), user.getPassword());
	}
	
	public boolean checkUser(String username) {
		return this.userDAO.checkUserName(username);
	}
	
	public List<User> getAll(User user,Pagging pagging){
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if(user != null) {
			
			if(user.getName() != null && !StringUtils.isEmpty(user.getName())) {
				sb.append(" and model.name like :name");
				mapParams.put("name", "%"+user.getName()+"%");
			}
			if(user.getUsername()!= null && !StringUtils.isEmpty(user.getUsername())) {
				sb.append(" and model.username like :username");
				mapParams.put("username", "%"+user.getUsername()+"%");
			}
			
		
		}
		
		return this.userDAO.getList(sb.toString(), mapParams, pagging);
	}
}