package com.dacnpm.toeic2020.Controller.Exam.Detail;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dacnpm.toeic2020.Model.Part1Question;
import com.dacnpm.toeic2020.Model.Part1Result;
import com.dacnpm.toeic2020.Model.Part2Question;
import com.dacnpm.toeic2020.Model.Part2Result;
import com.dacnpm.toeic2020.Model.Part3;
import com.dacnpm.toeic2020.Model.Part3Result;
import com.dacnpm.toeic2020.Model.Part4;
import com.dacnpm.toeic2020.Model.Part4Result;
import com.dacnpm.toeic2020.Model.Part5Question;
import com.dacnpm.toeic2020.Model.Part5QuestionResult;
import com.dacnpm.toeic2020.Model.Part6;
import com.dacnpm.toeic2020.Model.Part6Result;
import com.dacnpm.toeic2020.Model.Part7;
import com.dacnpm.toeic2020.Model.Part7ReadingQuestion;
import com.dacnpm.toeic2020.Model.Part7Result;

@Controller
public class examDetail {
	public void sortPart5Ques(List<Part5Question> part5Questions) {
		Collections.sort(part5Questions, new Comparator<Part5Question>() {

			@Override
			public int compare(Part5Question o1, Part5Question o2) {

				return o1.getOrder() - o2.getOrder();
			}

		});
	}
	
	public void sortPart2Ques(List<Part2Question> part2Questions) {
		Collections.sort(part2Questions, new Comparator<Part2Question>() {

			@Override
			public int compare(Part2Question o1, Part2Question o2) {

				return o1.getIndexQ() - o2.getIndexQ();
			}

		});
	}
	
	
	public void sortPart1Ques(List<Part1Question> part1Questions) {
		Collections.sort(part1Questions, new Comparator<Part1Question>() {

			@Override
			public int compare(Part1Question o1, Part1Question o2) {

				return o1.getIndexQ() - o2.getIndexQ();
			}

		});
	}

	
	@RequestMapping("exam/part5/detail")
	public String examPart5Detail(Model model, HttpSession session) {

		List<Part5QuestionResult> part5QuestionResults = (List<Part5QuestionResult>) session
				.getAttribute("part5Results");
		List<Part5Question> part5Questions = new ArrayList<Part5Question>();
		for (Part5QuestionResult p5qr : part5QuestionResults) {
			part5Questions.add(p5qr.getPart5Question_Result());
		}

		sortPart5Ques(part5Questions);
		model.addAttribute("isView", true);
		model.addAttribute("part5QuesList", part5Questions);

		return "exam/part5";
	}
	

	@RequestMapping("exam/part1/detail")
	public String examPart1Detail(Model model, HttpSession session) {

		List<Part1Result> part1Results = (List<Part1Result>) session
				.getAttribute("part1Results");
		List<Part1Question> part1Questions = new ArrayList<Part1Question>();
		for (Part1Result p1qr : part1Results) {
			part1Questions.add(p1qr.getPart1Question_Result());
		}

		sortPart1Ques(part1Questions);
		model.addAttribute("isView", true);
		model.addAttribute("part1QuesList", part1Questions);

		return "exam/part1";
	}
	
	@RequestMapping("exam/part2/detail")
	public String examPart2Detail(Model model, HttpSession session) {

		List<Part2Result> part2QuestionResults = (List<Part2Result>) session
				.getAttribute("part2Results");
		List<Part2Question> part2Questions = new ArrayList<Part2Question>();
		for (Part2Result p2qr : part2QuestionResults) {
			part2Questions.add(p2qr.getPart2Question_Result());
		}

		sortPart2Ques(part2Questions);
		model.addAttribute("isView", true);
		model.addAttribute("part2QuesList", part2Questions);

		return "exam/part2";
	}

	@RequestMapping("exam/part3/detail/{groupNum}")
	public String examPart3Detail(Model model, HttpSession session, @PathVariable(name = "groupNum") int groupNum) {

		List<Part3Result> part3Results = (List<Part3Result>) session.getAttribute("part3Results");

		
		
		if (part3Results.size() > groupNum) {
			
			Part3 part3 = part3Results.get(groupNum).getPart3_PartResult();
			groupNum = groupNum + 1;
			model.addAttribute("groupNum", groupNum);
			model.addAttribute("part3", part3);

			return "exam/part3/review";

		} else {

			return "redirect:/exam/finished";
		}
	}
	
	@RequestMapping("exam/part4/detail/{groupNum}")
	public String examPart4Detail(Model model, HttpSession session, @PathVariable(name = "groupNum") int groupNum) {

		List<Part4Result> part4Results = (List<Part4Result>) session.getAttribute("part4Results");

		
		
		if (part4Results.size() > groupNum) {
			
			Part4 part4 = part4Results.get(groupNum).getPart4_PartResult();
			groupNum = groupNum + 1;
			model.addAttribute("groupNum", groupNum);
			model.addAttribute("part4", part4);

			return "exam/part4/review";

		} else {

			return "redirect:/exam/finished";
		}
	}
	
	@RequestMapping("exam/part6/detail/{groupNum}")
	public String examPart6Detail(Model model, HttpSession session, @PathVariable(name = "groupNum") int groupNum) {

		List<Part6Result> part6Results = (List<Part6Result>) session.getAttribute("part6Results");

		
		
		if (part6Results.size() > groupNum) {
			
			Part6 part6 = part6Results.get(groupNum).getPart6_PartResult();
			groupNum = groupNum + 1;
			model.addAttribute("groupNum", groupNum);
			model.addAttribute("part6", part6);

			return "exam/part6/review";

		} else {

			return "redirect:/exam/finished";
		}
	}
	
	@RequestMapping("exam/part7/detail/{groupNum}")
	public String examPart7Detail(Model model, HttpSession session, @PathVariable(name = "groupNum") int groupNum) {

		List<Part7Result> part7Results = (List<Part7Result>) session.getAttribute("part7Results");

		
		
		if (part7Results.size() > groupNum) {
			
			Part7 part7 = part7Results.get(groupNum).getPart7_PartResult();
			groupNum = groupNum + 1;
			model.addAttribute("groupNum", groupNum);
			model.addAttribute("part7", part7);

			return "exam/part7/review";

		} else {

			return "redirect:/exam/finished";
		}
	}
}
