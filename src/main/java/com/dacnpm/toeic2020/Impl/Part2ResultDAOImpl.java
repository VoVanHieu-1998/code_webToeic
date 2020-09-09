package com.dacnpm.toeic2020.Impl;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dacnpm.toeic2020.DAO.Part2ResultDAO;
import com.dacnpm.toeic2020.Model.Part2Result;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part2ResultDAOImpl extends BaseDaoImpl<Part2Result> implements Part2ResultDAO<Part2Result> {

	@Override
	public int countCorrectAnswerPart2(int idResult) {
		String sql =" from Part2Result as model where model.activeFlag=1 and model.result_ques=5 and model.result_Part2Result.id =?";
		Query<Part2Result> query = this.sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter(0, idResult);
		return query.getResultList().size();
	}

}
