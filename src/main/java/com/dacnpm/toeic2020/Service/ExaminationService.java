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

import com.dacnpm.toeic2020.DAO.ExaminationDAO;
import com.dacnpm.toeic2020.Model.Examination;
import com.dacnpm.toeic2020.Model.GrammarGuideline;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part1;
import com.dacnpm.toeic2020.Utils.ConfigLoader;

@Service
public class ExaminationService {
	
	@Autowired
	private ExaminationDAO<Examination> examinationDAO;

	public void savePart1Quess(Examination examination) throws Exception {

		examination.setActiveFlag(1);
		examination.setCreateDate(new Date());
		examination.setUpdateDate(new Date());
		
		String fileName = System.currentTimeMillis() + "_" + examination.getMultipartFile().getOriginalFilename();

		processUploadFile(examination.getMultipartFile(), fileName);
		// luu anh vao thu muc tren server

		// ta chi luu duong dan cua img vao DB thoi
		examination.setImg("/upload/" + fileName);
		this.examinationDAO.save(examination);
	}

	public void updatePart1Quess(Examination examination) throws Exception {

		examination.setActiveFlag(1);
	
		examination.setUpdateDate(new Date());

		//neu ko upload file thi no ko tra ve null, no chi tra ve ten file la rong thoi.
        if(!examination.getMultipartFile().getOriginalFilename().isEmpty()) {
        	String fileName = System.currentTimeMillis() + "_" + examination.getMultipartFile().getOriginalFilename();
        	examination.setImg("/upload/" + fileName);
        	processUploadFile(examination.getMultipartFile(), fileName);
        }
        
		this.examinationDAO.update(examination);
	}
	
	public void deletePartQuess(Examination examination) throws Exception {

		examination.setActiveFlag(0);
		examination.setUpdateDate(new Date());
		this.examinationDAO.update(examination);
	}
	
	public Examination getExamById(int id) {
		return this.examinationDAO.findById(Examination.class, id);
	}
	
	
	public List<Examination> getAll(Examination examination,Pagging pagging){
		StringBuilder sb = new StringBuilder("");
		Map<String, Object> mapParams = new HashMap<>();
		if(examination != null) {
			
			if(examination.getTittle() != null && !StringUtils.isEmpty(examination.getTittle())) {
				sb.append(" and model.tittle like :tittle");
				mapParams.put("tittle", "%"+examination.getTittle()+"%");
			}
		}
		
		return this.examinationDAO.getList(sb.toString(), mapParams, pagging);
	
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
