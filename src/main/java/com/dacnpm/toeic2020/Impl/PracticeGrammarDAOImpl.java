package com.dacnpm.toeic2020.Impl;

import javax.transaction.Transactional;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.dacnpm.toeic2020.DAO.PracticeGrammarDAO;
import com.dacnpm.toeic2020.Model.GrammarGuideline;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
@Transactional
public class PracticeGrammarDAOImpl extends BaseDaoImpl<GrammarGuideline> implements PracticeGrammarDAO<GrammarGuideline> {

}
