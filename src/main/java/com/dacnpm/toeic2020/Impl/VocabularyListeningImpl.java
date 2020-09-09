package com.dacnpm.toeic2020.Impl;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dacnpm.toeic2020.DAO.VocabularyListeningDAO;
import com.dacnpm.toeic2020.Model.Vocabularycontent;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class VocabularyListeningImpl extends BaseDaoImpl<Vocabularycontent> implements VocabularyListeningDAO<Vocabularycontent> {

}
