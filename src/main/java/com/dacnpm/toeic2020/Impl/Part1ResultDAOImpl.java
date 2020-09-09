package com.dacnpm.toeic2020.Impl;

import org.hibernate.query.Query;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dacnpm.toeic2020.DAO.Part1ResutDAO;
import com.dacnpm.toeic2020.Model.Part1Result;
import com.dacnpm.toeic2020.Model.Part2Result;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part1ResultDAOImpl extends BaseDaoImpl<Part1Result> implements Part1ResutDAO<Part1Result> {

	@Override
	public int countCorrectAnswerPart1(int idResult) {
		String sql =" from Part1Result as model where model.activeFlag=1 and model.result_ques=5 and model.result_Part1Result.id =?";
		Query<Part2Result> query = this.sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter(0, idResult);
		return query.getResultList().size();
	}

	
}
