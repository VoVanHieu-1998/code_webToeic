package com.dacnpm.toeic2020.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.Part5LessonDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part5Lesson;

@Service
public class Part5LessonService {
	@Autowired
	Part5LessonDAO<Part5Lesson> Part5LessonDAO;

	public void savePart5Lesson(Part5Lesson Part5Lesson) throws Exception {
		Part5Lesson.setActiveFlag(1);
		Part5Lesson.setCreateDate(new Date());
		Part5Lesson.setUpdateDate(new Date());

		Part5LessonDAO.save(Part5Lesson);
	}

	public void updatePart5Lesson(Part5Lesson Part5Lesson) throws Exception {
		Part5Lesson.setActiveFlag(1);

		Part5Lesson.setUpdateDate(new Date());
		Part5LessonDAO.update(Part5Lesson);
	}

	public void detetePart5Lesson(Part5Lesson Part5Lesson) throws Exception {
		Part5Lesson.setActiveFlag(0);
		Part5Lesson.setUpdateDate(new Date());
		Part5LessonDAO.update(Part5Lesson);
	}

	public List<Part5Lesson> getAll(Part5Lesson Part5Lesson, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (Part5Lesson != null) {

		}

		return this.Part5LessonDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Part5Lesson findPart5LessonById(int id) {
		return this.Part5LessonDAO.findById(Part5Lesson.class, id);
	}
	
	
}
