package com.dacnpm.toeic2020.Service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.dacnpm.toeic2020.DAO.Part1ResutDAO;
import com.dacnpm.toeic2020.Model.GrammarGuideline;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part1Result;
import com.dacnpm.toeic2020.Utils.ConfigLoader;

@Service
public class Part1ResultService {
	@Autowired
	Part1ResutDAO<Part1Result> part1ResutDAO;

	public void savePart1Result(Part1Result part1Result) throws Exception {
		part1Result.setActiveFlag(1);
		part1Result.setCreateDate(new Date());
		part1Result.setUpdateDate(new Date());

		part1ResutDAO.save(part1Result);
	}

	public void updatePart1Result(Part1Result part1Result) throws Exception {
		part1Result.setActiveFlag(1);

		part1Result.setUpdateDate(new Date());
		part1ResutDAO.update(part1Result);
	}

	public void detetePart1Result(Part1Result part1Result) throws Exception {
		part1Result.setActiveFlag(0);
		part1Result.setUpdateDate(new Date());
		part1ResutDAO.update(part1Result);
	}

	public List<Part1Result> getAll(Part1Result part1Result, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (part1Result != null) {

		}

		return this.part1ResutDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part1Result findPart1ResultById(int id) {
		return this.part1ResutDAO.findById(Part1Result.class, id);
	}
	public int countCorrectAnswerPart1(int id) {
		return this.part1ResutDAO.countCorrectAnswerPart1(id);
	}

}
