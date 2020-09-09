package com.dacnpm.toeic2020.Controller.Admin.MakeExam;

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

import com.dacnpm.toeic2020.Model.Examination;
import com.dacnpm.toeic2020.Model.GrammarGuideline;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Service.ExaminationService;
import com.dacnpm.toeic2020.Service.PracticeGrammarService;
import com.dacnpm.toeic2020.Utils.Constant;
import com.dacnpm.toeic2020.Validator.ExamValidator;
import com.dacnpm.toeic2020.Validator.PracticeGrammarValidator;

@Controller
public class ExamController {

	@Autowired
	ExaminationService examinationService;

	@Autowired
	ExamValidator examValidator;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		if (binder.getTarget() == null) {
			return;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
		if (binder.getTarget().getClass() == Examination.class) {
			binder.setValidator(examValidator);
		}
	}

	@RequestMapping(value = { "admin/exam/list", "admin/exam/list/" })
	public String redirect() {
		return "redirect:/admin/exam/list/1";
	}

	@RequestMapping("/admin/exam/list/{page}")
	public String showProductInfoList(HttpSession session, Model model,
			@ModelAttribute("searchExamform") Examination examination, @PathVariable("page") int page) {

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

		List<Examination> list = this.examinationService.getAll(examination, pagging);
		if(list.size() != 0) {
		
			model.addAttribute("exams", list);
			model.addAttribute("pageInfo", pagging);
			
		}
		

		return "exam-list";
	}

	@GetMapping("/admin/exam/add")
	public String addCategory(Model model) {

		model.addAttribute("modelForm", new Examination());
		model.addAttribute("titlePage", "Add Examination");

		model.addAttribute("viewOnly", false);

		return "exam-action";
	}

	@PostMapping("/admin/exam/add")
	public String addGrammar(@ModelAttribute("modelForm") @Validated Examination examination,
			BindingResult result, Model model, HttpSession session) {

		if (result.hasErrors()) {
			if (examination.getId() != null) {
				model.addAttribute("titlePage", "Edit examination");
			} else {
				model.addAttribute("titlePage", "Add examination");
			}

			model.addAttribute("modelForm", examination);
			model.addAttribute("viewOnly", false);

			return "exam-action";
		}

		// update
		if (examination.getId() != null && examination.getId() != 0) {
			try {
				examinationService.updatePart1Quess(examination);
				session.setAttribute(Constant.MSG_SUCCESS, "Update success !!!");

			} catch (Exception e) {
				session.setAttribute(Constant.MSG_ERROR, "Update faild !!!");
			}
		}
		// add
		else {
			try {

				examinationService.savePart1Quess(examination);
				session.setAttribute(Constant.MSG_SUCCESS, "Add success !!!");

			} catch (Exception e) {
				session.setAttribute(Constant.MSG_ERROR, "Add faild !!!");
			}

		}

		return "redirect:/admin/exam/list";

	}

	@GetMapping("/admin/exam/edit/{id}")
	public String editProductInfo(@PathVariable("id") int id, Model model) {
		Examination examination = this.examinationService.getExamById(id);
		if (examination != null) {

			model.addAttribute("titlePage", "Edit examination");
			model.addAttribute("viewOnly", false);
			model.addAttribute("modelForm", examination);
			return "exam-action";
		}

		return "redirect:/admin/exam/list";

	}

	@GetMapping("/admin/exam/view/{id}")
	public String view(@PathVariable("id") int id, Model model) {
		
			return "redirect:/admin/grammar/list";
		

	}

	@GetMapping("/admin/exam/delete/{id}")
	public String deleteProductInfo(@PathVariable("id") int id, Model model, HttpSession session) {
		Examination examination = this.examinationService.getExamById(id);

		if (examination != null) {
			try {
				examinationService.deletePartQuess(examination);

				session.setAttribute(Constant.MSG_SUCCESS, "Delete success !!!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				session.setAttribute(Constant.MSG_ERROR, "Delete has error !!!");
				e.printStackTrace();
			}

		}

		return "redirect:/admin/exam/list";
	}

}
