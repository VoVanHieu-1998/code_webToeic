package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part5QuestionDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part5Question;
import com.dacnpm.toeic2020.Model.User;

@Service
public class Part5ReadingService {
	@Autowired
	Part5QuestionDAO<Part5Question> Part5QuestionDAO;

	public void savePart5Question(Part5Question Part5Question) throws Exception {
		Part5Question.setActiveFlag(1);
		Part5Question.setCreateDate(new Date());
		Part5Question.setUpdateDate(new Date());

		Part5QuestionDAO.save(Part5Question);
	}

	public void updatePart5Question(Part5Question Part5Question) throws Exception {
		Part5Question.setActiveFlag(1);

		Part5Question.setUpdateDate(new Date());
		Part5QuestionDAO.update(Part5Question);
	}

	public void detetePart5Question(Part5Question Part5Question) throws Exception {
		Part5Question.setActiveFlag(0);
		Part5Question.setUpdateDate(new Date());
		Part5QuestionDAO.update(Part5Question);
	}

	public List<Part5Question> getAll(Part5Question Part5Question, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (Part5Question != null) {

		}

		return this.Part5QuestionDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part5Question findPart5QuestionById(int id) {
		return this.Part5QuestionDAO.findById(Part5Question.class, id);
	}

	public List<Part5Question> findByProperty(String property, Object value) {

		return this.Part5QuestionDAO.findByProperty(property, value);

	}

}
