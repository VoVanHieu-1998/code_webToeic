package com.dacnpm.toeic2020.Impl;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dacnpm.toeic2020.DAO.Part6ReadingDAO;
import com.dacnpm.toeic2020.Model.Part6;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part6ReadingDAOImpl extends BaseDaoImpl<Part6> implements Part6ReadingDAO<Part6>{

}
