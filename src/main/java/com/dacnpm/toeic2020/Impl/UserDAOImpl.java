package com.dacnpm.toeic2020.Impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.query.Query;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.dacnpm.toeic2020.DAO.UserDAO;
import com.dacnpm.toeic2020.Model.User;



@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
@Transactional
public class UserDAOImpl extends BaseDaoImpl<User> implements UserDAO<User>  {

	@Override
	public int Login(String username, String password) {
		String sql = "from User where username=:username and password=:password";
		Query query= sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("username", username);
		query.setParameter("password", password);
		
		List<User> list = query.list();
		if(list.size() ==1) {
			return list.get(0).getId();
		}
		else {
			return -1;
		}
		
	}

	@Override
	public boolean checkUserName(String username) {
		StringBuilder queryString = new StringBuilder();
		queryString.append("from User as model where model.username=:username");
		Query<User> query = sessionFactory.getCurrentSession().createQuery(queryString.toString());
		query.setParameter("username", username);
		if(query.getResultList().size()>0) {
			return true;
		}
		return false;
	}


}
