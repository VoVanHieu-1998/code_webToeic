package com.dacnpm.toeic2020.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dacnpm.toeic2020.Model.JSonResponse2;
import com.dacnpm.toeic2020.Model.Reply;
import com.dacnpm.toeic2020.Model.ReplyForm;
import com.dacnpm.toeic2020.Service.ReplyService;
@Controller
public class ReplyController {

	@Autowired
	com.dacnpm.toeic2020.Service.CommentService commentService;
    
	
	
	@Autowired
	ReplyService replyService;
	
	@RequestMapping(value = "/reply/add", method = RequestMethod.POST, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JSonResponse2 reply(@ModelAttribute("dataReply") ReplyForm replyForm,
			BindingResult results, Errors errors) {

		System.out.println("name" + replyForm.getName());
		System.out.println("comment id" + replyForm.getCommentId());

		JSonResponse2 response = new JSonResponse2();
		ValidationUtils.rejectIfEmptyOrWhitespace(results, "name", "Họ tên không được để trống.");
		ValidationUtils.rejectIfEmptyOrWhitespace(results, "email", "Email không được để trống.");

		if (replyForm.getReplyContent().length() < 10) {
			errors.reject("replyContent", "Nội dung không được để trống.");
		}
		if(StringUtils.isEmpty(replyForm.getCommentId())) {
			errors.reject("commentId", "ChÆ°a chá»�n");
		}
        
		
		if (!results.hasErrors()) {
			
		Reply reply = new Reply();
		reply.setComment_reply(this.commentService.getCommentById(replyForm.getCommentId()));
		reply.setContent(replyForm.getReplyContent());
		reply.setName(replyForm.getName());
		reply.setEmail(replyForm.getEmail());
		reply.setPhoneNumber(replyForm.getSdt());
			
			try {
				this.replyService.saveReply(reply);
				response.setStatus("SUCCESS");
			} catch (Exception e) {
				
				e.printStackTrace();
				response.setStatus("FAIL");
			
			}
		}

		else {
			response.setStatus("FAIL");
			response.setResult(results.getAllErrors());
		}

		return response;

	}


}
