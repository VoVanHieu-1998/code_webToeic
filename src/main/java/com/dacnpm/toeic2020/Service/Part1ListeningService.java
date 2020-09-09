package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dacnpm.toeic2020.DAO.Part1QuestionDAO;

import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part1;

@Service
public class Part1ListeningService {
	
	@Autowired
	private Part1QuestionDAO<Part1> part1QuestionDAO;
	
	public void savePart1Quess(Part1 part1) throws Exception {

		part1.setActiveFlag(1);
		part1.setCreateDate(new Date());
		part1.setUpdateDate(new Date());
		this.part1QuestionDAO.save(part1);
		
	}

	public void updatePart1Quess(Part1 part1) throws Exception {

		part1.setActiveFlag(1);
	
		part1.setUpdateDate(new Date());

		this.part1QuestionDAO.update(part1);
	}
	
	public void deletePartQuess(Part1 part1) throws Exception {

		part1.setActiveFlag(0);
		part1.setUpdateDate(new Date());
		this.part1QuestionDAO.update(part1);
	}
	
	public Part1 getPart1QuessById(int id) {
		return this.part1QuestionDAO.findById(Part1.class, id);
	}
	
	public List<Part1> getAll(Part1 part1,Pagging pagging){
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
	
		if(part1 != null) {
			
			
		}
		
		return this.part1QuestionDAO.getListPart1(sb.toString(), mapParams, pagging);
	
	}
	
}
