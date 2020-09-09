package com.dacnpm.toeic2020.Controller.Exam;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dacnpm.toeic2020.Model.Examination;
import com.dacnpm.toeic2020.Model.Part1Result;
import com.dacnpm.toeic2020.Model.Part2Result;
import com.dacnpm.toeic2020.Model.Part3Result;
import com.dacnpm.toeic2020.Model.Part3ResultQuestion;
import com.dacnpm.toeic2020.Model.Part5QuestionResult;
import com.dacnpm.toeic2020.Model.Part7ReadingQuestionResult;
import com.dacnpm.toeic2020.Model.Part7Result;
import com.dacnpm.toeic2020.Model.Results;
import com.dacnpm.toeic2020.Model.User;
import com.dacnpm.toeic2020.Service.ExaminationService;
import com.dacnpm.toeic2020.Service.Part1ListeningService;
import com.dacnpm.toeic2020.Service.Part1ResultService;
import com.dacnpm.toeic2020.Service.Part2ResultService;
import com.dacnpm.toeic2020.Service.ResultService;
import com.dacnpm.toeic2020.Utils.Constant;

@Controller
public class ExamFinished {

	@Autowired
	Part1ResultService part1ResultService;

	@Autowired
	Part2ResultService part2ResultService;
	@Autowired
	ResultService resultService;

	@RequestMapping("exam/finished")
	public String examFinished(Model model, HttpSession session) {

		User user = (User) session.getAttribute(Constant.USER_INFO);

		Results result = (Results) session.getAttribute("result");

		try {
			this.resultService.saveResult(result);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Examination exam = (Examination) session.getAttribute("examination");

		int scorePart1 = 0;
		int scorePart2 = 0;
		int scorePart3 = 0;
		int scorePart5 = 0;
		int scorePart7 = 0;
		int countCorrectAnswerPart2 = 0;
		int countCorrectAnswerPart1 = 0;
		int countCorrectAnswerPart3 = 0;
		int countCorrectAnswerPart5 = 0;
		int countCorrectAnswerPart7 = 0;
		
		int totalScoreListening = 0;
		int totalScoreReading = 0;
				

		// luu ket qua cua part1
		try {
			List<Part1Result> part1Results = (List<Part1Result>) session.getAttribute("part1Results");
			if (part1Results != null) {
				for (Part1Result p1R : part1Results) {
					// part1ResultService.savePart1Result(p1R);
					if (p1R.getResult_ques() == 5) {
						scorePart1 += 5;
						countCorrectAnswerPart1++;
					}
				}
			}
		} catch (Exception e) {
			System.out.println("fsdfsdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff" + e.getMessage()
					+ " " + e.toString());
		}

		// luu ket qua cua part 2
		try {
			List<Part2Result> part2Results = (List<Part2Result>) session.getAttribute("part2Results");
			if (part2Results != null) {
				for (Part2Result part2Result : part2Results) {
					// part2ResultService.savePart2Result(part2Result);
					if (part2Result.getResult_ques() == 5) {
						scorePart2 += 5;
						countCorrectAnswerPart2++;
					}
				}
			}

		} catch (Exception e) {
			System.out.println("fsdfsdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff" + e.getMessage()
					+ " " + e.toString());
		}

		// luu ket qua cua part 3
		try {
			List<Part3Result> part3Results = (List<Part3Result>) session.getAttribute("part3Results");
			if (part3Results != null) {
				for (Part3Result part3Result : part3Results) {
					// part2ResultService.savePart2Result(part2Result);
					for (Part3ResultQuestion prq : part3Result.getPart3ResultQuestions()) {
						if (prq.getResult() == 5) {
							scorePart3 += 5;
							countCorrectAnswerPart3++;
						}
					}
				}
			}

		} catch (Exception e) {
			System.out.println("fsdfsdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff" + e.getMessage()
					+ " " + e.toString());
		}

		// luu kq part 5
		List<Part5QuestionResult> part5QuestionResults = (List<Part5QuestionResult>) session
				.getAttribute("part5Results");
		if (part5QuestionResults != null) {
			for (Part5QuestionResult p5qr : part5QuestionResults) {
				if (p5qr.getResult_ques() == 5) {
					scorePart5 += 5;
					countCorrectAnswerPart5++;
				}
			}
		}

		// luu ket qua cua part 7
		try {
			List<Part7Result> part7Results = (List<Part7Result>) session.getAttribute("part7Results");
			if (part7Results != null) {
				for (Part7Result part7Result : part7Results) {
					// part2ResultService.savePart2Result(part2Result);
					for (Part7ReadingQuestionResult prq : part7Result.getPart7ReadingQuestionResults()) {
						if (prq.getResult() == 5) {
							scorePart7 += 5;
							countCorrectAnswerPart7++;
						}
					}
				}
			}

		} catch (Exception e) {
			System.out.println("fsdfsdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff" + e.getMessage()
					+ " " + e.toString());
		}
		
		int totalScore = scorePart1 + scorePart2+scorePart3+scorePart5+scorePart7;
		totalScoreReading = scorePart5+scorePart7;
		totalScoreListening = scorePart1+scorePart2+scorePart3;
		result.setScore(totalScore);

		try {
			// this.resultService.updateResult(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		session.setAttribute("min", 0);
		session.setAttribute("sec", 0);
		
		model.addAttribute("exam", exam);
		model.addAttribute("countCorrectAnswerPart1", countCorrectAnswerPart1);
		model.addAttribute("countCorrectAnswerPart2", countCorrectAnswerPart2);
		model.addAttribute("countCorrectAnswerPart3", countCorrectAnswerPart3);
		model.addAttribute("countCorrectAnswerPart5", countCorrectAnswerPart5);
		model.addAttribute("countCorrectAnswerPart7", countCorrectAnswerPart7);
		model.addAttribute("totalScoreReading", totalScoreReading);
		model.addAttribute("totalScoreListening", totalScoreListening);
		
		

		return "exam/result";
	}
	@RequestMapping("/exam/exit")
	public String examExit(HttpSession session) {
		
		session.removeAttribute("part1Results");
		session.removeAttribute("part2Results");
		session.removeAttribute("part3Results");
		session.removeAttribute("part4Results");
		session.removeAttribute("part5Results");
		session.removeAttribute("part6Results");
		session.removeAttribute("part7Results");
		
		
		return "redirect:/";
	}
}
