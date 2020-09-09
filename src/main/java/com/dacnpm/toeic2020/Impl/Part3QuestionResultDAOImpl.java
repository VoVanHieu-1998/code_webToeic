package com.dacnpm.toeic2020.Impl;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dacnpm.toeic2020.DAO.Part3QuestionResultDAO;
import com.dacnpm.toeic2020.Model.Part3ResultQuestion;
@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part3QuestionResultDAOImpl extends BaseDaoImpl<Part3ResultQuestion> implements Part3QuestionResultDAO<Part3ResultQuestion> {

}
