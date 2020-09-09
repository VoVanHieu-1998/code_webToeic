package com.dacnpm.toeic2020.Impl;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dacnpm.toeic2020.DAO.Part3ResultDAO;
import com.dacnpm.toeic2020.Model.Part3Result;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part3ResultDAOImpl extends BaseDaoImpl<Part3Result> implements Part3ResultDAO<Part3Result> {

}
