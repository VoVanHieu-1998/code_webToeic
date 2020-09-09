package com.dacnpm.toeic2020.Impl;

import javax.transaction.Transactional;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.dacnpm.toeic2020.DAO.CommentDAO;
import com.dacnpm.toeic2020.Model.Comment;


@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
@Transactional
public class CommentDAOImpl extends BaseDaoImpl<Comment> implements CommentDAO<Comment>{

}
