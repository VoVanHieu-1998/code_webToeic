package com.dacnpm.toeic2020.Impl;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dacnpm.toeic2020.DAO.Part6QuestionResultDAO;
import com.dacnpm.toeic2020.Model.Part6ResultQuestion;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part6QuestionResultDAOImpl extends BaseDaoImpl<Part6ResultQuestion> implements Part6QuestionResultDAO<Part6ResultQuestion> {

}
