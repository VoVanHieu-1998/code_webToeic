package com.dacnpm.toeic2020.Service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dacnpm.toeic2020.DAO.IVocabularyDAO;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Vocabularyline;
import com.dacnpm.toeic2020.Utils.ConfigLoader;

@Service
public class VocabularyService {
	@Autowired
	IVocabularyDAO<Vocabularyline> vocabularyDAO;

	public List<Vocabularyline> getAll(Vocabularyline vocabularyline, Pagging pagging) {
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if (vocabularyline != null) {

		}

		return this.vocabularyDAO.getList(sb.toString(), mapParams, pagging);

	}

	public Vocabularyline findVocabularyById(int id) {

		return this.vocabularyDAO.findById(Vocabularyline.class, id);
	}

	public void deteteVocabulary(Vocabularyline vocabularyline) {
		vocabularyline.setActiveFlag(0);
		vocabularyDAO.update(vocabularyline);
	}
	public void saveVocabulary(Vocabularyline vocabularyline) throws Exception {
		vocabularyline.setActiveFlag(1);
		

		String fileName = System.currentTimeMillis() + "_" + vocabularyline.getMultipartFile().getOriginalFilename();

		processUploadFile(vocabularyline.getMultipartFile(), fileName);
		// luu anh vao thu muc tren server

		// ta chi luu duong dan cua img vao DB thoi
		vocabularyline.setImagevocabulary("/upload/" + fileName);
		vocabularyDAO.save(vocabularyline);
	}

	public void updateVocabulary(Vocabularyline vocabularyline) throws Exception {
		vocabularyline.setActiveFlag(1);
		
		

		//neu ko upload file thi no ko tra ve null, no chi tra ve ten file la rong thoi.
        if(!vocabularyline.getMultipartFile().getOriginalFilename().isEmpty()) {
        	String fileName = System.currentTimeMillis() + "_" + vocabularyline.getMultipartFile().getOriginalFilename();
        	vocabularyline.setImagevocabulary("/upload/" + fileName);
        	processUploadFile(vocabularyline.getMultipartFile(), fileName);
        }
		vocabularyDAO.update(vocabularyline);
	}
	


	
	private void processUploadFile(MultipartFile multipartFile, String fileName)
			throws IllegalStateException, IOException {
		if (!multipartFile.getOriginalFilename().isEmpty()) {
			File dir = new File(ConfigLoader.getInstance().getValue("upload.location"));
			if (!dir.exists()) {
				dir.mkdirs();
			}
			// để tránh khi upload mà ảnh bị trùng tên

			// copy file cái file mà ta muốn upload từ client lên server
			File file = new File(ConfigLoader.getInstance().getValue("upload.location"), fileName);
			multipartFile.transferTo(file);
		}
	}

}
