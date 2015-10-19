package client.ors.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ORSController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(ModelMap model) {
		
		return "home";
	}
	
	
	@RequestMapping(value="/viewLogin", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
		
	}
	
}
