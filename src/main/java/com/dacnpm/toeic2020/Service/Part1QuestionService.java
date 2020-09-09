package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dacnpm.toeic2020.DAO.Part1QuestionDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part1;

@Controller
public class Part1QuestionService {
	@Autowired
	Part1QuestionDAO<Part1> Part1QuestionDAO;

	public void savePart1(Part1 Part1) throws Exception {
		Part1.setActiveFlag(1);
		Part1.setCreateDate(new Date());
		Part1.setUpdateDate(new Date());

		Part1QuestionDAO.save(Part1);
	}

	public void updatePart1(Part1 Part1) throws Exception {
		Part1.setActiveFlag(1);

		Part1.setUpdateDate(new Date());
		Part1QuestionDAO.update(Part1);
	}

	public void detetePart1(Part1 Part1) throws Exception {
		Part1.setActiveFlag(0);
		Part1.setUpdateDate(new Date());
		Part1QuestionDAO.update(Part1);
	}

	public List<Part1> getAll(Part1 Part1, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (Part1 != null) {

		}

		return this.Part1QuestionDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part1 findPart1ById(int id) {
		return this.Part1QuestionDAO.findById(Part1.class, id);
	}
	
	
	
}
