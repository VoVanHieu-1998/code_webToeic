package com.dacnpm.toeic2020.Controller.Rest;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dacnpm.toeic2020.Model.Part3;
import com.dacnpm.toeic2020.Model.Part3Question;
import com.dacnpm.toeic2020.Model.Part3QuestionExplantaion;
import com.dacnpm.toeic2020.Model.Part3Result;
import com.dacnpm.toeic2020.Model.Part3ResultQuestion;
import com.dacnpm.toeic2020.Model.Part7;
import com.dacnpm.toeic2020.Model.Part7ReadingQuestion;
import com.dacnpm.toeic2020.Model.Part7Result;
import com.dacnpm.toeic2020.Model.QuestionDTO;
import com.dacnpm.toeic2020.Service.Part3ListeningService;

@Controller
@RequestMapping("API/")
public class RestPart3Controller {

	@Autowired
	Part3ListeningService part3ListeningService;

	@RequestMapping(value = "checkAnswer", method = RequestMethod.POST, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@PostMapping("checkAnswer")
	@ResponseBody
	public Part3 checkPart3(@RequestBody List<QuestionDTO> questionDTOs) {

		Part3Question part3Question;
		Set<Part3Question> part3Questions = new HashSet<>();
		Part3 part3 = this.part3ListeningService.findById(questionDTOs.get(0).getIdPart());
		Part3QuestionExplantaion part3QuestionExplantaion = null;
		for (QuestionDTO questionDTO : questionDTOs) {
			System.out.println(
					questionDTO.getIdPart() + "_" + questionDTO.getIdQuestion() + "_" + questionDTO.getAnswer());
			for (Part3Question p3Question : part3.getPart3Questions()) {

				if (questionDTO.getIdQuestion() == p3Question.getId()) {

					int istrue = 0;

					if (p3Question.getOp_true().equals(questionDTO.getAnswer())) {
						istrue = 1;
					}
					if(p3Question.getPart3QuestionExplantaion() != null) {
						part3QuestionExplantaion = new Part3QuestionExplantaion(
								p3Question.getPart3QuestionExplantaion().getId(),
								p3Question.getPart3QuestionExplantaion().getMeanContent(),
								p3Question.getPart3QuestionExplantaion().getMean_op1(),
								p3Question.getPart3QuestionExplantaion().getMean_op2(),
								p3Question.getPart3QuestionExplantaion().getMean_op3(),
								p3Question.getPart3QuestionExplantaion().getMean_op4(),
								p3Question.getPart3QuestionExplantaion().getExplantation());	
					}
					
					
					part3Question = new Part3Question(p3Question.getId(), p3Question.getContent(), p3Question.getOp1(),
							p3Question.getOp2(), p3Question.getOp3(), p3Question.getOp4(), p3Question.getOp_true(),
							p3Question.getOrder(), part3QuestionExplantaion, p3Question.getIsTrue());
					part3Questions.add(part3Question);
				}

			}

		}

		Part3 p3 = new Part3(part3.getId(), part3Questions, part3.getPart3_questrionTranslate(), part3.getActiveFlag(),
				part3.getCreateDate(), part3.getUpdateDate());

		return p3;

	}
	
	@RequestMapping(value = "exam/part3/setStatusAnswer/{groupNum}", method = RequestMethod.GET, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Part3Question> setStatusAnswerpart3ForExam(HttpSession session,@PathVariable(name = "groupNum") int groupNum) {
	
		List<Part3Result> part3Results = (List<Part3Result>) session.getAttribute("part3Results");
		
		Part3 part3 = part3Results.get(groupNum).getPart3_PartResult();
		
		List<Part3Question> listPart3Q = new ArrayList<>();
		Part3Question part3Question;
		for(Part3Question p3: part3.getPart3Questions()) {
			part3Question= new Part3Question(p3.getId(), p3.getContent(), p3.getOp1(), p3.getOp2(),p3.getOp3(),p3.getOp4(),p3.getOp_true(), p3.getOrder(), p3.getOpSelected(),p3.getIsTrue());
			listPart3Q.add(part3Question);
		}
		
		return listPart3Q;
	}

}
