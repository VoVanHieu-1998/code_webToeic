package com.dacnpm.toeic2020.Impl;

import javax.transaction.Transactional;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.dacnpm.toeic2020.DAO.Part5QuestionDAO;
import com.dacnpm.toeic2020.Model.Part5Question;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part5ReadingDAOImpl extends BaseDaoImpl<Part5Question> implements Part5QuestionDAO<Part5Question> {

}
