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
import com.dacnpm.toeic2020.Model.Part2;
import com.dacnpm.toeic2020.Model.Part2Question;
import com.dacnpm.toeic2020.Service.Part2ListeningService;

@Controller
public class PracticePart2Controller {
	
	@Autowired
	private Part2ListeningService part2ListeningService;
	@RequestMapping(value = { "practice/part2", "practice/part2/" })
	public String redirect() {
		return "redirect:/practice/part2/1";
	}
	
	@RequestMapping("/practice/part2/{page}")
	public String practicePart2List(Model model, @PathVariable(name = "page") int page) {

		Pagging pagging = new Pagging(3);
		pagging.setIndexPage(page);

		List<Part2> lists = this.part2ListeningService.getAll(new Part2(), pagging);
	
		System.out.println("total page" + pagging.getTotalPages());
		model.addAttribute("lists", lists);
		model.addAttribute("pageInfo", pagging);

		return "practicePart2List";
	}

	@RequestMapping("/practice/part2/detail/{id}")
	public String practicePart2(Model model, @PathVariable(name = "id") int id, HttpSession session) {

		Part2 part2 = this.part2ListeningService.findById(id);
		Set<Part2Question> part2Questions = part2.getPart2Questions();
		model.addAttribute("mp3", part2.getMp3());
		model.addAttribute("idPart2", part2.getId());
		model.addAttribute("lists", part2Questions);
		
		return "practicePart2";
	}

}
