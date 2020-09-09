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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dacnpm.toeic2020.Model.Part1;
import com.dacnpm.toeic2020.Model.Part1Question;
import com.dacnpm.toeic2020.Model.Part1Result;
import com.dacnpm.toeic2020.Model.Part2Question;
import com.dacnpm.toeic2020.Model.Part2Result;
import com.dacnpm.toeic2020.Model.QuestionDTO;
import com.dacnpm.toeic2020.Service.Part1ListeningService;

@Controller
@RequestMapping("API/")
public class RestPart1Controller {
	@Autowired
	Part1ListeningService part1ListeningService;

	public void sortPart1Ques(List<Part1Question> part1Questions) {
		Collections.sort(part1Questions, new Comparator<Part1Question>() {

			@Override
			public int compare(Part1Question o1, Part1Question o2) {

				return o1.getIndexQ() - o2.getIndexQ();
			}

		});
	}

	@RequestMapping(value = "exam/part1/setStatusAnswer", method = RequestMethod.GET, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Part1Question> setStatusAnswerForExam(HttpSession session) {

		List<Part1Result> part1QuestionResults = (List<Part1Result>) session.getAttribute("part1Results");
		List<Part1Question> part1Questions = new ArrayList<Part1Question>();

		for (Part1Result p1qr : part1QuestionResults) {
			part1Questions.add(p1qr.getPart1Question_Result());
		}

		sortPart1Ques(part1Questions);
		List<Part1Question> listPart1Q = new ArrayList<>();
		Part1Question part1Question;

		for (Part1Question p1 : part1Questions) {
			part1Question = new Part1Question(p1.getId(), p1.getIndexQ(), p1.getImg(), p1.getOp1(), p1.getOp2(),
					p1.getOp3(),p1.getOp4(), p1.getOp_true(),p1.getIsTrue(), p1.getOpSelected());
			listPart1Q.add(part1Question);
		}

		return listPart1Q;
	}
	
	
	
	@RequestMapping(value = "checkAnswerPart1", method = RequestMethod.POST, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@PostMapping("checkAnswerPart1")
	@ResponseBody
	public Part1 checkPart1(@RequestBody List<QuestionDTO> questionDTOs) {

		Part1Question part1Question;
		Set<Part1Question> part1Questions = new HashSet<>();
		Part1 part1 = this.part1ListeningService.getPart1QuessById(questionDTOs.get(0).getIdPart());

		for (QuestionDTO questionDTO : questionDTOs) {
			System.out.println(
					questionDTO.getIdPart() + "_" + questionDTO.getIdQuestion() + "_" + questionDTO.getAnswer());
			for (Part1Question p1Question : part1.getPart1Questions()) {

				if (questionDTO.getIdQuestion() == p1Question.getId()) {

					int istrue = 0;

					if (p1Question.getOp_true().equals(questionDTO.getAnswer())) {
						istrue = 1;
					}

					part1Question = new Part1Question(p1Question.getId(), p1Question.getIndexQ(), p1Question.getImg(),
							p1Question.getOp1(), p1Question.getOp2(), p1Question.getOp3(), p1Question.getOp4(),p1Question.getOp_true(), istrue);
					part1Questions.add(part1Question);

				}

			}
		}

		Part1 p1 = new Part1(part1.getId(), part1Questions, part1.getMp3(), part1.getType(), part1.getActiveFlag(),
				part1.getCreateDate(), part1.getUpdateDate());

		return p1;

	}

}
