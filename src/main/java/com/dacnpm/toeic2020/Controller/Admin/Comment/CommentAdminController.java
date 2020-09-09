package com.dacnpm.toeic2020.Controller.Admin.Comment;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dacnpm.toeic2020.Model.Comment;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Vocabularyline;
import com.dacnpm.toeic2020.Service.CommentService;
import com.dacnpm.toeic2020.Utils.Constant;
import com.dacnpm.toeic2020.Validator.CommentValidator;

@Controller
public class CommentAdminController {
	@Autowired
	CommentService commentService;
	@Autowired
	CommentValidator commentvalidator;
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		if (binder.getTarget() == null) {
			return;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
		if (binder.getTarget().getClass() == Comment.class) {
			binder.setValidator(commentvalidator);
		}
	}
	
	@RequestMapping(value = { "admin/list/comment", "admin/list/comment/" })
	public String redirect() {
		return "redirect:/admin/list/comment/1";
	}

	@RequestMapping("/admin/list/comment/{page}")
	public String showProductInfoList(HttpSession session, Model model,
			 @PathVariable("page") int page) {

		Pagging pagging = new Pagging(3);
		pagging.setIndexPage(page);

		

		List<Comment> list = this.commentService.getAll(new Comment(), pagging);
		if(list.size() != 0) {
		
			model.addAttribute("comment", list);
			model.addAttribute("pageInfo", pagging);
			
		}
		

		return "comment-list";
	}
	@GetMapping("admin/comment/delete/{id}")
	public String deleteProductInfo(@PathVariable("id") int id, Model model, HttpSession session) {
		Comment vocabularyline = this.commentService.getCommentById(id);

		
				commentService.deleteComment(vocabularyline);

				session.setAttribute(Constant.MSG_SUCCESS, "Delete success !!!");
		

		

		return "redirect:/admin/list/comment";
	}
	

}
