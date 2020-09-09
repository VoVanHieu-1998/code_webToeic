package com.dacnpm.toeic2020.Impl;

import javax.transaction.Transactional;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.dacnpm.toeic2020.DAO.Part4ListeningDAO;
import com.dacnpm.toeic2020.Model.Part4;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part4ListeningDAOImpl extends BaseDaoImpl<Part4> implements Part4ListeningDAO<Part4> {

}
