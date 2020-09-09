package com.dacnpm.toeic2020.Impl;

import javax.transaction.Transactional;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.dacnpm.toeic2020.DAO.Part7QuestionResultDAO;
import com.dacnpm.toeic2020.Model.Part7ReadingQuestionResult;
@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part7QuestionResultDAOImpl extends BaseDaoImpl<Part7ReadingQuestionResult> implements Part7QuestionResultDAO<Part7ReadingQuestionResult> {

}
