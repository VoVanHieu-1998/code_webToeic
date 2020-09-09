package com.dacnpm.toeic2020.Impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dacnpm.toeic2020.DAO.BaseDAO;
import com.dacnpm.toeic2020.Model.Pagging;



@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
@Transactional
public class BaseDaoImpl<E> implements BaseDAO<E>{
	

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<E> findAll() {
		
		StringBuilder queryString = new StringBuilder("");
		queryString.append(" from ").append(getGenericName()).append(" as model where model.activeFlag=1");
	
		return sessionFactory.getCurrentSession().createQuery(queryString.toString()).list();
	}

	@Override
	public E findById(Class<E> e, Serializable id) {
		
		return sessionFactory.getCurrentSession().get(e, id);
	}

	@Override
	public List<E> findByProperty(String property, Object value) {
		
		StringBuilder queryString = new StringBuilder();
		queryString.append(" from ").append(getGenericName()).append(" as model where model.activeFlag=1 and model.").append(property).append("=?");
	
		Query<E> query = sessionFactory.getCurrentSession().createQuery(queryString.toString());
		query.setParameter(0, value);
		
		if(query.getResultList().size() > 0) {
			return query.getResultList();
		}
		else {
			return null;
		}
		
	}

		@Override
	public int save(E instance) {
	
		int id = (int) this.sessionFactory.getCurrentSession().save(instance);
		if (id > 0) {
			return id;
		} else {
			return -1;
		}
		
	}

	@Override
	public void update(E instance) {
		this.sessionFactory.getCurrentSession().update(instance);
	}
	
	

	@Override
	public void delete(E instance) {
		this.sessionFactory.getCurrentSession().update(instance);
		
	}

	@Override
	public List<E> getList(String queryStr, Map<String, Object> queryParams, Pagging pagging) {
	
		StringBuilder productInfoQuery = new StringBuilder("");
		StringBuilder countRecordQuery = new StringBuilder();
		productInfoQuery.append(" from ").append(getGenericName()).append(" as model where model.activeFlag=1");
		countRecordQuery.append(" from ").append(getGenericName()).append(" as model where model.activeFlag=1");
		
		if(!queryStr.isEmpty() && queryStr != null) {
			productInfoQuery.append(queryStr);
			countRecordQuery.append(queryStr);
		}
		
		Query<E> qProduct = this.sessionFactory.getCurrentSession().createQuery(productInfoQuery.toString());
		Query<E> qCount = this.sessionFactory.getCurrentSession().createQuery(countRecordQuery.toString());
		
		// set parameter
		if(!queryParams.isEmpty() && queryParams != null) {
			for(String key : queryParams.keySet()) {
				qProduct.setParameter(key, queryParams.get(key));
				qCount.setParameter(key, queryParams.get(key));
			}
		}
		
		// phân trang
		if(pagging != null) {
			qProduct.setFirstResult(pagging.getOffset());
			qProduct.setMaxResults(pagging.getRecordPerPage());
			
			long totalRecord = qCount.list().size();
			pagging.setTotalRecords(totalRecord);
		}
			
		return qProduct.list();
	}
	
	public String getGenericName() {
		String s = getClass().getGenericSuperclass().toString();
		Pattern pattern = Pattern.compile("\\<(.*?)\\>");
		Matcher m = pattern.matcher(s);
		String generic="null";
		if(m.find()) {    
			generic = m.group(1);
		}
		return generic;
	}

	
	
}
