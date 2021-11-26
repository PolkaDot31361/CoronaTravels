package scit.classa.three.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MapController {
	
	@RequestMapping(value = "map/toMap", method = RequestMethod.GET)
	public String toMap() {
		return "map/map";
	}
	
	@RequestMapping(value = "map/toMain", method = RequestMethod.GET)
	public String toMain() {
		return "map/main";
	}
	
	@RequestMapping(value = "toMain", method = RequestMethod.GET)
	public String Main() {
		return "main";
	}
	

}
