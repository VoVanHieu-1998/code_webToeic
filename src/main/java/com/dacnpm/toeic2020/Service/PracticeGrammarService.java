package com.dacnpm.toeic2020.Service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.dacnpm.toeic2020.DAO.PracticeGrammarDAO;
import com.dacnpm.toeic2020.Model.GrammarGuideline;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Utils.ConfigLoader;

@Service
public class PracticeGrammarService {

	@Autowired
	private PracticeGrammarDAO<GrammarGuideline> practiceGrammarDAO;

	public void saveGrammar(GrammarGuideline grammarGuideline) throws Exception {
		grammarGuideline.setActiveFlag(1);
		grammarGuideline.setCreateDate(new Date());
		grammarGuideline.setUpdateDate(new Date());

		String fileName = System.currentTimeMillis() + "_" + grammarGuideline.getMultipartFile().getOriginalFilename();

		processUploadFile(grammarGuideline.getMultipartFile(), fileName);
		// luu anh vao thu muc tren server

		// ta chi luu duong dan cua img vao DB thoi
		grammarGuideline.setImage("/upload/" + fileName);
		practiceGrammarDAO.save(grammarGuideline);
	}

	public void updateGrammar(GrammarGuideline grammarGuideline) throws Exception {
		grammarGuideline.setActiveFlag(1);
		
		grammarGuideline.setUpdateDate(new Date());

		//neu ko upload file thi no ko tra ve null, no chi tra ve ten file la rong thoi.
        if(!grammarGuideline.getMultipartFile().getOriginalFilename().isEmpty()) {
        	String fileName = System.currentTimeMillis() + "_" + grammarGuideline.getMultipartFile().getOriginalFilename();
        	grammarGuideline.setImage("/upload/" + fileName);
        	processUploadFile(grammarGuideline.getMultipartFile(), fileName);
        }
		practiceGrammarDAO.update(grammarGuideline);
	}
	
	public void deteteGrammar(GrammarGuideline grammarGuideline) throws Exception{
		grammarGuideline.setActiveFlag(0);
		grammarGuideline.setUpdateDate(new Date());
		practiceGrammarDAO.update(grammarGuideline);
	}
	
	public List<GrammarGuideline> getAll(GrammarGuideline grammarGuideline,Pagging pagging){
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if(grammarGuideline != null) {
			
			if(grammarGuideline.getName() != null && !StringUtils.isEmpty(grammarGuideline.getName())) {
				sb.append(" and model.name like :name");
				mapParams.put("name", "%"+grammarGuideline.getName()+"%");
			}
		}
		
		return this.practiceGrammarDAO.getList(sb.toString(), mapParams, pagging);
	
	}
	
	public GrammarGuideline findGrammarById(int id) {
	
		return this.practiceGrammarDAO.findById(GrammarGuideline.class, id);
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
