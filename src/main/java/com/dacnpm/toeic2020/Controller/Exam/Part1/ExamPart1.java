package com.dacnpm.toeic2020.Controller.Exam.Part1;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dacnpm.toeic2020.Model.Examination;
import com.dacnpm.toeic2020.Model.Part1;
import com.dacnpm.toeic2020.Model.Part1Question;
import com.dacnpm.toeic2020.Model.Part1Result;
import com.dacnpm.toeic2020.Model.Results;
import com.dacnpm.toeic2020.Model.User;
import com.dacnpm.toeic2020.Service.ExaminationService;
import com.dacnpm.toeic2020.Service.Part1ListeningService;
import com.dacnpm.toeic2020.Service.Part1ResultService;
import com.dacnpm.toeic2020.Service.ResultService;
import com.dacnpm.toeic2020.Utils.Constant;

@Controller
public class ExamPart1 {
	@Autowired
	Part1ListeningService part1ListeningService;
	@Autowired
	ExaminationService examinationService;
	@Autowired
	Part1ResultService part1ResultService;

	@Autowired
	ResultService resultService;

	@RequestMapping("/exam/{id}")
	public String exam(@PathVariable(name = "id") int id, Model model, HttpSession httpSession) {

		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			Examination exam = this.examinationService.getExamById(id);
			System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee" + exam.getTittle());
			httpSession.setAttribute("examination", exam);
			httpSession.setAttribute("examiId", id);
			return "redirect:/exam/part-1-intro";
		}

		return "redirect:/login";

	}

	@RequestMapping("exam/part-1-intro")
	public String examPart_1_intro(Model model, HttpSession httpSession) {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			httpSession.setAttribute("min", 119);
			httpSession.setAttribute("sec", 59);

			return "exam/part-1-intro";
		}

		return "redirect:/login";
	}

	public void sortPart1Ques(List<Part1Question> part1Questions) {
		Collections.sort(part1Questions, new Comparator<Part1Question>() {

			@Override
			public int compare(Part1Question o1, Part1Question o2) {

				return o1.getIndexQ() - o2.getIndexQ();
			}

		});
	}

	@PostMapping("exam/part-1")
	public String examPart_1(Model model, HttpSession httpSession, HttpServletRequest request) {

		if ( null!= httpSession.getAttribute(Constant.USER_INFO) ) {
			int idExam = (int) httpSession.getAttribute("examiId");
			String min = request.getParameter("minute");
			String sec = request.getParameter("second");
			Examination exam = this.examinationService.getExamById(idExam);
			List<Part1Question> part1Questions = new ArrayList<>();
			Set<Part1> part1ss = exam.getPart1Lists();

			for (Part1 p1 : exam.getPart1Lists()) {
				for (Part1Question p1Q : p1.getPart1Questions()) {
					part1Questions.add(p1Q);
				}
			}

			sortPart1Ques(part1Questions);
			for (Part1Question p1 : part1Questions) {
				System.out.println("dddddddddddddddddddddddddddddddddd" + p1.getImg());
			}
			httpSession.setAttribute("part1ss", part1ss);
			
			model.addAttribute("idExam", exam.getId());
			model.addAttribute("part1QuesList", part1Questions);
			httpSession.setAttribute("min", Integer.parseInt(min));
			httpSession.setAttribute("sec", Integer.parseInt(sec));
		
			return "exam/part1";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part1");
		return "redirect:/login";
	}

	@PostMapping("/exam/part1/submit")
	public String examPart1Sub(Model model, HttpServletRequest httpServletRequest,
			@RequestParam("examinationId") int examinationId, @RequestParam("part") int part, HttpSession httpSession) {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {

			String[] quessId = httpServletRequest.getParameterValues("questionIdPart1");

			String min = httpServletRequest.getParameter("minute");
			String sec = httpServletRequest.getParameter("second");

			Examination examination = this.examinationService.getExamById(examinationId);
			User user = (User) httpSession.getAttribute(Constant.USER_INFO);

			Results result = new Results();
			result.setScore(0);
			result.setExamination_result(examination);
			result.setUser_result(user);

//			try {
//				this.resultService.saveResult(result);
//			} catch (Exception e) {
//				System.out.println(e.getMessage());
//			}

			httpSession.setAttribute("result", result);

			Part1Result part1Result;
			List<Part1Result> part1Results = new ArrayList<>();

			for (String quesId : quessId) {
				String answer = httpServletRequest.getParameter("questionPart1_" + quesId);

				for (Part1 part1 : examination.getPart1Lists()) {
					for (Part1Question part1Question : part1.getPart1Questions()) {
						part1Result = new Part1Result();
						part1Result.setResult_Part1Result(result);
						part1Result.setPart1Question_Result(part1Question);

						int qId = Integer.parseInt(quesId);
						if (qId == part1Question.getId()) {

							if (part1Question.getOp_true().equals(answer)) {
								part1Result.setResult_ques(5);
							} else {
								part1Result.setResult_ques(0);
							}
							part1Question.setOpSelected(answer);
							
							part1Result.setPart1Question_Result(part1Question);

							part1Results.add(part1Result);
						}

					}
				}

			}
		
			
			
			httpSession.setAttribute("min", min);
			httpSession.setAttribute("sec", sec);
			
			
			httpSession.setAttribute("part1Results", part1Results);

			return "redirect:/exam/part-2-intro";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "redirect:/exam/part-2-intro");
		return "redirect:/login";

	}
}
