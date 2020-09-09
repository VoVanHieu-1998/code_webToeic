package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part5ResultDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part5QuestionResult;

@Service
public class Part5QuestionResultService {

	@Autowired
	Part5ResultDAO<Part5QuestionResult> Part5QuestionResultDAO;

	public void savePart5QuestionResult(Part5QuestionResult Part5QuestionResult) throws Exception {
		Part5QuestionResult.setActiveFlag(1);
		Part5QuestionResult.setCreateDate(new Date());
		Part5QuestionResult.setUpdateDate(new Date());

		Part5QuestionResultDAO.save(Part5QuestionResult);
	}

	public void updatePart5QuestionResult(Part5QuestionResult Part5QuestionResult) throws Exception {
		Part5QuestionResult.setActiveFlag(1);

		Part5QuestionResult.setUpdateDate(new Date());
		Part5QuestionResultDAO.update(Part5QuestionResult);
	}

	public void detetePart5QuestionResult(Part5QuestionResult Part5QuestionResult) throws Exception {
		Part5QuestionResult.setActiveFlag(0);
		Part5QuestionResult.setUpdateDate(new Date());
		Part5QuestionResultDAO.update(Part5QuestionResult);
	}

	public List<Part5QuestionResult> getAll(Part5QuestionResult Part5QuestionResult, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (Part5QuestionResult != null) {

		}

		return this.Part5QuestionResultDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part5QuestionResult findPart5QuestionResultById(int id) {
		return this.Part5QuestionResultDAO.findById(Part5QuestionResult.class, id);
	}
	
	

}
