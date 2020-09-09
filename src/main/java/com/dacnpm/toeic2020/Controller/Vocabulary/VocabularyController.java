package com.dacnpm.toeic2020.Controller.Vocabulary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Vocabularyline;

import com.dacnpm.toeic2020.Service.VocabularyService;

@Controller
public class VocabularyController {
	@Autowired
	VocabularyService vocabularyService;

	@RequestMapping(value = { "vocabulary/list", "vocabulary/list/" })
	public String redirect() {
		return "redirect:/vocabulary/list/1";
	}

	@RequestMapping(value = "/vocabulary/list/{page}")
	public String defaul(ModelMap model, @PathVariable("page") int page) {
		Pagging pagging = new Pagging(6);
		pagging.setIndexPage(page);

		List<Vocabularyline> listtuvung = vocabularyService.getAll(new Vocabularyline(), pagging);
		model.addAttribute("pageInfo", pagging);
		model.addAttribute("listtuvung", listtuvung);

		return "vocabulary";
	}
}
