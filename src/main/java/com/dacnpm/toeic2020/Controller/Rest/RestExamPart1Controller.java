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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dacnpm.toeic2020.Model.Examination;
import com.dacnpm.toeic2020.Model.Part1;
import com.dacnpm.toeic2020.Model.Part1Question;
import com.dacnpm.toeic2020.Service.ExaminationService;
import com.dacnpm.toeic2020.Service.Part1ListeningService;
import com.dacnpm.toeic2020.Service.Part1ResultService;
import com.dacnpm.toeic2020.Service.ResultService;
import com.dacnpm.toeic2020.Utils.Constant;

@Controller
@RequestMapping("API/")
public class RestExamPart1Controller {
	@Autowired
	Part1ListeningService part1ListeningService;
	@Autowired
	ExaminationService examinationService;
	@Autowired
	Part1ResultService part1ResultService;

	@Autowired
	ResultService resultService;

	public void sortPart1Ques(List<Part1Question> part1Questions) {
		Collections.sort(part1Questions, new Comparator<Part1Question>() {

			@Override
			public int compare(Part1Question o1, Part1Question o2) {

				return o1.getIndexQ() - o2.getIndexQ();
			}

		});
	}

	@RequestMapping(value = "getCountDown", method = RequestMethod.GET, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)

	@ResponseBody
	public List<Integer> getCountDown(HttpSession session,@RequestParam(name="min") int min,@RequestParam(name="sec") int sec ) {

		session.setAttribute("min", min);
		session.setAttribute("sec", sec);
		
		List<Integer> list = new ArrayList<>();
		list.add((int)session.getAttribute("min"));
		list.add((int)session.getAttribute("sec"));
		
		
		return list;

	}

	@RequestMapping(value = "exam-part1", method = RequestMethod.POST, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)

	@ResponseBody
	public Part1 examPart1(HttpSession httpSession) {
		if (httpSession.getAttribute(Constant.USER_INFO) != null) {
			int idExam = (int) httpSession.getAttribute("examiId");
			Examination exam = this.examinationService.getExamById(idExam);
			List<Part1Question> part1Questions = new ArrayList<>();
			Part1 part1;
			List<Part1> listPart1 = new ArrayList<>();
			for (Part1 p1 : exam.getPart1Lists()) {
				listPart1.add(p1);
			}

			part1 = listPart1.get(0);
			Part1Question part1Question;
			for (Part1Question p1q : part1.getPart1Questions()) {
				part1Question = new Part1Question(p1q.getId(), p1q.getIndexQ(), p1q.getImg(), p1q.getOp1(),
						p1q.getOp2(), p1q.getOp3(), p1q.getOp4(), p1q.getOp_true(), p1q.getIsTrue());
				part1Questions.add(part1Question);
			}

			sortPart1Ques(part1Questions);
			Set<Part1Question> p1Quess = new HashSet<>();
			for (Part1Question p1 : part1Questions) {
				p1Quess.add(p1);
			}

			Part1 p1 = new Part1(part1.getId(), p1Quess, part1.getMp3(), part1.getType());

			return p1;
		}
		return null;
	}

}
