package com.dacnpm.toeic2020.Controller.Practice;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part4;
import com.dacnpm.toeic2020.Model.Part4Question;
import com.dacnpm.toeic2020.Model.Part5Lesson;
import com.dacnpm.toeic2020.Model.Part5Question;
import com.dacnpm.toeic2020.Service.Part4ListeningService;
import com.dacnpm.toeic2020.Service.Part5LessonService;
import com.dacnpm.toeic2020.Service.Part5ReadingService;

@Controller
public class PracticePart5Controller {

	@Autowired
	private Part5ReadingService part5ReadingService;
	@Autowired
	private Part5LessonService part5LessonService;

	@RequestMapping(value = { "practice/part5", "practice/part5/" })
	public String redirect(HttpSession session) {
		session.removeAttribute("practicePart5Review");
		return "redirect:/practice/part5/1";
	}

	public void sortPart5Ques(List<Part5Question> part5Questions) {
		Collections.sort(part5Questions, new Comparator<Part5Question>() {

			@Override
			public int compare(Part5Question o1, Part5Question o2) {

				return o1.getOrder() - o2.getOrder();
			}

		});
	}

	@RequestMapping("/practice/part5/{page}")
	public String practicePart5List(Model model, @PathVariable(name = "page") int page) {

		Pagging pagging = new Pagging(3);
		pagging.setIndexPage(page);

		List<Part5Lesson> part5Lessons = this.part5LessonService.getAll(new Part5Lesson(), pagging);

		System.out.println("total page" + pagging.getTotalPages());
		model.addAttribute("lists", part5Lessons);
		model.addAttribute("pageInfo", pagging);

		return "practicePart5List";
	}

	@RequestMapping("/practice/part5/detail")
	public String practicePart4(Model model, @RequestParam(name = "lessonId") int lessonId,
			@RequestParam(name = "groupNum") int groupNum, HttpSession session) {

		Part5Lesson part5Lesson = this.part5LessonService.findPart5LessonById(lessonId);
		List<Part5Question> part5QuestionList = new ArrayList<Part5Question>();

		for (Part5Question p5q : part5Lesson.getPart5Questions()) {
			part5QuestionList.add(p5q);
		}
		sortPart5Ques(part5QuestionList);
		Part5Question part5Question = part5QuestionList.get(groupNum);
		Set<Part5Question> part5Questions = part5Lesson.getPart5Questions();
		model.addAttribute("idPart5Lesson", part5Lesson.getId());
		model.addAttribute("groupNum", groupNum);
		model.addAttribute("part5Question", part5Question);

		return "practicePart5";
	}

	@RequestMapping("/practice/part5/result")
	public String practicePart5Result(Model model, HttpSession session) {

		List<Part5Question> part5Questions = (List<Part5Question>) session.getAttribute("practicePart5Review");
		int countTrue = 0;
		for (Part5Question p5Q : part5Questions) {

			if (p5Q.getIsTrue() == 1) {
				countTrue++;
			}

		}

		model.addAttribute("countTrue", countTrue);
		model.addAttribute("total", part5Questions.size());

		return "practice-part5-result";
	}

	@RequestMapping("/practice/part5/review")
	public String practicePart5Review(Model model, HttpSession session) {
        if(session.getAttribute("practicePart5Review")!= null) {
        	List<Part5Question> part5Questions = (List<Part5Question>) session.getAttribute("practicePart5Review");
    		int countTrue = 0;
    		int countNonSelected = 0;
    		for (Part5Question p5Q : part5Questions) {

    			System.out.println(p5Q.getId());
    			if (p5Q.getIsTrue() == 1 && p5Q.getOpSelected() != null) {
    				countTrue++;
    			}

    			if (p5Q.getOpSelected() == null) {
    				countNonSelected++;
    			}

    		}
    		
    		
    		model.addAttribute("countTrue", countTrue);
    		model.addAttribute("total", part5Questions.size());
    		model.addAttribute("countFalse", part5Questions.size() - countTrue);
    		model.addAttribute("countNonSelected", countNonSelected);

    		model.addAttribute("part5Questions", part5Questions);

    		return "practice-part5-review";
        }
        return "practice/part5";
		
	}

}
