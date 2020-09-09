package com.dacnpm.toeic2020.Controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dacnpm.toeic2020.Model.Comment;
import com.dacnpm.toeic2020.Model.GrammarGuideline;
import com.dacnpm.toeic2020.Model.Pagging;

import com.dacnpm.toeic2020.Service.PracticeGrammarService;

@Controller
public class GrammarGuidelineController {

	@Autowired
	PracticeGrammarService practiceGrammarService;
	
	
	@RequestMapping(value = { "grammar-guideline", "grammar-guideline/" })
	public String redirect() {
		return "redirect:/grammar-guideline/1";
	}
	
	@RequestMapping("/grammar-guideline/{page}")
	public String grammarGuidelineList(Model model,@PathVariable(name="page") int page,HttpSession session) {

		Pagging pagging = new Pagging(3);
		pagging.setIndexPage(page);

		session.setAttribute("page", page);
		
		List<GrammarGuideline> grammarGuidelines = this.practiceGrammarService.getAll(new GrammarGuideline(), pagging);
		model.addAttribute("grammarGuidelines", grammarGuidelines);
		model.addAttribute("pageInfo", pagging);	
		return "grammar-guideline-list";
	}
	
	@RequestMapping("/grammar-guideline/detail/{id}")
	public String grammarGuidelineDetail(Model model,@PathVariable(name="id") int id) {
	
		GrammarGuideline grammar = this.practiceGrammarService.findGrammarById(id);
		Set<Comment> comments = grammar.getComments();
		
		
		
		model.addAttribute("grammarGuideline", grammar);	
		
		model.addAttribute("comments", comments);	
		
		return "grammar-guideline-detail";
	}
	
	
	
	

}
