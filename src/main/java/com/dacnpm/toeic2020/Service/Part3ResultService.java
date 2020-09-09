package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.dacnpm.toeic2020.DAO.Part3ResultDAO;
import com.dacnpm.toeic2020.Model.Pagging;

import com.dacnpm.toeic2020.Model.Part3Result;

@Service
public class Part3ResultService {
	@Autowired
	Part3ResultDAO<Part3Result> part3ResultDAO;

	public void savePart3Result(Part3Result part3Result) throws Exception {
		part3Result.setActiveFlag(1);
		part3Result.setCreateDate(new Date());
		part3Result.setUpdateDate(new Date());

		part3ResultDAO.save(part3Result);
	}

	public void updatepart3Result(Part3Result part3Result) throws Exception {
		part3Result.setActiveFlag(1);

		part3Result.setUpdateDate(new Date());
		part3ResultDAO.update(part3Result);
	}

	public void detetepart3Result(Part3Result part3Result) throws Exception {
		part3Result.setActiveFlag(0);
		part3Result.setUpdateDate(new Date());
		part3ResultDAO.update(part3Result);
	}

	public List<Part3Result> getAll(Part3Result part3Result, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (part3Result != null) {

		}

		return this.part3ResultDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part3Result findPart3ResultById(int id) {
		return this.part3ResultDAO.findById(Part3Result.class, id);
	}
	
}
