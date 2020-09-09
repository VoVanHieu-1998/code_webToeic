package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dacnpm.toeic2020.DAO.CommentDAO;
import com.dacnpm.toeic2020.Model.Comment;
import com.dacnpm.toeic2020.Model.Pagging;;



@Service
public class CommentService {

	@Autowired
	CommentDAO<Comment> CommentDAO;

	public List<Comment> getListComments(String query, Map<String, Object> queryParams, Pagging pagging) {
		return this.CommentDAO.getList(query, queryParams, pagging);
	}

	public List<Comment> getAll(Comment Comment, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (Comment != null) {
			if (Comment.getName() != null && !StringUtils.isEmpty(Comment.getName())) {
				sb.append(" and model.name like :name");
				mapParams.put("name", "%" + Comment.getName() + "%");
			}
		}

		return this.CommentDAO.getList(sb.toString(), mapParams, pagging);
	}

	public void saveComment(Comment Comment) throws Exception {

		Comment.setActiveFlag(1);
		Comment.setCreateDate(new Date());
		Comment.setUpdateDate(new Date());

		this.CommentDAO.save(Comment);
	}

	public void updateComment(Comment Comment) throws Exception {

		Comment.setActiveFlag(1);

		Comment.setUpdateDate(new Date());

		this.CommentDAO.update(Comment);
	}

	public void deleteComment(Comment Comment)  {

		Comment.setActiveFlag(0);
		Comment.setUpdateDate(new Date());
		this.CommentDAO.update(Comment);
	}

	public Comment getCommentById(int id) {
		return this.CommentDAO.findById(Comment.class, id);
	}

}
