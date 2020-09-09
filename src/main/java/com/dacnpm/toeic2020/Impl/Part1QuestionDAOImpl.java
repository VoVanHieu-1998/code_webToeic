package com.dacnpm.toeic2020.Impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.query.Query;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.dacnpm.toeic2020.DAO.Part1QuestionDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part1;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part1QuestionDAOImpl extends BaseDaoImpl<Part1> implements Part1QuestionDAO<Part1> {

	@Override
	public List<Part1> getListPart1(String queryStr, Map<String, Object> queryParams, Pagging pagging) {
		StringBuilder productInfoQuery = new StringBuilder("");
		StringBuilder countRecordQuery = new StringBuilder();
		productInfoQuery.append(" from ").append(getGenericName()).append(" as model where model.activeFlag=1 and type=0");
		countRecordQuery.append(" from ").append(getGenericName()).append(" as model where model.activeFlag=1 and type=0");
		
		if(!queryStr.isEmpty() && queryStr != null) {
			productInfoQuery.append(queryStr);
			countRecordQuery.append(queryStr);
		}
		
		Query<Part1> qProduct = this.sessionFactory.getCurrentSession().createQuery(productInfoQuery.toString());
		Query<Part1> qCount = this.sessionFactory.getCurrentSession().createQuery(countRecordQuery.toString());
		
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

}
