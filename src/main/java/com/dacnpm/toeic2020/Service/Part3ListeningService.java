package com.dacnpm.toeic2020.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part3ListeningDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part3;

@Service
public class Part3ListeningService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private Part3ListeningDAO<Part3> part3ListeningDAO;
	
	public List<Part3> getAll(Part3 part3,Pagging pagging){
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if(part3 != null) {
			if(part3.getId()!= null && part3.getId() != 0) {
				sb.append(" and model.id=:id");
				mapParams.put("id",part3.getId());
			}
		}
		return this.part3ListeningDAO.getList(sb.toString(),mapParams, pagging);
	}
	
	public Part3 findById(int id) {
		return this.part3ListeningDAO.findById(Part3.class, id);
	}
}
