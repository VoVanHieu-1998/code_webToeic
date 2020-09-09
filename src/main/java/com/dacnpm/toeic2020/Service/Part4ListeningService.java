package com.dacnpm.toeic2020.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part4ListeningDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part4;

@Service
public class Part4ListeningService {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private Part4ListeningDAO<Part4> Part4ListeningDAO;
	
	public List<Part4> getAll(Part4 part3,Pagging pagging){
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if(part3 != null) {
			if(part3.getId()!= null && part3.getId() != 0) {
				sb.append(" and model.id=:id");
				mapParams.put("id",part3.getId());
			}
		}
		return this.Part4ListeningDAO.getList(sb.toString(),mapParams, pagging);
	}
	
	public Part4 findById(int id) {
		return this.Part4ListeningDAO.findById(Part4.class, id);
	}
}
