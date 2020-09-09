package com.dacnpm.toeic2020.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dacnpm.toeic2020.DAO.IVocabularyDAO;
import com.dacnpm.toeic2020.Impl.BaseDaoImpl;
import com.dacnpm.toeic2020.Model.Vocabularyline;
@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Vocabularyimpl extends BaseDaoImpl<Vocabularyline> implements IVocabularyDAO<Vocabularyline> {
	@Autowired
	SessionFactory sessionFactory;

	@Override

	public List<Vocabularyline> layDanhSachTuVungLimit(int tuvungbatdau) {
		Session session =sessionFactory.getCurrentSession();
		String query="from vocabularyline";
		List<Vocabularyline> danhsachtuvung= session.createQuery(query).setFirstResult(tuvungbatdau).setMaxResults(21).getResultList();
		return danhsachtuvung;
	}

	@Override
	
	public Vocabularyline layDanhSachTuVungTheoMa(int idvocabulary) {
		Session session= sessionFactory.getCurrentSession();
		Vocabularyline vocabularyline =(Vocabularyline)session.createQuery("from vocabularyline vl where vl.idvocabulary="+idvocabulary).getSingleResult();
		return vocabularyline;
	}
	
}
