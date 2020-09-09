package com.dacnpm.toeic2020.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part2ListeningDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part2;


@Service
public class Part2ListeningService {
	
	@Autowired
	private Part2ListeningDAO<Part2> part2ListeningDAO;
	
	
	public Part2 findById(int id) {
		return this.part2ListeningDAO.findById(Part2.class, id);
	}
	
	public List<Part2> getAll(Part2 part2,Pagging pagging){
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if(part2 != null) {
			if(part2.getId()!= null && part2.getId() != 0) {
				sb.append(" and model.id=:id");
				mapParams.put("id",part2.getId());
			}
		}
		
		return this.part2ListeningDAO.getListPart2(sb.toString(), mapParams, pagging);
	
	}
	
	
}
