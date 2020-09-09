package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part4ResultDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part4Result;

@Service
public class Part4ResultService {

	@Autowired
	Part4ResultDAO<Part4Result> part4ResultDAO;

	public void savePart4Result(Part4Result Part4Result) throws Exception {
		Part4Result.setActiveFlag(1);
		Part4Result.setCreateDate(new Date());
		Part4Result.setUpdateDate(new Date());

		part4ResultDAO.save(Part4Result);
	}

	public void updatePart4Result(Part4Result Part4Result) throws Exception {
		Part4Result.setActiveFlag(1);

		Part4Result.setUpdateDate(new Date());
		part4ResultDAO.update(Part4Result);
	}

	public void detetePart4Result(Part4Result Part4Result) throws Exception {
		Part4Result.setActiveFlag(0);
		Part4Result.setUpdateDate(new Date());
		part4ResultDAO.update(Part4Result);
	}

	public List<Part4Result> getAll(Part4Result Part4Result, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (Part4Result != null) {

		}

		return this.part4ResultDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part4Result findPart4ResultById(int id) {
		return this.part4ResultDAO.findById(Part4Result.class, id);
	}
}
