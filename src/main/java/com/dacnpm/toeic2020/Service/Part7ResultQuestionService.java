package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part7QuestionResultDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part7ReadingQuestionResult;

@Service
public class Part7ResultQuestionService {
	@Autowired
	Part7QuestionResultDAO<Part7ReadingQuestionResult> Part7QuestionResultDAO;

	public void savePart7ReadingQuestionResult(Part7ReadingQuestionResult part7QuestionResult) throws Exception {
		part7QuestionResult.setActiveFlag(1);
		part7QuestionResult.setCreateDate(new Date());
		part7QuestionResult.setUpdateDate(new Date());

		Part7QuestionResultDAO.save(part7QuestionResult);
	}

	public void updatePart7ReadingQuestionResult(Part7ReadingQuestionResult part7QuestionResult) throws Exception {
		part7QuestionResult.setActiveFlag(1);
	
		part7QuestionResult.setUpdateDate(new Date());
		Part7QuestionResultDAO.update(part7QuestionResult);
	}

	public void detetePart7ReadingQuestionResult(Part7ReadingQuestionResult part7QuestionResult) throws Exception {
		part7QuestionResult.setActiveFlag(0);
		part7QuestionResult.setUpdateDate(new Date());
		Part7QuestionResultDAO.update(part7QuestionResult);
	}

	public List<Part7ReadingQuestionResult> getAll(Part7ReadingQuestionResult Part7QuestionResultDAO, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (Part7QuestionResultDAO != null) {

		}

		return this.Part7QuestionResultDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part7ReadingQuestionResult findPart7ReadingQuestionResultById(int id) {
		return this.Part7QuestionResultDAO.findById(Part7ReadingQuestionResult.class, id);
	}
	
}
