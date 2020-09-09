package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part4QuestionResultDAO;
import com.dacnpm.toeic2020.DAO.Part6QuestionResultDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part4ResultQuestion;
import com.dacnpm.toeic2020.Model.Part6ResultQuestion;

@Service
public class Part6ResultQuestionService {


	@Autowired
	Part6QuestionResultDAO<Part6ResultQuestion> part6QuestionResultDAO;

	public void savePart6ResultQuestion(Part6ResultQuestion part6ResultQuestion) throws Exception {
		part6ResultQuestion.setActiveFlag(1);
		part6ResultQuestion.setCreateDate(new Date());
		part6ResultQuestion.setUpdateDate(new Date());

		part6QuestionResultDAO.save(part6ResultQuestion);
	}

	public void updatePart6ResultQuestion(Part6ResultQuestion part6ResultQuestion) throws Exception {
		part6ResultQuestion.setActiveFlag(1);
	
		part6ResultQuestion.setUpdateDate(new Date());
		part6QuestionResultDAO.update(part6ResultQuestion);
	}

	public void detetePart6ResultQuestion(Part6ResultQuestion part6ResultQuestion) throws Exception {
		part6ResultQuestion.setActiveFlag(0);
		part6ResultQuestion.setUpdateDate(new Date());
		part6QuestionResultDAO.update(part6ResultQuestion);
	}

	public List<Part6ResultQuestion> getAll(Part6ResultQuestion part6ResultQuestion, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		

		return this.part6QuestionResultDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part6ResultQuestion findPart6ResultQuestionById(int id) {
		return this.part6QuestionResultDAO.findById(Part6ResultQuestion.class, id);
	}
	
}
