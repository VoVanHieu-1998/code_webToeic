package com.dacnpm.toeic2020.Controller.Admin.Vocabulary;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dacnpm.toeic2020.DAO.VocabularyListeningDAO;
import com.dacnpm.toeic2020.Model.Vocabularycontent;
import com.dacnpm.toeic2020.Model.Vocabularyline;
import com.dacnpm.toeic2020.Service.VocabularyListeningService;
import com.dacnpm.toeic2020.Service.VocabularyService;
import com.dacnpm.toeic2020.Utils.Constant;

@Controller
public class VocabularyContentAdminController {
	@Autowired
	VocabularyService vocabularyService;
	@Autowired
	VocabularyListeningService vocabularyListeningService;
	

	@RequestMapping("/admin/vocabularycontent/{id}")
	public String vocabulary(@PathVariable int id,ModelMap modelMap) {
		Vocabularyline vocabularyline=vocabularyService.findVocabularyById(id);
		modelMap.addAttribute("vocabularyline", vocabularyline);
		return "vocabularycontent-list";
	}
	@RequestMapping("/admin/vocabularycontent/delete/{id}")
	public String deleteProductInfo(@PathVariable("id") int id, Model model, HttpSession session) {
		Vocabularycontent vocabularycontent = this.vocabularyListeningService.findVocabularyContentById(id);

		
		vocabularyListeningService.deteteVocabularycontent(vocabularycontent);;

				session.setAttribute(Constant.MSG_SUCCESS, "Delete success !!!");
		

		

		return "redirect:/admin/vocabularycontent/1";
	}
	
	/*
	 * @GetMapping("/admin/vocabularycontent/add") public String addCategory(Model
	 * model) {
	 * 
	 * model.addAttribute("modelForm", new Vocabularyline());
	 * model.addAttribute("titlePage", "Add Topic Vocabulary");
	 * 
	 * model.addAttribute("viewOnly", false);
	 * 
	 * return "vocabulary-action"; }
	 * 
	 * @PostMapping("/admin/vocabulary/add") public String
	 * addVocabulary(@ModelAttribute("modelForm") @Validated Vocabularyline
	 * vocabularyline, BindingResult result, Model model, HttpSession session) {
	 * 
	 * if (result.hasErrors()) { if (vocabularyline.getIdvocabulary() != null) {
	 * model.addAttribute("titlePage", "Edit Topic Vocabulary"); } else {
	 * model.addAttribute("titlePage", "Add Topic Vocabulary"); }
	 * 
	 * model.addAttribute("modelForm", vocabularyline);
	 * model.addAttribute("viewOnly", false);
	 * 
	 * return "vocabulary-action"; }
	 * 
	 * // update if (vocabularyline.getIdvocabulary() != null &&
	 * vocabularyline.getIdvocabulary() != 0) { try {
	 * vocabularyService.updateVocabulary(vocabularyline);
	 * session.setAttribute(Constant.MSG_SUCCESS, "Update success !!!");
	 * 
	 * } catch (Exception e) { session.setAttribute(Constant.MSG_ERROR,
	 * "Update faild !!!"); } } // add else { try {
	 * 
	 * vocabularyService.saveVocabulary(vocabularyline);
	 * session.setAttribute(Constant.MSG_SUCCESS, "Add success !!!");
	 * 
	 * } catch (Exception e) { session.setAttribute(Constant.MSG_ERROR,
	 * "Add faild !!!"); }
	 * 
	 * }
	 * 
	 * return "redirect:/admin/vocabulary/list";
	 * 
	 * }
	 * 
	 * @GetMapping("/admin/vocabulary/edit/{id}") public String
	 * editProductInfo(@PathVariable("id") int id, Model model) { Vocabularyline
	 * vocabularyline = this.vocabularyService.findVocabularyById(id); if
	 * (vocabularyline != null) {
	 * 
	 * model.addAttribute("titlePage", "Edit Topic Vocabulary");
	 * model.addAttribute("viewOnly", false); model.addAttribute("modelForm",
	 * vocabularyline); return "vocabulary-action"; }
	 * 
	 * return "redirect:/admin/vocabulary/list";
	 * 
	 * }
	 * 
	 * @GetMapping("/admin/vocabulary/view/{id}") public String
	 * view(@PathVariable("id") int id, Model model) { Vocabularyline vocabularyline
	 * = this.vocabularyService.findVocabularyById(id);
	 * 
	 * if (vocabularyline != null) { model.addAttribute("titlePage",
	 * "View Topic Vocabulary"); model.addAttribute("viewOnly", true);
	 * model.addAttribute("modelForm", vocabularyline);
	 * 
	 * return "vocabulary-action"; } else {
	 * 
	 * return "redirect:/admin/vocabulary/list"; }
	 * 
	 * }
	 */
}
