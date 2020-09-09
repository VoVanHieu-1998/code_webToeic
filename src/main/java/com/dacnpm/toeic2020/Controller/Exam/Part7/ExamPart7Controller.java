package com.dacnpm.toeic2020.Controller.Exam.Part7;

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
import com.dacnpm.toeic2020.Model.Part3;
import com.dacnpm.toeic2020.Model.Part3Question;
import com.dacnpm.toeic2020.Model.Part3Result;
import com.dacnpm.toeic2020.Model.Part3ResultQuestion;
import com.dacnpm.toeic2020.Model.Part5Question;
import com.dacnpm.toeic2020.Model.Part5QuestionResult;
import com.dacnpm.toeic2020.Model.Part7;
import com.dacnpm.toeic2020.Model.Part7ReadingQuestion;
import com.dacnpm.toeic2020.Model.Part7ReadingQuestionResult;
import com.dacnpm.toeic2020.Model.Part7Result;
import com.dacnpm.toeic2020.Model.Results;
import com.dacnpm.toeic2020.Service.ExaminationService;
import com.dacnpm.toeic2020.Service.Part5QuestionResultService;
import com.dacnpm.toeic2020.Service.Part5ReadingService;
import com.dacnpm.toeic2020.Service.Part7ReadingService;
import com.dacnpm.toeic2020.Service.Part7ResultQuestionService;
import com.dacnpm.toeic2020.Service.Part7ResultService;
import com.dacnpm.toeic2020.Service.ResultService;
import com.dacnpm.toeic2020.Utils.Constant;

@Controller
public class ExamPart7Controller {
	@Autowired
	ExaminationService examinationService;

	@Autowired
	Part7ResultQuestionService part7QuestionResultService;
	@Autowired
	Part7ReadingService part7ReadingService;
	@Autowired
	ResultService resultService;
	@Autowired
	Part7ResultService Part7ResultService;

	@RequestMapping("exam/part-7-intro")
	public String examPart_5_intro(Model model, HttpSession httpSession) {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			return "exam/part-7-intro";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part-7-intro");
		return "login";

	}

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
	@GetMapping("/exam/part-7/{groupNum}")
	public String examPart7(Model model, @PathVariable(name = "groupNum") int groupNum,
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
			
			Set<Part7> part7s = exam.getPart7s();

			ArrayList<Part7ReadingQuestion> arr = new ArrayList<>();
			ArrayList<Part7> part7List = new ArrayList<>();

			for (Part7 part7 : exam.getPart7s()) {
				part7List.add(part7);
			}
			
			sortPart7(part7List);
		
			Part7 part7 = part7List.get(groupNum);
			for (Part7ReadingQuestion part7ReadingQuestion : part7.getPart7ReadingQuestions()) {
				arr.add(part7ReadingQuestion);
			}

			sortPart7Ques(arr);

			model.addAttribute("part7", part7);
			model.addAttribute("part7QuesList", arr);
			httpSession.setAttribute("part7List", part7List);
			model.addAttribute("idExam", exam.getId());
			
			httpSession.setAttribute("min", min);
			httpSession.setAttribute("sec", sec);
			
			return "exam/part7";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part7");
		return "redirect:/login";
	}
	@PostMapping("/exam/part7/submit")
	public String examPart2Sub(Model model, HttpServletRequest httpServletRequest,
			@RequestParam("examinationId") int examinationId, @RequestParam("groupNum") int groupNum,
			HttpSession httpSession) throws Exception {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {

			String[] quessId = httpServletRequest.getParameterValues("questionIdPart7");

			Examination examination = this.examinationService.getExamById(examinationId);

			Part7ReadingQuestionResult part7ReadingQuestionResult = null;
			List<Part7Result> part7ResultList = new ArrayList<>();
			Set<Part7ReadingQuestionResult> part7ReadingQuestionResults = new HashSet<>();
			List<Part7> part7s = (List<Part7>) httpSession.getAttribute("part7List");

			Results result = (Results) httpSession.getAttribute("result");

			Part7Result part7Result = new Part7Result();
			part7Result.setResult_Part7Result(result);
			part7Result.setPart7_PartResult(part7s.get(groupNum));
			
			String min = httpServletRequest.getParameter("minute");
			String sec = httpServletRequest.getParameter("second");
			
			

			for (String qId : quessId) {

				String answer = httpServletRequest.getParameter("questionPart7_" + qId);

				for (Part7ReadingQuestion part7ReadingQuestion : part7s.get(groupNum).getPart7ReadingQuestions()) {

					part7ReadingQuestionResult = new Part7ReadingQuestionResult();					
				
					part7ReadingQuestionResult.setPart7Result_part7ResultQuestion(part7Result);

					int idd = Integer.parseInt(qId);

					if (idd == part7ReadingQuestion.getId()) {

						if (part7ReadingQuestion.getOp_true().equals(answer)) {
							System.out.println("correct " + part7ReadingQuestion.getContent());
							part7ReadingQuestionResult.setResult(5);

						} else {
							System.out.println("incorrect " + part7ReadingQuestion.getContent());
							part7ReadingQuestionResult.setResult(0);
						}
						
						
						part7ReadingQuestion.setOpSelected(answer);
						part7ReadingQuestionResult.setPart7Question_part7ResultQuestion(part7ReadingQuestion);
						
						part7ReadingQuestionResults.add(part7ReadingQuestionResult);
                     
						
						part7Result.setPart7ReadingQuestionResults(part7ReadingQuestionResults);

					}
				}

			}
			
			

			
			if(httpSession.getAttribute("part7Results") == null) {
				List<Part7Result> liPart7Results = new ArrayList<>();
				
				liPart7Results.add(part7Result);
				httpSession.setAttribute("part7Results", liPart7Results);
				
			}
			else {
				List<Part7Result> liPart7Results = (List<Part7Result>) httpSession.getAttribute("part7Results");
			    	liPart7Results.add(part7Result);
			    	httpSession.setAttribute("part7Results", liPart7Results);
			}
			
		
			groupNum = groupNum +1;
			
			if(part7s.size() > groupNum) {
				
				httpSession.setAttribute("min", min);
				httpSession.setAttribute("sec", sec);
			
				return "redirect:/exam/part-7/"+groupNum;
			
			}
			
			
			
			return "redirect:/exam/finished";
			
			
		}

		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part2");
		return "redirect:/login";
	}
}
