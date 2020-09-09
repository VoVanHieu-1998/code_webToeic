package com.dacnpm.toeic2020.Controller.Admin;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dacnpm.toeic2020.Model.GrammarGuideline;
import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part1;
import com.dacnpm.toeic2020.Model.Part1Question;
import com.dacnpm.toeic2020.Service.Part1ListeningService;

@Controller
@RequestMapping("/admin")
public class Part1Controller {

	@Autowired
	private Part1ListeningService part1ListeningService;

	@RequestMapping(value = { "part1/list", "part1/list/" })
	public String redirect() {
		return "redirect:/admin/part1/list/1";
	}

	@RequestMapping("/part1/list/{page}")
	public String grammarGuidelineList(Model model, @PathVariable(name = "page") int page, HttpSession session) {

		Pagging pagging = new Pagging(5);
		pagging.setIndexPage(page);

		List<Part1> part1s = this.part1ListeningService.getAll(new Part1(), pagging);
		model.addAttribute("part1s", part1s);
		model.addAttribute("pageInfo", pagging);
		return "part1-list";
	}

	@RequestMapping("/part1/detail/{id}")
	public String grammarGuidelineDetail(Model model, @PathVariable(name = "id") int id) {

		Part1 part1 = this.part1ListeningService.getPart1QuessById(id);

		Set<Part1Question> part1Questions = part1.getPart1Questions();

		model.addAttribute("part1", part1);
		model.addAttribute("viewOnly", true);
		model.addAttribute("part1Questions", part1Questions);

		return "part1-action";
	}

}
