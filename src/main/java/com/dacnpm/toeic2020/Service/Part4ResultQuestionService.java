package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part4QuestionResultDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part4ResultQuestion;

@Service
public class Part4ResultQuestionService {


	@Autowired
	Part4QuestionResultDAO<Part4ResultQuestion> Part4QuestionResultDAO;

	public void savePart4ResultQuestion(Part4ResultQuestion part3QuestionResult) throws Exception {
		part3QuestionResult.setActiveFlag(1);
		part3QuestionResult.setCreateDate(new Date());
		part3QuestionResult.setUpdateDate(new Date());

		Part4QuestionResultDAO.save(part3QuestionResult);
	}

	public void updatePart4ResultQuestion(Part4ResultQuestion part3QuestionResult) throws Exception {
		part3QuestionResult.setActiveFlag(1);
	
		part3QuestionResult.setUpdateDate(new Date());
		Part4QuestionResultDAO.update(part3QuestionResult);
	}

	public void detetePart4ResultQuestion(Part4ResultQuestion part3QuestionResult) throws Exception {
		part3QuestionResult.setActiveFlag(0);
		part3QuestionResult.setUpdateDate(new Date());
		Part4QuestionResultDAO.update(part3QuestionResult);
	}

	public List<Part4ResultQuestion> getAll(Part4ResultQuestion Part4QuestionResultDAO, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (Part4QuestionResultDAO != null) {

		}

		return this.Part4QuestionResultDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part4ResultQuestion findPart4ResultQuestionById(int id) {
		return this.Part4QuestionResultDAO.findById(Part4ResultQuestion.class, id);
	}
	
}
