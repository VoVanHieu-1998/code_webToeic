package com.dacnpm.toeic2020.Controller.Rest;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dacnpm.toeic2020.Model.Part3;
import com.dacnpm.toeic2020.Model.Part3Question;
import com.dacnpm.toeic2020.Model.QuestionDTO;
import com.dacnpm.toeic2020.Model.VocabularyTrue;
import com.dacnpm.toeic2020.Model.Vocabularycontent;
import com.dacnpm.toeic2020.Service.Part3ListeningService;
import com.dacnpm.toeic2020.Service.VocabularyListeningService;
import com.dacnpm.toeic2020.Service.VocabularyService;

@Controller
@RequestMapping("API/")
public class RestVocabularyController {

	@Autowired
	VocabularyService iVocabularyService;
	
	@Autowired
	VocabularyListeningService vocabularyListeningService;

	@RequestMapping(value = "checkvocabulary", method = RequestMethod.POST, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@PostMapping("checkvocabulary")
	@ResponseBody
	public Vocabularycontent checkVocabulary(@RequestBody List<VocabularyTrue> vocabularyTrues) {

		Set<VocabularyTrue> part3Questions = new HashSet<>();
		Vocabularycontent vocabularycontent = this.vocabularyListeningService.findVocabularyContentById(vocabularyTrues.get(0).getIdvocabularytrue());

		for (VocabularyTrue questionDTO : vocabularyTrues) {
			
			if(vocabularycontent.getNamevocabularycontent().equals(questionDTO.getIdvocabularytrue())) {
				
			}

				

			

		}

		Vocabularycontent vocabulary = new Vocabularycontent();

		return vocabulary;

	}
}