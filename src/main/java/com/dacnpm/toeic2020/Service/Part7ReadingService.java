package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part7;

@Service
public class Part7ReadingService {

	@Autowired
	com.dacnpm.toeic2020.DAO.Part7ReadingDAO<Part7> Part7ReadingDAO;

	public void savePart7(Part7 Part7) throws Exception {
		Part7.setActiveFlag(1);
		Part7.setCreateDate(new Date());
		Part7.setUpdateDate(new Date());

		Part7ReadingDAO.save(Part7);
	}

	public void updatePart7(Part7 Part7) throws Exception {
		Part7.setActiveFlag(1);

		Part7.setUpdateDate(new Date());
		Part7ReadingDAO.update(Part7);
	}

	public void detetePart7(Part7 Part7) throws Exception {
		Part7.setActiveFlag(0);
		Part7.setUpdateDate(new Date());
		Part7ReadingDAO.update(Part7);
	}

	public List<Part7> getAll(Part7 Part7, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (Part7 != null) {

		}

		return this.Part7ReadingDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part7 findPart7ById(int id) {
		return this.Part7ReadingDAO.findById(Part7.class, id);
	}

	public List<Part7> findByProperty(String property, Object value) {

		return this.Part7ReadingDAO.findByProperty(property, value);

	}

}
