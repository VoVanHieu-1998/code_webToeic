package com.dacnpm.toeic2020.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dacnpm.toeic2020.DAO.VocabularyListeningDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Vocabularycontent;

@Service
public class VocabularyListeningService {
	@Autowired
	VocabularyListeningDAO<Vocabularycontent> vocabularyListeningDAO;
	
	public List<Vocabularycontent> getAllVocabularycontent(Vocabularycontent vocabularycontent, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (vocabularycontent != null) {

		}

		return this.vocabularyListeningDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Vocabularycontent findVocabularyContentById(int id) {

		return this.vocabularyListeningDAO.findById(Vocabularycontent.class, id);
	}

	public void deteteVocabularycontent(Vocabularycontent vocabularycontent) {
		vocabularycontent.setActiveFlag(0);
		vocabularyListeningDAO.update(vocabularycontent);
	}

}
