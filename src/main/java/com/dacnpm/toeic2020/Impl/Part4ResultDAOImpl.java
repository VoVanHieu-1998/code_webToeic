package com.dacnpm.toeic2020.Impl;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dacnpm.toeic2020.DAO.Part4ResultDAO;
import com.dacnpm.toeic2020.Model.Part4Result;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part4ResultDAOImpl extends BaseDaoImpl<Part4Result> implements Part4ResultDAO<Part4Result>{

}
