package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part2ResultDAO;
import com.dacnpm.toeic2020.Model.Pagging;

import com.dacnpm.toeic2020.Model.Part2Result;

@Service
public class Part2ResultService {
	@Autowired
	Part2ResultDAO<Part2Result> part2ResultDAO;

	public void savePart2Result(Part2Result part2Result) throws Exception {
		part2Result.setActiveFlag(1);
		part2Result.setCreateDate(new Date());
		part2Result.setUpdateDate(new Date());

		part2ResultDAO.save(part2Result);
	}

	public void updatePart2Result(Part2Result part2Result) throws Exception {
		part2Result.setActiveFlag(1);

		part2Result.setUpdateDate(new Date());
		part2ResultDAO.update(part2Result);
	}

	public void detetePart2Result(Part2Result part2Result) throws Exception {
		part2Result.setActiveFlag(0);
		part2Result.setUpdateDate(new Date());
		part2ResultDAO.update(part2Result);
	}

	public List<Part2Result> getAll(Part2Result part2Result, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (part2Result != null) {

		}

		return this.part2ResultDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part2Result findPart2ResultById(int id) {
		return this.part2ResultDAO.findById(Part2Result.class, id);
	}
	
	public int countCorrectAnswerPart2(int id) {
		return this.part2ResultDAO.countCorrectAnswerPart2(id);
	}

}
