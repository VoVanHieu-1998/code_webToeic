package com.dacnpm.toeic2020.Validator;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.dacnpm.toeic2020.Model.GrammarGuideline;

@Component
public class PracticeGrammarValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz == GrammarGuideline.class;
	}

	@Override
	public void validate(Object target, Errors errors) {
		GrammarGuideline grammarGuideline = (GrammarGuideline) target;
		ValidationUtils.rejectIfEmpty(errors, "name", "msg.required");
		ValidationUtils.rejectIfEmpty(errors, "content", "msg.required");
		if (grammarGuideline.getId() == null) {
			if(grammarGuideline.getMultipartFile().isEmpty() || grammarGuideline.getMultipartFile() == null) {
				errors.rejectValue("multipartFile", "msg.chooseImg");	
			}
			
		}
		if (!grammarGuideline.getMultipartFile().getOriginalFilename().isEmpty()) {
			// lấy ra đuôi của file
			String extention = FilenameUtils.getExtension(grammarGuideline.getMultipartFile().getOriginalFilename());
			// chỉ chấp nhập file có duôi là jpg hoặc png
			if (!extention.equals("jpg") && !extention.equals("png")) {
				errors.rejectValue("multipartFile", "msg.file.extention.error");
			}
		}
	}

}
