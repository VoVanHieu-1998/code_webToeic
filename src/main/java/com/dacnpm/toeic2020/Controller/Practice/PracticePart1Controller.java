package com.dacnpm.toeic2020.Controller.Practice;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part1;
import com.dacnpm.toeic2020.Model.Part1Question;
import com.dacnpm.toeic2020.Service.Part1ListeningService;

@Controller
public class PracticePart1Controller {
	@Autowired
	private Part1ListeningService part1ListeningService;

	@RequestMapping(value = { "practice/part1", "practice/part1/" })
	public String redirect() {
		return "redirect:/practice/part1/1";
	}

	@RequestMapping("/practice/part1/{page}")
	public String practicePart1List(Model model, @PathVariable(name = "page") int page) {

		Pagging pagging = new Pagging(3);
		pagging.setIndexPage(page);

		List<Part1> lists = this.part1ListeningService.getAll(new Part1(), pagging);

		System.out.println("total page" + pagging.getTotalPages());
		model.addAttribute("lists", lists);
		model.addAttribute("pageInfo", pagging);

		return "practicePart1List";
	}

	@RequestMapping("/practice/part1/detail/{id}")
	public String practicePart1(Model model, @PathVariable(name = "id") int id, HttpSession session) {

		Part1 part1 = this.part1ListeningService.getPart1QuessById(id);
		Set<Part1Question> part1Questions = part1.getPart1Questions();
		model.addAttribute("idPart1", part1.getId());
		model.addAttribute("lists", part1Questions);
		model.addAttribute("mp3", part1.getMp3());

		
		return "practicePart1";
	}
}