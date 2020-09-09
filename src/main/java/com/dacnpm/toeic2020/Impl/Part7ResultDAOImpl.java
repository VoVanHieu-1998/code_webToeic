package com.dacnpm.toeic2020.Impl;

import javax.transaction.Transactional;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.dacnpm.toeic2020.DAO.Part7ResultDAO;
import com.dacnpm.toeic2020.Model.Part7Result;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part7ResultDAOImpl extends BaseDaoImpl<Part7Result> implements Part7ResultDAO<Part7Result>{

}
