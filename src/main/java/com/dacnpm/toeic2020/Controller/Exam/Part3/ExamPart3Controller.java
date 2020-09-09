package com.dacnpm.toeic2020.Controller.Exam.Part3;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dacnpm.toeic2020.Model.Examination;
import com.dacnpm.toeic2020.Model.Part2;
import com.dacnpm.toeic2020.Model.Part2Question;
import com.dacnpm.toeic2020.Model.Part2Result;
import com.dacnpm.toeic2020.Model.Part3;
import com.dacnpm.toeic2020.Model.Part3Question;
import com.dacnpm.toeic2020.Model.Part3Result;
import com.dacnpm.toeic2020.Model.Part3ResultQuestion;
import com.dacnpm.toeic2020.Model.Part7Result;
import com.dacnpm.toeic2020.Model.Results;
import com.dacnpm.toeic2020.Service.ExaminationService;
import com.dacnpm.toeic2020.Service.Part1ListeningService;
import com.dacnpm.toeic2020.Service.Part2ResultService;
import com.dacnpm.toeic2020.Service.Part3ResultQuestionService;
import com.dacnpm.toeic2020.Service.Part3ResultService;
import com.dacnpm.toeic2020.Service.ResultService;
import com.dacnpm.toeic2020.Utils.Constant;

@Controller
public class ExamPart3Controller {

	@Autowired
	ExaminationService examinationService;

	@Autowired
	ResultService resultService;

	@Autowired
	Part3ResultService part3ResultService;

	@Autowired
	Part3ResultQuestionService part3ResultQuestionService;

	@RequestMapping("exam/part-3-intro")
	public String examPart_2_intro(Model model, HttpSession httpSession) {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			
			return "exam/part-3-intro";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part-3-intro");
		return "login";

	}

	public void sortPart3Ques(List<Part3Question> part3Questions) {
		Collections.sort(part3Questions, new Comparator<Part3Question>() {

			@Override
			public int compare(Part3Question o1, Part3Question o2) {

				return o1.getOrder() - o2.getOrder();
			}

		});
	}

	public void sortPart3(List<Part3> part3) {
		Collections.sort(part3, new Comparator<Part3>() {

			@Override
			public int compare(Part3 o1, Part3 o2) {

				return o1.getOderIndex() - o2.getOderIndex();
			}

		});
	}

	@GetMapping("/exam/part-3/{groupNum}")
	public String examPart2(Model model, @PathVariable(name = "groupNum") int groupNum,
			HttpServletRequest httpServletRequest, HttpSession httpSession) {

		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			Examination exam = (Examination) httpSession.getAttribute("examination");

			String min = httpServletRequest.getParameter("minute");
			String sec = httpServletRequest.getParameter("second");
			
			if(httpSession.getAttribute("min") != null) {
				min =(String) httpSession.getAttribute("min");
			}
			
			if(httpSession.getAttribute("sec") != null) {
				sec =(String) httpSession.getAttribute("sec");
			}
			
			Set<Part3> part3s = exam.getPart3s();

			ArrayList<Part3Question> arr = new ArrayList<>();
			ArrayList<Part3> part3List = new ArrayList<>();

			for (Part3 part3 : exam.getPart3s()) {
				part3List.add(part3);
			}

			sortPart3(part3List);

			Part3 part3 = part3List.get(groupNum);
			for (Part3Question part3Question : part3.getPart3Questions()) {
				arr.add(part3Question);
			}

			sortPart3Ques(arr);

			model.addAttribute("part3", part3);
			model.addAttribute("part3QuesList", arr);
			httpSession.setAttribute("part3List", part3List);
			model.addAttribute("idExam", exam.getId());
			
			httpSession.setAttribute("min", min);
			httpSession.setAttribute("sec", sec);
			
			return "exam/part3";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part2");
		return "redirect:/login";
	}

	@PostMapping("/exam/part3/submit")
	public String examPart2Sub(Model model, HttpServletRequest httpServletRequest,
			@RequestParam("examinationId") int examinationId, @RequestParam("groupNum") int groupNum,
			HttpSession httpSession) throws Exception {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {

			String[] quessId = httpServletRequest.getParameterValues("questionIdPart3");

			Examination examination = this.examinationService.getExamById(examinationId);

			Part3ResultQuestion part3ResultQuestion = null;
			List<Part3Result> part3ResultList = new ArrayList<>();
			Set<Part3ResultQuestion> part3ResultQuestions = new HashSet<>();
			List<Part3> part3s = (List<Part3>) httpSession.getAttribute("part3List");

			Results result = (Results) httpSession.getAttribute("result");

			Part3Result part3Result = new Part3Result();
			part3Result.setResult_Part3Result(result);
			part3Result.setPart3_PartResult(part3s.get(groupNum));
			
			String min = httpServletRequest.getParameter("minute");
			String sec = httpServletRequest.getParameter("second");
			
			

			for (String qId : quessId) {

				String answer = httpServletRequest.getParameter("questionPart3_" + qId);

				for (Part3Question part3Question : part3s.get(groupNum).getPart3Questions()) {

					part3ResultQuestion = new Part3ResultQuestion();

				    part3ResultQuestion.setPart3Result_part3ResultQuestion(part3Result);
					part3ResultQuestion.setPart3Question_part3ResultQuestion(part3Question);

					int idd = Integer.parseInt(qId);

					if (idd == part3Question.getId()) {

						if (part3Question.getOp_true().equals(answer)) {
							System.out.println("correct " + part3Question.getContent());
							part3ResultQuestion.setResult(5);

						} else {
							System.out.println("incorrect " + part3Question.getContent());
							part3ResultQuestion.setResult(0);
						}
						part3Question.setOpSelected(answer);
						part3ResultQuestion.setPart3Question_part3ResultQuestion(part3Question);
						part3ResultQuestions.add(part3ResultQuestion);
                     
						
					

					}
					part3Result.setPart3ResultQuestions(part3ResultQuestions);
				}

			}

			

			if(httpSession.getAttribute("part3Results") == null) {
				
				List<Part3Result> liPart3Results = new ArrayList<>();
				liPart3Results.add(part3Result);
				httpSession.setAttribute("part3Results", liPart3Results);
				
			}
			
			else {
				
				List<Part3Result> liPart3Results = (List<Part3Result>) httpSession.getAttribute("part3Results");
			    	liPart3Results.add(part3Result);
			    	httpSession.setAttribute("part3Results", liPart3Results);
			
			}
			
		
			groupNum = groupNum +1;
			
			if(part3s.size() > groupNum) {
				
				httpSession.setAttribute("min", min);
				httpSession.setAttribute("sec", sec);
			
				return "redirect:/exam/part-3/"+groupNum;
			
			}
			
			
			
			return "redirect:/exam/part-4-intro";
			
			
		}

		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part2");
		return "redirect:/login";
	}
}
