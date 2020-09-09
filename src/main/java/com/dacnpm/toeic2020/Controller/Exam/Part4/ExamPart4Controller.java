package com.dacnpm.toeic2020.Controller.Exam.Part4;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dacnpm.toeic2020.Model.Examination;
import com.dacnpm.toeic2020.Model.Part3;
import com.dacnpm.toeic2020.Model.Part3Question;
import com.dacnpm.toeic2020.Model.Part3Result;
import com.dacnpm.toeic2020.Model.Part3ResultQuestion;
import com.dacnpm.toeic2020.Model.Part4;
import com.dacnpm.toeic2020.Model.Part4Question;
import com.dacnpm.toeic2020.Model.Part4Result;
import com.dacnpm.toeic2020.Model.Part4ResultQuestion;
import com.dacnpm.toeic2020.Model.Results;
import com.dacnpm.toeic2020.Service.ExaminationService;
import com.dacnpm.toeic2020.Service.Part3ResultQuestionService;
import com.dacnpm.toeic2020.Service.Part3ResultService;
import com.dacnpm.toeic2020.Service.Part4ResultQuestionService;
import com.dacnpm.toeic2020.Service.Part4ResultService;
import com.dacnpm.toeic2020.Service.ResultService;
import com.dacnpm.toeic2020.Utils.Constant;

@Controller
public class ExamPart4Controller {
	@Autowired
	ExaminationService examinationService;

	@Autowired
	ResultService resultService;

	@Autowired
	Part4ResultService part4ResultService;

	@Autowired
	Part4ResultQuestionService part4ResultQuestionService;

	@RequestMapping("exam/part-4-intro")
	public String examPart_2_intro(Model model, HttpSession httpSession) {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {

			return "exam/part-4-intro";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part-4-intro");
		return "login";

	}

	public void sortPart4Ques(List<Part4Question> part4Questions) {
		Collections.sort(part4Questions, new Comparator<Part4Question>() {

			@Override
			public int compare(Part4Question o1, Part4Question o2) {

				return o1.getOrder() - o2.getOrder();
			}

		});
	}

	public void sortPart4(List<Part4> part4) {
		Collections.sort(part4, new Comparator<Part4>() {

			@Override
			public int compare(Part4 o1, Part4 o2) {

				return o1.getOderIndex() - o2.getOderIndex();
			}

		});
	}

	@RequestMapping("/exam/part-4/{groupNum}")
	public String examPart2(Model model, @PathVariable(name = "groupNum") int groupNum,
			HttpServletRequest httpServletRequest, HttpSession httpSession) {

		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			Examination exam = (Examination) httpSession.getAttribute("examination");

			String min = httpServletRequest.getParameter("minute");
			String sec = httpServletRequest.getParameter("second");

			ArrayList<Part4Question> arr = new ArrayList<>();
			ArrayList<Part4> part4List = new ArrayList<>();

			for (Part4 part4 : exam.getPart4s()) {
				part4List.add(part4);
			}

			sortPart4(part4List);

			Part4 part4 = part4List.get(groupNum);
			for (Part4Question part4Question : part4.getPart4Questions()) {
				arr.add(part4Question);
			}

			sortPart4Ques(arr);

			model.addAttribute("part4", part4);
			model.addAttribute("part4QuesList", arr);
			httpSession.setAttribute("part4List", part4List);
			model.addAttribute("idExam", exam.getId());
			httpSession.setAttribute("min", min);
			httpSession.setAttribute("sec", sec);
			return "exam/part4";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part4");
		return "redirect:/login";
	}

	@PostMapping("/exam/part4/submit")
	public String examPart2Sub(Model model, HttpServletRequest httpServletRequest,
			@RequestParam("examinationId") int examinationId, @RequestParam("groupNum") int groupNum,
			HttpSession httpSession) throws Exception {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			String min = httpServletRequest.getParameter("minute");
			String sec = httpServletRequest.getParameter("second");
			String[] quessId = httpServletRequest.getParameterValues("questionIdPart4");

			Examination examination = this.examinationService.getExamById(examinationId);

			Part4ResultQuestion part4ResultQuestion = null;
			List<Part4Result> part4ResultList = new ArrayList<>();
			Set<Part4ResultQuestion> part4ResultQuestions = new HashSet<>();
			List<Part4> part4s = (List<Part4>) httpSession.getAttribute("part4List");

			Results result = (Results) httpSession.getAttribute("result");

			Part4Result part4Result = new Part4Result();
			part4Result.setResult_Part4Result(result);
			part4Result.setPart4_PartResult(part4s.get(groupNum));

			for (String qId : quessId) {

				String answer = httpServletRequest.getParameter("questionPart4_" + qId);

				for (Part4Question part4Question : part4s.get(groupNum).getPart4Questions()) {

					part4ResultQuestion = new Part4ResultQuestion();

					part4ResultQuestion.setPart4Result_part4ResultQuestion(part4Result);
					

					int idd = Integer.parseInt(qId);

					if (idd == part4Question.getId()) {

						if (part4Question.getOp_true().equals(answer)) {
							System.out.println("correct " + part4Question.getContent());
							part4ResultQuestion.setResult(5);

						} else {
							System.out.println("incorrect " + part4Question.getContent());
							part4ResultQuestion.setResult(0);
						}
						part4Question.setOpSelected(answer);
						part4ResultQuestion.setPart4Question_part4ResultQuestion(part4Question);
						part4ResultQuestions.add(part4ResultQuestion);

						

					}
					part4Result.setPart4ResultQuestions(part4ResultQuestions);
				}

			}

			if (httpSession.getAttribute("part4Results") == null) {

				List<Part4Result> liPart4Results = new ArrayList<>();
				liPart4Results.add(part4Result);
				httpSession.setAttribute("part4Results", liPart4Results);

			}

			else {

				List<Part4Result> liPart4Results = (List<Part4Result>) httpSession.getAttribute("part4Results");
				liPart4Results.add(part4Result);
				httpSession.setAttribute("part4Results", liPart4Results);

			}

			groupNum = groupNum + 1;

			if (part4s.size() > groupNum) {
				httpSession.setAttribute("min", min);
				httpSession.setAttribute("sec", sec);
				return "redirect:/exam/part-4/" + groupNum;

			}
			
			
			httpSession.setAttribute("min", min);
			httpSession.setAttribute("sec", sec);
			return "redirect:/exam/part-5-intro";

		}

		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part2");
		return "redirect:/login";
	}

}
