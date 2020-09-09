package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.dacnpm.toeic2020.DAO.Part6ResultDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part6Result;
import com.dacnpm.toeic2020.Model.Part6Result;

@Service
public class Part6ResultService {
	@Autowired
	Part6ResultDAO<Part6Result> part6ResultDAO;

	public void savePart6Result(Part6Result Part6Result) throws Exception {
		Part6Result.setActiveFlag(1);
		Part6Result.setCreateDate(new Date());
		Part6Result.setUpdateDate(new Date());

		part6ResultDAO.save(Part6Result);
	}

	public void updatePart6Result(Part6Result Part6Result) throws Exception {
		Part6Result.setActiveFlag(1);

		Part6Result.setUpdateDate(new Date());
		part6ResultDAO.update(Part6Result);
	}

	public void detetePart6Result(Part6Result Part6Result) throws Exception {
		Part6Result.setActiveFlag(0);
		Part6Result.setUpdateDate(new Date());
		part6ResultDAO.update(Part6Result);
	}

	public List<Part6Result> getAll(Part6Result Part6Result, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (Part6Result != null) {

		}

		return this.part6ResultDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part6Result findPart6ResultById(int id) {
		return this.part6ResultDAO.findById(Part6Result.class, id);
	}
}
