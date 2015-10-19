package client.ors.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ORSController {
	static final String REST_URI = "http://localhost:8080/ORSRestfulService";
			
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		
		return "home";
	}
	
	
	@RequestMapping(value="/viewLogin", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		
		return "login";
		
	}
	
	@RequestMapping(value = "/verifyLogin", method = RequestMethod.POST)
	public String verifyLogin(HttpServletRequest request) {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username + password);
		
		return "home";
	}
	
}
