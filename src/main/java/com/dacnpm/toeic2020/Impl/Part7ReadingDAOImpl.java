package com.dacnpm.toeic2020.Impl;

import javax.transaction.Transactional;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.dacnpm.toeic2020.DAO.Part7ReadingDAO;
import com.dacnpm.toeic2020.Model.Part7;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part7ReadingDAOImpl extends BaseDaoImpl<Part7> implements Part7ReadingDAO<Part7>{

}
