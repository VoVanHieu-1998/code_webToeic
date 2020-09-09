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
import com.dacnpm.toeic2020.Model.Part3;
import com.dacnpm.toeic2020.Model.Part3Question;
import com.dacnpm.toeic2020.Model.Part4;
import com.dacnpm.toeic2020.Model.Part4Question;
import com.dacnpm.toeic2020.Service.Part3ListeningService;
import com.dacnpm.toeic2020.Service.Part4ListeningService;

@Controller
public class PracticePart4Controller {

	@Autowired
	private Part4ListeningService part4ListeningService;

	@RequestMapping(value = { "practice/part4", "practice/part4/" })
	public String redirect() {
		return "redirect:/practice/part4/1";
	}

	@RequestMapping("/practice/part4/{page}")
	public String practicePart4List(Model model, @PathVariable(name = "page") int page) {

		Pagging pagging = new Pagging(3);
		pagging.setIndexPage(page);

		List<Part4> lists = this.part4ListeningService.getAll(new Part4(), pagging);

		System.out.println("total page" + pagging.getTotalPages());
		model.addAttribute("lists", lists);
		model.addAttribute("pageInfo", pagging);

		return "practicePart4List";
	}

	@RequestMapping("/practice/part4/detail/{id}")
	public String practicePart4(Model model, @PathVariable(name = "id") int id, HttpSession session) {

		Part4 part4 = this.part4ListeningService.findById(id);
		Set<Part4Question> part4Questions = part4.getPart4Questions();
		model.addAttribute("idPart4", part4.getId());
		model.addAttribute("mp3", part4.getMp3());
		model.addAttribute("lists", part4Questions);

		return "practicePart4";
	}

}
