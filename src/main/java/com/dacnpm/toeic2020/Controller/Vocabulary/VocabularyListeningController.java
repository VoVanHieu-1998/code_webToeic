package com.dacnpm.toeic2020.Controller.Vocabulary;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.VocabularyQuestion;
import com.dacnpm.toeic2020.Model.VocabularyTrue;
import com.dacnpm.toeic2020.Model.Vocabularycontent;
import com.dacnpm.toeic2020.Model.Vocabularyline;
import com.dacnpm.toeic2020.Service.VocabularyListeningService;
import com.dacnpm.toeic2020.Service.VocabularyService;

@Controller
@RequestMapping("/vocabulary/test/")
public class VocabularyListeningController {
	@Autowired
	VocabularyListeningService vocabularyListeningService;
	@Autowired
	VocabularyService vocabularyService;
	
	@GetMapping("question/{id}")
	public String Question(@PathVariable int id,ModelMap modelMap) {
		Vocabularycontent vocabularycontent =vocabularyListeningService.findVocabularyContentById(id);
		
		Set<VocabularyTrue> setList= vocabularycontent.getVocabularyTrue();
		
		
		Set<VocabularyQuestion> setquestion=vocabularycontent.getVocabularyQuestion();
		
		Pagging pagging = new Pagging(6);
		

		List<Vocabularyline> listtuvung = vocabularyService.getAll(new Vocabularyline(), pagging);
		
		modelMap.addAttribute("listtuvung", listtuvung);
		
		modelMap.addAttribute("listtuvung", listtuvung);
		modelMap.addAttribute("vocabularycontent", vocabularycontent);
		modelMap.addAttribute("setList", setList);
		modelMap.addAttribute("setquestion", setquestion);
		//return "listening-vocabulary-question";
		return "listquestionvocabulary";
	}
}
