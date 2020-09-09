package com.dacnpm.toeic2020.Validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.dacnpm.toeic2020.Model.Comment;

@Component
public class CommentValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz == Comment.class;
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmpty(errors, "namevocabulary", "msg.required");
		ValidationUtils.rejectIfEmpty(errors, "content", "msg.required");
		
	}

}
