package com.dacnpm.toeic2020.Controller.Vocabulary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dacnpm.toeic2020.Model.Vocabularyline;

import com.dacnpm.toeic2020.Service.VocabularyService;

@Controller
@RequestMapping("/vocabularycontent")
public class VocabularyContentController {
	@Autowired
	VocabularyService vocabularyService;
	@GetMapping("/{idvocabulary}")
	public String defaul(@PathVariable int idvocabulary,ModelMap model ) {
		Vocabularyline vocabularyline=vocabularyService.findVocabularyById(idvocabulary);
		model.addAttribute("vocabularyline", vocabularyline);
		
		return "vocabularycontent";
	}
}
