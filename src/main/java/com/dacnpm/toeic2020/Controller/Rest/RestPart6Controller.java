package com.dacnpm.toeic2020.Controller.Rest;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dacnpm.toeic2020.Model.Part4;
import com.dacnpm.toeic2020.Model.Part4Question;
import com.dacnpm.toeic2020.Model.Part4Result;
import com.dacnpm.toeic2020.Model.Part6;
import com.dacnpm.toeic2020.Model.Part6Question;
import com.dacnpm.toeic2020.Model.Part6Result;
@Controller
@RequestMapping("API/")
public class RestPart6Controller {
	@RequestMapping(value = "exam/part6/setStatusAnswer/{groupNum}", method = RequestMethod.GET, produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Part6Question> setStatusAnswerpart6ForExam(HttpSession session,@PathVariable(name = "groupNum") int groupNum) {
	
		List<Part6Result> part6Results = (List<Part6Result>) session.getAttribute("part6Results");
		
		Part6 part6 = part6Results.get(groupNum).getPart6_PartResult();
		
		List<Part6Question> listPart6Q = new ArrayList<>();
		Part6Question part6Question;
		for(Part6Question p6: part6.getPart6Questions()) {
			part6Question= new Part6Question(p6.getId(), p6.getContent(), p6.getOp1(), p6.getOp2(),p6.getOp3(),
					p6.getOp4(),p6.getOp_true(),p6.getOrder(), p6.getOpSelected(), p6.getIsTrue());
			listPart6Q.add(part6Question);
		}
		
		return listPart6Q;
	}
}
