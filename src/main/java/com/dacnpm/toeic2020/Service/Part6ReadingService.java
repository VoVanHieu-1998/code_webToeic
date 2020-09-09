package com.dacnpm.toeic2020.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part4ListeningDAO;
import com.dacnpm.toeic2020.DAO.Part6ReadingDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part4;
import com.dacnpm.toeic2020.Model.Part6;
@Service
public class Part6ReadingService {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private Part6ReadingDAO<Part6> part6ReadingDAO;
	
	public List<Part6> getAll(Part6 part6,Pagging pagging){
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if(part6 != null) {
			if(part6.getId()!= null && part6.getId() != 0) {
				sb.append(" and model.id=:id");
				mapParams.put("id",part6.getId());
			}
		}
		return this.part6ReadingDAO.getList(sb.toString(),mapParams, pagging);
	}
	
	public Part6 findById(int id) {
		return this.part6ReadingDAO.findById(Part6.class, id);
	}
}
