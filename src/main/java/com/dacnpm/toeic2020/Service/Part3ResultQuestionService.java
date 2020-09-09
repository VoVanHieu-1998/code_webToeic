package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part3QuestionResultDAO;
import com.dacnpm.toeic2020.DAO.Part3ResultDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part3Result;
import com.dacnpm.toeic2020.Model.Part3ResultQuestion;
@Service
public class Part3ResultQuestionService {

	@Autowired
	Part3QuestionResultDAO<Part3ResultQuestion> part3QuestionResultDAO;

	public void savePart3ResultQuestion(Part3ResultQuestion part3QuestionResult) throws Exception {
		part3QuestionResult.setActiveFlag(1);
		part3QuestionResult.setCreateDate(new Date());
		part3QuestionResult.setUpdateDate(new Date());

		part3QuestionResultDAO.save(part3QuestionResult);
	}

	public void updatePart3ResultQuestion(Part3ResultQuestion part3QuestionResult) throws Exception {
		part3QuestionResult.setActiveFlag(1);
	
		part3QuestionResult.setUpdateDate(new Date());
		part3QuestionResultDAO.update(part3QuestionResult);
	}

	public void detetePart3ResultQuestion(Part3ResultQuestion part3QuestionResult) throws Exception {
		part3QuestionResult.setActiveFlag(0);
		part3QuestionResult.setUpdateDate(new Date());
		part3QuestionResultDAO.update(part3QuestionResult);
	}

	public List<Part3ResultQuestion> getAll(Part3ResultQuestion part3QuestionResultDAO, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (part3QuestionResultDAO != null) {

		}

		return this.part3QuestionResultDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part3ResultQuestion findPart3ResultQuestionById(int id) {
		return this.part3QuestionResultDAO.findById(Part3ResultQuestion.class, id);
	}
	
}
