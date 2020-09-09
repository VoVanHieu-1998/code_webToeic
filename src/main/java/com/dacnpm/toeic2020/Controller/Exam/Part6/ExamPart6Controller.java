package com.dacnpm.toeic2020.Controller.Exam.Part6;

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
import com.dacnpm.toeic2020.Model.Part4;
import com.dacnpm.toeic2020.Model.Part4Question;
import com.dacnpm.toeic2020.Model.Part4Result;
import com.dacnpm.toeic2020.Model.Part4ResultQuestion;
import com.dacnpm.toeic2020.Model.Part6;
import com.dacnpm.toeic2020.Model.Part6Question;
import com.dacnpm.toeic2020.Model.Part6Result;
import com.dacnpm.toeic2020.Model.Part6ResultQuestion;
import com.dacnpm.toeic2020.Model.Results;
import com.dacnpm.toeic2020.Service.ExaminationService;
import com.dacnpm.toeic2020.Service.Part4ResultQuestionService;
import com.dacnpm.toeic2020.Service.Part4ResultService;
import com.dacnpm.toeic2020.Service.Part6ResultQuestionService;
import com.dacnpm.toeic2020.Service.Part6ResultService;
import com.dacnpm.toeic2020.Service.ResultService;
import com.dacnpm.toeic2020.Utils.Constant;
@Controller
public class ExamPart6Controller {
	@Autowired
	ExaminationService examinationService;

	@Autowired
	ResultService resultService;

	@Autowired
	Part6ResultService part6ResultService;

	@Autowired
	Part6ResultQuestionService part6ResultQuestionService;

	@RequestMapping("exam/part-6-intro")
	public String examPart_6_intro(Model model, HttpSession httpSession) {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {

			return "exam/part-6-intro";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part-6-intro");
		return "login";

	}

	public void sortPart6Ques(List<Part6Question> part6Questions) {
		Collections.sort(part6Questions, new Comparator<Part6Question>() {

			@Override
			public int compare(Part6Question o1, Part6Question o2) {

				return o1.getOrder() - o2.getOrder();
			}

		});
	}

	public void sortPart6(List<Part6> part6) {
		Collections.sort(part6, new Comparator<Part6>() {

			@Override
			public int compare(Part6 o1, Part6 o2) {

				return o1.getOderIndex() - o2.getOderIndex();
			}

		});
	}

	@RequestMapping("/exam/part-6/{groupNum}")
	public String examPart2(Model model, @PathVariable(name = "groupNum") int groupNum,
			HttpServletRequest httpServletRequest, HttpSession httpSession) {

		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			Examination exam = (Examination) httpSession.getAttribute("examination");

			String min = httpServletRequest.getParameter("minute");
			String sec = httpServletRequest.getParameter("second");

			ArrayList<Part6Question> arr = new ArrayList<>();
			ArrayList<Part6> part6List = new ArrayList<>();

			for (Part6 part6 : exam.getPart6s()) {
				part6List.add(part6);
			}

			sortPart6(part6List);

			Part6 part6 = part6List.get(groupNum);
			for (Part6Question part6Question : part6.getPart6Questions()) {
				arr.add(part6Question);
			}

			sortPart6Ques(arr);

			model.addAttribute("part6", part6);
			model.addAttribute("part6QuesList", arr);
			httpSession.setAttribute("part6List", part6List);
			model.addAttribute("idExam", exam.getId());
			httpSession.setAttribute("min", min);
			httpSession.setAttribute("sec", sec);
			return "exam/part6";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part6");
		return "redirect:/login";
	}

	@PostMapping("/exam/part6/submit")
	public String examPart2Sub(Model model, HttpServletRequest httpServletRequest,
			@RequestParam("examinationId") int examinationId, @RequestParam("groupNum") int groupNum,
			HttpSession httpSession) throws Exception {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			String min = httpServletRequest.getParameter("minute");
			String sec = httpServletRequest.getParameter("second");
			String[] quessId = httpServletRequest.getParameterValues("questionIdPart6");

			Examination examination = this.examinationService.getExamById(examinationId);

			Part6ResultQuestion part6ResultQuestion = null;
			List<Part6Result> part6ResultList = new ArrayList<>();
			Set<Part6ResultQuestion> part6ResultQuestions = new HashSet<>();
			List<Part6> part6s = (List<Part6>) httpSession.getAttribute("part6List");

			Results result = (Results) httpSession.getAttribute("result");

			Part6Result part6Result = new Part6Result();
			part6Result.setResult_Part6Result(result);
			part6Result.setPart6_PartResult(part6s.get(groupNum));

			for (String qId : quessId) {

				String answer = httpServletRequest.getParameter("questionPart6_" + qId);

				for (Part6Question part6Question : part6s.get(groupNum).getPart6Questions()) {

					part6ResultQuestion = new Part6ResultQuestion();

					part6ResultQuestion.setPart6Result_part6ResultQuestion(part6Result);
					

					int idd = Integer.parseInt(qId);

					if (idd == part6Question.getId()) {

						if (part6Question.getOp_true().equals(answer)) {
							System.out.println("correct " + part6Question.getContent());
							part6ResultQuestion.setResult(5);

						} else {
							System.out.println("incorrect " + part6Question.getContent());
							part6ResultQuestion.setResult(0);
						}
						part6Question.setOpSelected(answer);
						part6ResultQuestion.setPart6Question_part6ResultQuestion(part6Question);
						
						
						part6ResultQuestions.add(part6ResultQuestion);

						

					}
					
					
					part6Result.setPart6ResultQuestions(part6ResultQuestions);
				}

			}

			if (httpSession.getAttribute("part6Results") == null) {

				List<Part6Result> liPart6Results = new ArrayList<>();
				liPart6Results.add(part6Result);
				httpSession.setAttribute("part6Results", liPart6Results);

			}

			else {

				List<Part6Result> liPart6Results = (List<Part6Result>) httpSession.getAttribute("part6Results");
				liPart6Results.add(part6Result);
				httpSession.setAttribute("part6Results", liPart6Results);

			}

			groupNum = groupNum + 1;

			if (part6s.size() > groupNum) {
				httpSession.setAttribute("min", min);
				httpSession.setAttribute("sec", sec);
				return "redirect:/exam/part-6/" + groupNum;

			}
			
			
			httpSession.setAttribute("min", min);
			httpSession.setAttribute("sec", sec);
			return "redirect:/exam/part-7-intro";

		}

		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part6");
		return "redirect:/login";
	}
}
