package com.dacnpm.toeic2020.Controller.Rest;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.dacnpm.toeic2020.Model.Part4;
import com.dacnpm.toeic2020.Model.Part4Question;
import com.dacnpm.toeic2020.Model.Part4QuestionExplantation;
import com.dacnpm.toeic2020.Model.Part4Result;
import com.dacnpm.toeic2020.Model.QuestionDTO;
import com.dacnpm.toeic2020.Service.Part3ListeningService;
import com.dacnpm.toeic2020.Service.Part4ListeningService;
@Controller
@RequestMapping("API/")
public class RestPart4Controller {

	@Autowired
	Part4ListeningService part4ListeningService;

	@RequestMapping(value = "checkAnswerPart4", method = RequestMethod.POST, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Part4 checkPart4(@RequestBody List<QuestionDTO> questionDTOs) {

		Part4Question part4Question;
		Set<Part4Question> part4Questions = new HashSet<>();
		Part4 part4 = this.part4ListeningService.findById(questionDTOs.get(0).getIdPart());
		Part4QuestionExplantation part4QuestionExplantaion;
		for (QuestionDTO questionDTO : questionDTOs) {
			System.out.println(
					questionDTO.getIdPart() + "_" + questionDTO.getIdQuestion() + "_" + questionDTO.getAnswer());
			for (Part4Question p4Question : part4.getPart4Questions()) {

				if (questionDTO.getIdQuestion() == p4Question.getId()) {

					int istrue = 0;

					if (p4Question.getOp_true().equals(questionDTO.getAnswer())) {
						istrue = 1;
					}
					
					
					part4QuestionExplantaion = new Part4QuestionExplantation(p4Question.getPart4QuestionExplantation().getId(),
							p4Question.getPart4QuestionExplantation().getMeanContent(), 
							p4Question.getPart4QuestionExplantation().getMean_op1(),
							p4Question.getPart4QuestionExplantation().getMean_op2(),
							p4Question.getPart4QuestionExplantation().getMean_op3(),
							p4Question.getPart4QuestionExplantation().getMean_op4(), p4Question.getPart4QuestionExplantation().getExplantation());
					
					part4Question = new Part4Question(p4Question.getId(), p4Question.getContent(), p4Question.getOp1(),
							p4Question.getOp2(), p4Question.getOp3(), p4Question.getOp4(), p4Question.getOp_true(),
							p4Question.getOrder(), part4QuestionExplantaion, p4Question.getIsTrue());
					part4Questions.add(part4Question);
				}

			}

		}

		Part4 p4 = new Part4(part4.getId(),part4.getPart4_questrionTranslate(), part4Questions);

		return p4;

	}
	
	@RequestMapping(value = "exam/part4/setStatusAnswer/{groupNum}", method = RequestMethod.GET, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Part4Question> setStatusAnswerpart4ForExam(HttpSession session,@PathVariable(name = "groupNum") int groupNum) {
	
		List<Part4Result> part4Results = (List<Part4Result>) session.getAttribute("part4Results");
		
		Part4 part4 = part4Results.get(groupNum).getPart4_PartResult();
		
		List<Part4Question> listPart4Q = new ArrayList<>();
		Part4Question part4Question;
		for(Part4Question p4: part4.getPart4Questions()) {
			part4Question= new Part4Question(p4.getId(), p4.getContent(), p4.getOp1(), p4.getOp2(),p4.getOp3(),
					p4.getOp4(),p4.getOp_true(), p4.getIsTrue(),p4.getOrder(), p4.getOpSelected());
			listPart4Q.add(part4Question);
		}
		
		return listPart4Q;
	}


}
