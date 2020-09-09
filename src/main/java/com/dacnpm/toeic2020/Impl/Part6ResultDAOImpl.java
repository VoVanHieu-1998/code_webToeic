package com.dacnpm.toeic2020.Impl;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dacnpm.toeic2020.DAO.Part6ResultDAO;
import com.dacnpm.toeic2020.Model.Part6Result;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part6ResultDAOImpl extends BaseDaoImpl<Part6Result> implements Part6ResultDAO<Part6Result> {

}
