package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.ResultDAO;
import com.dacnpm.toeic2020.Model.Pagging;

import com.dacnpm.toeic2020.Model.Results;

@Service
public class ResultService {

	@Autowired
	ResultDAO<Results> resultDAO;

	public void saveResult(Results result) throws Exception {
		result.setActiveFlag(1);
		result.setCreateDate(new Date());
		result.setUpdateDate(new Date());

		resultDAO.save(result);
	}

	public void updateResult(Results result) throws Exception {
		result.setActiveFlag(1);
		
		result.setUpdateDate(new Date());
		resultDAO.update(result);
	}
	
	public void deteteresult(Results result) throws Exception{
		result.setActiveFlag(0);
		result.setUpdateDate(new Date());
		resultDAO.update(result);
	}
	
	public List<Results> getAll(Results result,Pagging pagging){
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if(result != null) {
			
		}
		
		return this.resultDAO.getList(sb.toString(), mapParams, pagging);
	
	}
	
	public Results findresultById(int id) {
		return this.resultDAO.findById(Results.class, id);
	}
	

}
