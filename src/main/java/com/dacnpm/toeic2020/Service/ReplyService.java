package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dacnpm.toeic2020.DAO.ReplyDAO;
import com.dacnpm.toeic2020.Model.Reply;
import com.dacnpm.toeic2020.Model.Pagging;

@Service
public class ReplyService {

	@Autowired
	ReplyDAO<Reply> ReplyDAO;

	public List<Reply> getListReplys(String query, Map<String, Object> queryParams, Pagging pagging) {
		return this.ReplyDAO.getList(query, queryParams, pagging);
	}

	public List<Reply> getAll(Reply Reply, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (Reply != null) {
			if (Reply.getName() != null && !StringUtils.isEmpty(Reply.getName())) {
				sb.append(" and model.name like :name");
				mapParams.put("name", "%" + Reply.getName() + "%");
			}
		}

		return this.ReplyDAO.getList(sb.toString(), mapParams, pagging);
	}

	public void saveReply(Reply Reply) throws Exception {

		Reply.setActiveFlag(1);
		Reply.setCreateDate(new Date());
		Reply.setUpdateDate(new Date());

		this.ReplyDAO.save(Reply);
	}

	public void updateReply(Reply Reply) throws Exception {

		Reply.setActiveFlag(1);

		Reply.setUpdateDate(new Date());

		this.ReplyDAO.update(Reply);
	}

	public void deleteReply(Reply Reply) throws Exception {

		Reply.setActiveFlag(0);
		Reply.setUpdateDate(new Date());
		this.ReplyDAO.update(Reply);
	}

	public Reply getReplyById(int id) {
		return this.ReplyDAO.findById(Reply.class, id);
	}

}
