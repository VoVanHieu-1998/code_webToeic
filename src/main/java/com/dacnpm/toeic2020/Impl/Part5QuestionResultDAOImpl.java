package com.dacnpm.toeic2020.Impl;

import javax.transaction.Transactional;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.dacnpm.toeic2020.DAO.Part5ResultDAO;
import com.dacnpm.toeic2020.Model.Part5QuestionResult;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part5QuestionResultDAOImpl extends BaseDaoImpl<Part5QuestionResult> implements Part5ResultDAO<Part5QuestionResult> {

	
}
