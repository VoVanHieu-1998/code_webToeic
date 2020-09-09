package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part7ResultDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part7Result;
@Service
public class Part7ResultService {
	@Autowired
	Part7ResultDAO<Part7Result> Part7ResultDAO;

	public void savePart7Result(Part7Result part7Result) throws Exception {
		part7Result.setActiveFlag(1);
		part7Result.setCreateDate(new Date());
		part7Result.setUpdateDate(new Date());

		Part7ResultDAO.save(part7Result);
	}

	public void updatePart7Result(Part7Result part7Result) throws Exception {
		part7Result.setActiveFlag(1);
	
		part7Result.setUpdateDate(new Date());
		Part7ResultDAO.update(part7Result);
	}

	public void detetePart7Result(Part7Result part7Result) throws Exception {
		part7Result.setActiveFlag(0);
		part7Result.setUpdateDate(new Date());
		Part7ResultDAO.update(part7Result);
	}

	public List<Part7Result> getAll(Part7Result Part7ResultDAO, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (Part7ResultDAO != null) {

		}

		return this.Part7ResultDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part7Result findPart7ResultById(int id) {
		return this.Part7ResultDAO.findById(Part7Result.class, id);
	}
	
}
