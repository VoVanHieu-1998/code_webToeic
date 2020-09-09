package com.dacnpm.toeic2020.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dacnpm.toeic2020.Model.Comment;
import com.dacnpm.toeic2020.Model.CommentForm;
import com.dacnpm.toeic2020.Model.JsonResponse;
import com.dacnpm.toeic2020.Service.CommentService;
import com.dacnpm.toeic2020.Service.PracticeGrammarService;
import com.dacnpm.toeic2020.Service.ReplyService;

@Controller
public class CommentController {

	@Autowired
	CommentService commentService;
    
	@Autowired
	PracticeGrammarService productService;
	
	@Autowired
	ReplyService replyService;
	
	@RequestMapping(value = "/comment/add", method = RequestMethod.POST, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public  JsonResponse comment(Model model, @ModelAttribute("data") CommentForm commentForm,
			BindingResult result, Errors error) {

		System.out.println("name" + commentForm.getName());
		System.out.println("pro id" + commentForm.getGrammarId());

		JsonResponse response = new JsonResponse();
		ValidationUtils.rejectIfEmptyOrWhitespace(result, "name", "họ tên không được để trống.");
		ValidationUtils.rejectIfEmptyOrWhitespace(result, "email", "Email không được để trống.");

		if (commentForm.getCmtContent().length() < 10) {
			error.reject("cmtContent", "Nội dung không dược để trống.");
		}
		
		

		if (!result.hasErrors()) {
		
		
				Comment comment = new Comment();
				comment.setContent(commentForm.getCmtContent());
				comment.setPhoneNumber(commentForm.getSdt());
				comment.setEmail(commentForm.getEmail());
				comment.setName(commentForm.getName());
				comment.setGrammar_cmt(this.productService.findGrammarById(commentForm.getGrammarId()));
				
				
				try {
					this.commentService.saveComment(comment);
					response.setStatus("SUCCESS");
				} catch (Exception e) {
					
					e.printStackTrace();
					response.setStatus("FAIL");
				
				}
			
			
			
			
		}

		else {
			response.setStatus("FAIL");
			response.setResult(result.getAllErrors());
		}

		return response;

	}

	
}
