package com.dacnpm.toeic2020.Controller.Exam.Part5;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dacnpm.toeic2020.Model.Examination;
import com.dacnpm.toeic2020.Model.Part2;
import com.dacnpm.toeic2020.Model.Part2Question;
import com.dacnpm.toeic2020.Model.Part2Result;
import com.dacnpm.toeic2020.Model.Part5Question;
import com.dacnpm.toeic2020.Model.Part5QuestionResult;
import com.dacnpm.toeic2020.Model.Results;
import com.dacnpm.toeic2020.Service.ExaminationService;
import com.dacnpm.toeic2020.Service.Part1ListeningService;
import com.dacnpm.toeic2020.Service.Part2ResultService;
import com.dacnpm.toeic2020.Service.Part5QuestionResultService;
import com.dacnpm.toeic2020.Service.Part5ReadingService;
import com.dacnpm.toeic2020.Service.ResultService;
import com.dacnpm.toeic2020.Utils.Constant;

@Controller
public class ExamPart5Controller {

	@Autowired
	ExaminationService examinationService;

	@Autowired
	Part5QuestionResultService part5QuestionResultService;
	@Autowired
	Part5ReadingService part5ReadingService;
	@Autowired
	ResultService resultService;

	@RequestMapping("exam/part-5-intro")
	public String examPart_5_intro(Model model, HttpSession httpSession) {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			return "exam/part-5-intro";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part-5-intro");
		return "login";

	}

	public void sortPart5Ques(List<Part5Question> part5Questions) {
		Collections.sort(part5Questions, new Comparator<Part5Question>() {

			@Override
			public int compare(Part5Question o1, Part5Question o2) {

				return o1.getOrder() - o2.getOrder();
			}

		});
	}

	@RequestMapping("/exam/part-5")
	public String examPar5(Model model, HttpServletRequest httpServletRequest, HttpSession httpSession) {

		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			Examination exam = (Examination) httpSession.getAttribute("examination");

			String min = httpServletRequest.getParameter("minute");
			String sec = httpServletRequest.getParameter("second");
			Set<Part5Question> part5Questions = exam.getPart5Questions();

			ArrayList<Part5Question> arr = new ArrayList<>();

			for (Part5Question part5Question : part5Questions) {
				arr.add(part5Question);
			}

			sortPart5Ques(arr);
			for (Part5Question p5q : exam.getPart5Questions()) {
				System.out.println(p5q.getContent() + " " + p5q.getOrder());
			}

			model.addAttribute("part5QuesList", arr);
			model.addAttribute("isView", false);
			model.addAttribute("idExam", exam.getId());
			httpSession.setAttribute("min", Integer.parseInt(min));
			httpSession.setAttribute("sec", Integer.parseInt(sec));
			return "exam/part5";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part5");
		return "redirect:/login";
	}

	@PostMapping("/exam/part5/submit")
	public String examPart2Sub(Model model, HttpServletRequest httpServletRequest,
			@RequestParam("examinationId") int examinationId, @RequestParam("part") int part, HttpSession httpSession)
			throws Exception {
		httpSession.removeAttribute("part5Results");
		
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			
			String[] quessId = httpServletRequest.getParameterValues("questionIdPart5");

			Examination examination = this.examinationService.getExamById(examinationId);

			Part5QuestionResult part5QuestionResult;
			Part5Question part5Q;
			List<Part5QuestionResult> part5ResultList = new ArrayList<>();

			Results result = (Results) httpSession.getAttribute("result");

			for (String qId : quessId) {

				String answer = httpServletRequest.getParameter("questionPart5_" + qId);

				for (Part5Question part5Question : examination.getPart5Questions()) {
					
                    
					part5QuestionResult = new Part5QuestionResult();

					
					part5QuestionResult.setResult_Part5Result(result);

					int idd = Integer.parseInt(qId);

					if (idd == part5Question.getId()) {

						if (part5Question.getOp_true().equals(answer)) {
							part5QuestionResult.setResult_ques(5);
						} else {
							part5QuestionResult.setResult_ques(0);
						}
						part5Question.setOpSelected(answer);
						part5ResultList.add(part5QuestionResult);
					}
					
					part5QuestionResult.setPart5Question_Result(part5Question);
					
				

					

				}

			}

	       
			
			String min = httpServletRequest.getParameter("minute");
			String sec = httpServletRequest.getParameter("second");
			httpSession.setAttribute("min", min);
			httpSession.setAttribute("sec", sec);
			httpSession.setAttribute("part5Results", part5ResultList);
			return "redirect:/exam/part-6-intro";
		}

		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part5");
		return "redirect:/login";
	}

}
