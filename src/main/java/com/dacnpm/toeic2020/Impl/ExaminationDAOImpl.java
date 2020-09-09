package com.dacnpm.toeic2020.Impl;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dacnpm.toeic2020.DAO.ExaminationDAO;
import com.dacnpm.toeic2020.Model.Examination;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class ExaminationDAOImpl extends BaseDaoImpl<Examination> implements ExaminationDAO<Examination> {

}
