package com.dacnpm.toeic2020.Controller.Admin;

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
import com.dacnpm.toeic2020.Service.PracticeGrammarService;
import com.dacnpm.toeic2020.Utils.Constant;
import com.dacnpm.toeic2020.Validator.PracticeGrammarValidator;

@Controller

public class PracticeGrammarController {

	@Autowired
	PracticeGrammarService practiceGrammarService;

	@Autowired
	PracticeGrammarValidator PracticeGrammarValidator;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		if (binder.getTarget() == null) {
			return;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
		if (binder.getTarget().getClass() == GrammarGuideline.class) {
			binder.setValidator(PracticeGrammarValidator);
		}
	}

	@RequestMapping(value = { "admin/grammar/list", "admin/grammar/list/" })
	public String redirect() {
		return "redirect:/admin/grammar/list/1";
	}

	@RequestMapping("/admin/grammar/list/{page}")
	public String showProductInfoList(HttpSession session, Model model,
			@ModelAttribute("searchGrammarform") GrammarGuideline grammarGuideline, @PathVariable("page") int page) {

		Pagging pagging = new Pagging(5);
		pagging.setIndexPage(page);

		if (session.getAttribute(Constant.MSG_SUCCESS) != null) {
			model.addAttribute(Constant.MSG_SUCCESS, session.getAttribute(Constant.MSG_SUCCESS));
			session.removeAttribute(Constant.MSG_SUCCESS);
		}
		if (session.getAttribute(Constant.MSG_ERROR) != null) {
			model.addAttribute(Constant.MSG_ERROR, session.getAttribute(Constant.MSG_ERROR));
			session.removeAttribute(Constant.MSG_ERROR);
		}

		List<GrammarGuideline> list = this.practiceGrammarService.getAll(grammarGuideline, pagging);
		if(list.size() != 0) {
		
			model.addAttribute("grammars", list);
			model.addAttribute("pageInfo", pagging);
			
		}
		

		return "practice-grammar-list";
	}

	@GetMapping("/admin/grammar/add")
	public String addCategory(Model model) {

		model.addAttribute("modelForm", new GrammarGuideline());
		model.addAttribute("titlePage", "Add Grammar Guideline");

		model.addAttribute("viewOnly", false);

		return "practice-grammar-action";
	}

	@PostMapping("/admin/grammar/add")
	public String addGrammar(@ModelAttribute("modelForm") @Validated GrammarGuideline grammarGuideline,
			BindingResult result, Model model, HttpSession session) {

		if (result.hasErrors()) {
			if (grammarGuideline.getId() != null) {
				model.addAttribute("titlePage", "Edit grammar guideline");
			} else {
				model.addAttribute("titlePage", "Add grammar guideline");
			}

			model.addAttribute("modelForm", grammarGuideline);
			model.addAttribute("viewOnly", false);

			return "practice-grammar-action";
		}

		// update
		if (grammarGuideline.getId() != null && grammarGuideline.getId() != 0) {
			try {
				practiceGrammarService.updateGrammar(grammarGuideline);
				session.setAttribute(Constant.MSG_SUCCESS, "Update success !!!");

			} catch (Exception e) {
				session.setAttribute(Constant.MSG_ERROR, "Update faild !!!");
			}
		}
		// add
		else {
			try {

				practiceGrammarService.saveGrammar(grammarGuideline);
				session.setAttribute(Constant.MSG_SUCCESS, "Add success !!!");

			} catch (Exception e) {
				session.setAttribute(Constant.MSG_ERROR, "Add faild !!!");
			}

		}

		return "redirect:/admin/grammar/list";

	}

	@GetMapping("/admin/grammar/edit/{id}")
	public String editProductInfo(@PathVariable("id") int id, Model model) {
		GrammarGuideline grammarGuideline = this.practiceGrammarService.findGrammarById(id);
		if (grammarGuideline != null) {

			model.addAttribute("titlePage", "Edit grammar guideline");
			model.addAttribute("viewOnly", false);
			model.addAttribute("modelForm", grammarGuideline);
			return "practice-grammar-action";
		}

		return "redirect:/admin/grammar/list";

	}

	@GetMapping("/admin/grammar/view/{id}")
	public String view(@PathVariable("id") int id, Model model) {
		GrammarGuideline grammarGuideline = this.practiceGrammarService.findGrammarById(id);

		if (grammarGuideline != null) {
			model.addAttribute("titlePage", "View grammar guideline");
			model.addAttribute("viewOnly", true);
			model.addAttribute("modelForm", grammarGuideline);

			return "practice-grammar-action";
		} else {

			return "redirect:/admin/grammar/list";
		}

	}

	@GetMapping("/practice/grammar/delete/{id}")
	public String deleteProductInfo(@PathVariable("id") int id, Model model, HttpSession session) {
		GrammarGuideline grammarGuideline = this.practiceGrammarService.findGrammarById(id);

		if (grammarGuideline != null) {
			try {
				practiceGrammarService.deteteGrammar(grammarGuideline);

				session.setAttribute(Constant.MSG_SUCCESS, "Delete success !!!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				session.setAttribute(Constant.MSG_ERROR, "Delete has error !!!");
				e.printStackTrace();
			}

		}

		return "redirect:/admin/grammar/list";
	}

}
