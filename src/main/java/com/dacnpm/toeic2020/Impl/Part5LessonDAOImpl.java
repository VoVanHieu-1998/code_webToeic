package com.dacnpm.toeic2020.Impl;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dacnpm.toeic2020.DAO.Part5LessonDAO;
import com.dacnpm.toeic2020.Model.Part5Lesson;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
@Transactional
public class Part5LessonDAOImpl extends BaseDaoImpl<Part5Lesson> implements Part5LessonDAO<Part5Lesson> {

}
