package com.dacnpm.toeic2020.Validator;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.dacnpm.toeic2020.Model.Examination;
import com.dacnpm.toeic2020.Model.GrammarGuideline;
@Component
public class ExamValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
	
		return clazz == Examination.class;
	}

	@Override
	public void validate(Object target, Errors errors) {
		Examination examination = (Examination) target;
		ValidationUtils.rejectIfEmpty(errors, "tittle", "msg.required");
	
		if (examination.getId() == null) {
			if(examination.getMultipartFile().isEmpty() || examination.getMultipartFile() == null) {
				errors.rejectValue("multipartFile", "msg.chooseImg");	
			}
			
		}
		if (!examination.getMultipartFile().getOriginalFilename().isEmpty()) {
			// lấy ra đuôi của file
			String extention = FilenameUtils.getExtension(examination.getMultipartFile().getOriginalFilename());
			// chỉ chấp nhập file có duôi là jpg hoặc png
			if (!extention.equals("jpg") && !extention.equals("png")) {
				errors.rejectValue("multipartFile", "msg.file.extention.error");
			}
		}
		
	}

}
