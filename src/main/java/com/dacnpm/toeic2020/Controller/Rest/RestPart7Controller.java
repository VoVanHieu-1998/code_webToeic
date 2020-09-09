package com.dacnpm.toeic2020.Controller.Rest;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dacnpm.toeic2020.Model.Part5Question;
import com.dacnpm.toeic2020.Model.Part5QuestionResult;
import com.dacnpm.toeic2020.Model.Part7;
import com.dacnpm.toeic2020.Model.Part7ReadingQuestion;
import com.dacnpm.toeic2020.Model.Part7ReadingQuestionResult;
import com.dacnpm.toeic2020.Model.Part7Result;

@Controller
@RequestMapping("API/")
public class RestPart7Controller {

	public void sortPart7Ques(List<Part7ReadingQuestion> part7ReadingQuestions) {
		Collections.sort(part7ReadingQuestions, new Comparator<Part7ReadingQuestion>() {

			@Override
			public int compare(Part7ReadingQuestion o1, Part7ReadingQuestion o2) {

				return o1.getOrder() - o2.getOrder();
			}

		});
	}
	public void sortPart7(List<Part7> part7) {
		Collections.sort(part7, new Comparator<Part7>() {

			@Override
			public int compare(Part7 o1, Part7 o2) {

				return o1.getOrder() - o2.getOrder();
			}

		});
	}
	@RequestMapping(value = "exam/part7/setStatusAnswer/{groupNum}", method = RequestMethod.GET, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Part7ReadingQuestion> setStatusAnswerpart7ForExam(HttpSession session,@PathVariable(name = "groupNum") int groupNum) {
	
		List<Part7Result> part7Results = (List<Part7Result>) session.getAttribute("part7Results");
		
		Part7 part7 = part7Results.get(groupNum).getPart7_PartResult();
		
		List<Part7ReadingQuestion> listPart7Q = new ArrayList<>();
		Part7ReadingQuestion part7Question;
		for(Part7ReadingQuestion p7: part7.getPart7ReadingQuestions()) {
			part7Question= new Part7ReadingQuestion(p7.getId(), p7.getContent(), p7.getOp1(), p7.getOp2(),p7.getOp3(),p7.getOp4(),p7.getOp_true(), p7.getOrder(),p7.getIsTrue(), p7.getOpSelected());
			listPart7Q.add(part7Question);
		}
		
		return listPart7Q;
	}
}
