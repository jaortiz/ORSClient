package client.ors.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Form;
import javax.ws.rs.core.MediaType;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.jaxrs.json.JacksonJaxbJsonProvider;
import org.apache.cxf.jaxrs.client.WebClient;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import client.ors.model.JobPosting;

@Controller
public class ORSController {
	
	private static final String REST_URI = "http://localhost:8080/ORSRestfulService";

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		List<Object> providers = new ArrayList<Object>();
		providers.add( new JacksonJaxbJsonProvider() );
	   
		ObjectMapper mapper = new ObjectMapper();
		
		WebClient jobClient = WebClient.create(REST_URI, providers);
		String s = "";

		jobClient = jobClient.path("/jobPostings/3").accept(MediaType.APPLICATION_JSON).type(MediaType.APPLICATION_JSON);
		
		JobPosting job = jobClient.get(JobPosting.class);
	    System.out.println("-\n-\n-\n-\n");
		System.out.println("Job:" + job.getJobName());
		s = jobClient.get(String.class);
		System.out.println("Get all Jobs --");
        System.out.println(s);
		
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
		String s = "";
		WebClient userClient = WebClient.create(REST_URI);
		
		userClient.path("/RegisteredUser/login").type(MediaType.APPLICATION_FORM_URLENCODED).accept(MediaType.APPLICATION_JSON);
		Form form = new Form();
		form.param("uid",username);
		form.param("password",password);
		
		userClient.post(form);
		s = userClient.get(String.class);
		
		System.out.println("Verified" + s);
		
		return "home";
	}
	
}
