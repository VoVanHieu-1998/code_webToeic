package com.dacnpm.toeic2020.Controller.Exam.Part2;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dacnpm.toeic2020.Model.Examination;
import com.dacnpm.toeic2020.Model.Part2;
import com.dacnpm.toeic2020.Model.Part2Question;
import com.dacnpm.toeic2020.Model.Part2Result;
import com.dacnpm.toeic2020.Model.Results;
import com.dacnpm.toeic2020.Service.ExaminationService;
import com.dacnpm.toeic2020.Service.Part1ListeningService;
import com.dacnpm.toeic2020.Service.Part2ResultService;
import com.dacnpm.toeic2020.Service.ResultService;
import com.dacnpm.toeic2020.Utils.Constant;

@Controller
public class ExamPart2 {

	@Autowired
	Part1ListeningService part1ListeningService;
	@Autowired
	ExaminationService examinationService;
	
	@Autowired
	Part2ResultService part2ResultService;
	@Autowired
	ResultService resultService;

	@RequestMapping("exam/part-2-intro")
	public String examPart_2_intro(Model model, HttpSession httpSession) {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			
			
			return "exam/part-2-intro";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part-2-intro");
		return "login";

	}

	public void sortPart2Ques(List<Part2Question> part2Questions) {
		Collections.sort(part2Questions, new Comparator<Part2Question>() {

			@Override
			public int compare(Part2Question o1, Part2Question o2) {

				return o1.getIndexQ() - o2.getIndexQ();
			}

		});
	}

	@GetMapping("/exam/part-2")
	public String examPart2(Model model, HttpServletRequest httpServletRequest, HttpSession httpSession) {

		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			Examination exam = (Examination) httpSession.getAttribute("examination");

			String min = httpServletRequest.getParameter("minute");
			String sec = httpServletRequest.getParameter("second");
			Set<Part2> part2s = exam.getPart2s();

			ArrayList<Part2Question> arr = new ArrayList<>();
			for (Part2 part2 : exam.getPart2s()) {
				for (Part2Question part2Question : part2.getPart2Questions()) {
					arr.add(part2Question);
				}
			}

			sortPart2Ques(arr);
			httpSession.setAttribute("part2s", part2s);
			model.addAttribute("part2QuesList", arr);
			model.addAttribute("idExam", exam.getId());
			httpSession.setAttribute("min", Integer.parseInt(min));
			httpSession.setAttribute("sec", Integer.parseInt(sec));
			return "exam/part2";
		}
		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part2");
		return "redirect:/login";
	}

	@PostMapping("/exam/part2/submit")
	public String examPart2Sub(Model model, HttpServletRequest httpServletRequest,
			@RequestParam("examinationId") int examinationId, @RequestParam("part") int part, HttpSession httpSession)
			throws Exception {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {

			String[] quessId = httpServletRequest.getParameterValues("questionIdPart2");

			Examination examination = this.examinationService.getExamById(examinationId);
			String min = httpServletRequest.getParameter("minute");
			String sec = httpServletRequest.getParameter("second");
			
			Part2Result part2Result;
			List<Part2Result> part2ResultList = new ArrayList<>();

			Results result = (Results) httpSession.getAttribute("result");

			for (String qId : quessId) {

				String answer = httpServletRequest.getParameter("questionPart2_" + qId);

				for (Part2 part2 : examination.getPart2s()) {

					for (Part2Question part2Question : part2.getPart2Questions()) {
						part2Result = new Part2Result();
						
						part2Result.setResult_Part2Result(result);

						int idd = Integer.parseInt(qId);

						if (idd == part2Question.getId()) {

							if (part2Question.getOp_true().equals(answer)) {
								part2Result.setResult_ques(5);
							} else {
								part2Result.setResult_ques(0);
							}
							part2Question.setOpSelected(answer);
							part2Result.setPart2Question_Result(part2Question);

							part2ResultList.add(part2Result);

						}
					}
				}

			}
			httpSession.setAttribute("min", min);
			httpSession.setAttribute("sec", sec);
			httpSession.setAttribute("part2Results", part2ResultList);
			return "redirect:/exam/part-3-intro";
		}

		httpSession.setAttribute(Constant.MSG_LOGINBACKEXAM, "exam/part2");
		return "redirect:/login";
	}

}
