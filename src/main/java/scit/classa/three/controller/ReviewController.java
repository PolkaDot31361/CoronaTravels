package scit.classa.three.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class ReviewController {
	
	public String toAddReview(Model model, String place) {
		model.addAttribute("reivew_item", place);
		return "/review/addReview";
	}
}
