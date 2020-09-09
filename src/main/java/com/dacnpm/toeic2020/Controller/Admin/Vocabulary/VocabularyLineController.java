package com.dacnpm.toeic2020.Controller.Admin.Vocabulary;

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

import com.dacnpm.toeic2020.Model.GrammarGuideline;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Vocabularyline;
import com.dacnpm.toeic2020.Service.VocabularyService;
import com.dacnpm.toeic2020.Utils.Constant;
import com.dacnpm.toeic2020.Validator.PracticeGrammarValidator;
import com.dacnpm.toeic2020.Validator.VocabularyValidator;

@Controller
public class VocabularyLineController {
	@Autowired
	VocabularyService vocabularyService;
	@Autowired
	VocabularyValidator vocabularyValidator;
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		if (binder.getTarget() == null) {
			return;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
		if (binder.getTarget().getClass() == Vocabularyline.class) {
			binder.setValidator(vocabularyValidator);
		}
	}
	
	@RequestMapping(value = { "admin/vocabulary/list", "admin/vocabulary/list/" })
	public String redirect() {
		return "redirect:/admin/vocabulary/list/1";
	}

	@RequestMapping("/admin/vocabulary/list/{page}")
	public String showProductInfoList(HttpSession session, Model model,
			@ModelAttribute("vocabularyline") Vocabularyline vocabularyline, @PathVariable("page") int page) {

		Pagging pagging = new Pagging(5);
		pagging.setIndexPage(page);

		

		List<Vocabularyline> list = this.vocabularyService.getAll(vocabularyline, pagging);
		if(list.size() != 0) {
		
			model.addAttribute("vocabulary", list);
			model.addAttribute("pageInfo", pagging);
			
		}
		

		return "vocabulary-list";
	}
	@GetMapping("admin/vocabulary/delete/{id}")
	public String deleteProductInfo(@PathVariable("id") int id, Model model, HttpSession session) {
		Vocabularyline vocabularyline = this.vocabularyService.findVocabularyById(id);

		
				vocabularyService.deteteVocabulary(vocabularyline);

				session.setAttribute(Constant.MSG_SUCCESS, "Delete success !!!");
		

		

		return "redirect:/admin/vocabulary/list";
	}
	

	

	

	@GetMapping("/admin/vocabulary/add")
	public String addCategory(Model model) {

		model.addAttribute("modelForm", new Vocabularyline());
		model.addAttribute("titlePage", "Add Topic Vocabulary");

		model.addAttribute("viewOnly", false);

		return "vocabulary-action";
	}

	@PostMapping("/admin/vocabulary/add")
	public String addVocabulary(@ModelAttribute("modelForm") @Validated Vocabularyline vocabularyline,
			BindingResult result, Model model, HttpSession session) {

		if (result.hasErrors()) {
			if (vocabularyline.getIdvocabulary() != null) {
				model.addAttribute("titlePage", "Edit Topic Vocabulary");
			} else {
				model.addAttribute("titlePage", "Add Topic Vocabulary");
			}

			model.addAttribute("modelForm", vocabularyline);
			model.addAttribute("viewOnly", false);

			return "vocabulary-action";
		}

		// update
		if (vocabularyline.getIdvocabulary() != null && vocabularyline.getIdvocabulary() != 0) {
			try {
				vocabularyService.updateVocabulary(vocabularyline);
				session.setAttribute(Constant.MSG_SUCCESS, "Update success !!!");

			} catch (Exception e) {
				session.setAttribute(Constant.MSG_ERROR, "Update faild !!!");
			}
		}
		// add
		else {
			try {

				vocabularyService.saveVocabulary(vocabularyline);
				session.setAttribute(Constant.MSG_SUCCESS, "Add success !!!");

			} catch (Exception e) {
				session.setAttribute(Constant.MSG_ERROR, "Add faild !!!");
			}

		}

		return "redirect:/admin/vocabulary/list";

	}

	@GetMapping("/admin/vocabulary/edit/{id}")
	public String editProductInfo(@PathVariable("id") int id, Model model) {
		Vocabularyline vocabularyline = this.vocabularyService.findVocabularyById(id);
		if (vocabularyline != null) {

			model.addAttribute("titlePage", "Edit Topic Vocabulary");
			model.addAttribute("viewOnly", false);
			model.addAttribute("modelForm", vocabularyline);
			return "vocabulary-action";
		}

		return "redirect:/admin/vocabulary/list";

	}

	@GetMapping("/admin/vocabulary/view/{id}")
	public String view(@PathVariable("id") int id, Model model) {
		Vocabularyline vocabularyline = this.vocabularyService.findVocabularyById(id);

		if (vocabularyline != null) {
			model.addAttribute("titlePage", "View Topic Vocabulary");
			model.addAttribute("viewOnly", true);
			model.addAttribute("modelForm", vocabularyline);

			return "vocabulary-action";
		} else {

			return "redirect:/admin/vocabulary/list";
		}

	}

	
}
