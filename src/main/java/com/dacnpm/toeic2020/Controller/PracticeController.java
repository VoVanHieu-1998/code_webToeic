package com.dacnpm.toeic2020.Controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dacnpm.toeic2020.Model.Pagging;
import com.dacnpm.toeic2020.Model.Part3;
import com.dacnpm.toeic2020.Model.Part3Question;
import com.dacnpm.toeic2020.Model.User;
import com.dacnpm.toeic2020.Service.Part3ListeningService;
import com.dacnpm.toeic2020.Utils.Constant;

@Controller
public class PracticeController {

	@Autowired
	private Part3ListeningService part3ListeningService;

	@RequestMapping("/practice")
	public String practicePage(ModelMap map,HttpSession session) {
		if(session.getAttribute(Constant.USER_INFO) != null) {
			User user=(User) session.getAttribute(Constant.USER_INFO);
			map.addAttribute("user", user);
			
		}
		return "practice-page";
	}

	@RequestMapping(value = { "practice/part3", "practice/part3/" })
	public String redirect() {
		return "redirect:/practice/part3/1";
	}

	@RequestMapping("/practice/part3/{page}")
	public String practicePart3List(Model model, @PathVariable(name = "page") int page) {

		Pagging pagging = new Pagging(3);
		pagging.setIndexPage(page);

		List<Part3> lists = this.part3ListeningService.getAll(new Part3(), pagging);

		System.out.println("total page" + pagging.getTotalPages());
		model.addAttribute("lists", lists);
		model.addAttribute("pageInfo", pagging);

		return "practicePart3List";
	}

	@RequestMapping("/practice/part3/detail/{id}")
	public String practicePart3(Model model, @PathVariable(name = "id") int id, HttpSession session) {

		Part3 part3 = this.part3ListeningService.findById(id);
		Set<Part3Question> part3Questions = part3.getPart3Questions();
		model.addAttribute("idPart3", part3.getId());
		model.addAttribute("mp3", part3.getMp3());
		model.addAttribute("lists", part3Questions);

		
		return "practicePart3";
	}

	

}
