package com.dacnpm.toeic2020.Controller.Rest;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.dacnpm.toeic2020.Model.Part2Question;
import com.dacnpm.toeic2020.Model.Part2Result;
import com.dacnpm.toeic2020.Model.Part5Question;
import com.dacnpm.toeic2020.Model.Part5QuestionResult;

import com.dacnpm.toeic2020.Model.Part2;
import com.dacnpm.toeic2020.Model.Part2Question;
import com.dacnpm.toeic2020.Model.QuestionDTO;
import com.dacnpm.toeic2020.Service.Part2ListeningService;


@Controller
@RequestMapping("API/")
public class RestPart2Controller {


	public void sortPart2Ques(List<Part2Question> part2Questions) {
		Collections.sort(part2Questions, new Comparator<Part2Question>() {

			@Override
			public int compare(Part2Question o1, Part2Question o2) {

				return o1.getIndexQ() - o2.getIndexQ();
			}

		});
	}

	@RequestMapping(value = "exam/part2/setStatusAnswer", method = RequestMethod.GET, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Part2Question> setStatusAnswerForExam(HttpSession session) {

		List<Part2Result> part2QuestionResults = (List<Part2Result>) session.getAttribute("part2Results");
		List<Part2Question> part2Questions = new ArrayList<Part2Question>();

		for (Part2Result p2qr : part2QuestionResults) {
			part2Questions.add(p2qr.getPart2Question_Result());
		}

		sortPart2Ques(part2Questions);
		List<Part2Question> listPart2Q = new ArrayList<>();
		Part2Question part2Question;

		for (Part2Question p2 : part2Questions) {
			part2Question = new Part2Question(p2.getId(), p2.getContent(), p2.getMp3(), p2.getOp1(), p2.getOp2(),
					p2.getOp3(), p2.getOp_true(), p2.getOpSelected());
			listPart2Q.add(part2Question);
		}

		return listPart2Q;
	}


	@Autowired
	Part2ListeningService part2ListeningService;

	@RequestMapping(value = "checkAnswerPart2", method = RequestMethod.POST, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@PostMapping("checkAnswerPart2")
	@ResponseBody
	public Part2 checkPart2(@RequestBody List<QuestionDTO> questionDTOs) {
		
		Part2Question part2Question;
		Set<Part2Question> part2Questions = new HashSet<>();
		Part2 part2 = this.part2ListeningService.findById(questionDTOs.get(0).getIdPart());

		for (QuestionDTO questionDTO : questionDTOs) {
			System.out.println(
					questionDTO.getIdPart() + "_" + questionDTO.getIdQuestion() + "_" + questionDTO.getAnswer());
			for (Part2Question p2Question : part2.getPart2Questions()) {

				if (questionDTO.getIdQuestion() == p2Question.getId()) {

					int istrue = 0;

					if (p2Question.getOp_true().equals(questionDTO.getAnswer())) {
						istrue = 1;
					}

					part2Question = new Part2Question(p2Question.getId(), p2Question.getQuestionExplantation_part2(),
							p2Question.getContent(), p2Question.getOp1(), p2Question.getOp2(), p2Question.getOp3(),
							p2Question.getOp_true(), istrue);
					part2Questions.add(part2Question);
				}

			}

		}

		Part2 p2 = new Part2(part2.getId(), part2Questions, part2.getMp3(),part2.getType(), part2.getActiveFlag(),
				part2.getCreateDate(), part2.getUpdateDate());

		return p2;

	}

}
