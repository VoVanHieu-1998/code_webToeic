package com.dacnpm.toeic2020.DAO;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.dacnpm.toeic2020.Model.Pagging;




public interface BaseDAO<E> {
	public List<E> findAll();
	
	public E findById(Class<E> e, Serializable id);
	
	public List<E> findByProperty(String property , Object value);
	public int save(E instance);
	public void update(E instance);
	public void delete(E instance);
	
	public List<E> getList(String queryStr,Map<String, Object> queryParams,Pagging pagging);

}
