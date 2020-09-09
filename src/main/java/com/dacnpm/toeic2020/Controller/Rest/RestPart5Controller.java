package com.dacnpm.toeic2020.Controller.Rest;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dacnpm.toeic2020.Model.Part4;
import com.dacnpm.toeic2020.Model.Part4Question;
import com.dacnpm.toeic2020.Model.Part4QuestionExplantation;
import com.dacnpm.toeic2020.Model.Part5Lesson;
import com.dacnpm.toeic2020.Model.Part5Question;
import com.dacnpm.toeic2020.Model.Part5QuestionExplantation;
import com.dacnpm.toeic2020.Model.Part5QuestionResult;
import com.dacnpm.toeic2020.Model.QuestionDTO;
import com.dacnpm.toeic2020.Service.Part4ListeningService;
import com.dacnpm.toeic2020.Service.Part5LessonService;
import com.dacnpm.toeic2020.Service.Part5ReadingService;

@Controller
@RequestMapping("API/")
public class RestPart5Controller {

	@Autowired
	Part5LessonService part5LessonService;

	@Autowired
	Part5ReadingService part5ReadingService;

	public void sortPart5Ques(List<Part5Question> part5Questions) {
		Collections.sort(part5Questions, new Comparator<Part5Question>() {

			@Override
			public int compare(Part5Question o1, Part5Question o2) {

				return o1.getOrder() - o2.getOrder();
			}

		});
	}
	
	@RequestMapping(value = "exam/part5/setStatusAnswer", method = RequestMethod.GET, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Part5Question> setStatusAnswerForExam(HttpSession session) {
	
		List<Part5QuestionResult> part5QuestionResults = (List<Part5QuestionResult>) session.getAttribute("part5Results");
		List<Part5Question> part5Questions = new ArrayList<Part5Question>();
		
		for(Part5QuestionResult p5qr: part5QuestionResults) {
			part5Questions.add(p5qr.getPart5Question_Result());
		}
		
		sortPart5Ques(part5Questions);
		List<Part5Question> listPart5Q = new ArrayList<>();
		Part5Question part5Question;
		for(Part5Question p5: part5Questions) {
			part5Question= new Part5Question(p5.getId(), p5.getContent(), p5.getOp1(), p5.getOp2(),p5.getOp3(),p5.getOp4(),p5.getOp_true(), p5.getOrder(), p5.getOpSelected(),p5.getIsTrue());
			listPart5Q.add(part5Question);
		}
		
		return listPart5Q;
	}

	@RequestMapping(value = "checkAnswerQuestionPart5", method = RequestMethod.POST, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Part5Question checkPart5(@RequestBody List<QuestionDTO> questionDTOs, HttpSession httpSession) {

		System.out.println("idf" + questionDTOs.get(0).getIdQuestion());
		try {
			Part5Question part5Question = part5ReadingService.findByProperty("id", questionDTOs.get(0).getIdQuestion())
					.get(0);
			System.out.println("fdsfsdfsdfsdfsd" + part5Question.getId());
			Part5Question p5Q;
			Part5QuestionExplantation part5QuestionExplantation = null;

			int istrue = 0;
			if (questionDTOs.get(0).getIdQuestion() == part5Question.getId()) {

				if (part5Question.getOp_true().equals(questionDTOs.get(0).getAnswer())) {
					istrue = 1;
				}
				if (part5Question.getPart5QuestionExplantaion() != null) {
					part5QuestionExplantation = new Part5QuestionExplantation(
							part5Question.getPart5QuestionExplantaion().getId(),
							part5Question.getPart5QuestionExplantaion().getMeanContent(),
							part5Question.getPart5QuestionExplantaion().getMean_op1(),
							part5Question.getPart5QuestionExplantaion().getMean_op2(),
							part5Question.getPart5QuestionExplantaion().getMean_op3(),
							part5Question.getPart5QuestionExplantaion().getMean_op4(),
							part5Question.getPart5QuestionExplantaion().getExplantation());
				}

			}

			p5Q = new Part5Question(part5Question.getId(), part5Question.getContent(), part5Question.getOp1(),
					part5Question.getOp2(), part5Question.getOp3(), part5Question.getOp4(), part5Question.getOp_true(),
					part5Question.getOrder(), questionDTOs.get(0).getAnswer(), part5QuestionExplantation, istrue);

			if (httpSession.getAttribute("practicePart5Review") == null) {

				List<Part5Question> part5Questions = new ArrayList<Part5Question>();
				part5Questions.add(p5Q);

				httpSession.setAttribute("practicePart5Review", part5Questions);

			} else {
				List<Part5Question> listPart5Q = (List<Part5Question>) httpSession.getAttribute("practicePart5Review");
				listPart5Q.add(p5Q);
				httpSession.setAttribute("practicePart5Review", listPart5Q);
				for (Part5Question p5 : listPart5Q) {
					System.out.println(p5.getContent() + " " + p5.getOpSelected());
				}

			}

			return p5Q;

		} catch (Exception e) {

			System.out.println(e.getMessage());
		}
		return null;
	}
	

	@RequestMapping(value = "practice/part5/setStatusAnswer", method = RequestMethod.GET, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Part5Question> setStatusAnswer(HttpSession session) {
		List<Part5Question> part5Questions = (List<Part5Question>) session.getAttribute("practicePart5Review");
		return part5Questions;
	}
	
}
