package client.ors.controller;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Form;
import javax.ws.rs.core.MediaType;

import org.apache.cxf.jaxrs.client.WebClient;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ORSController {
	
	private static final String REST_URI = "http://localhost:8080/ORSRestfulService";
	
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
		
		WebClient userClient = WebClient.create(REST_URI);
		
		userClient.path("/RegisteredUser/login").type(MediaType.APPLICATION_FORM_URLENCODED).accept(MediaType.APPLICATION_JSON);
		Form form = new Form();
		form.param("uid",username);
		form.param("password",password);
		
		userClient.post(form);
		//String result = userClient.get(String.class);
		
		//System.out.println("Verified" + result);
		
		return "home";
	}
	
}
