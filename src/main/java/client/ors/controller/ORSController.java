package client.ors.controller;

import java.net.URI;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.QueryParam;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.Form;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.jaxrs.json.JacksonJaxbJsonProvider;

import org.apache.cxf.jaxrs.client.WebClient;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import client.ors.model.*;

@Controller
public class ORSController {
	
	private static final String REST_URI = "http://localhost:8080/ORSRestfulService";
	private static final String CLIENT_URI = "http://localhost:8080/ORS_Client/";
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		List<Object> providers = new ArrayList<Object>();
		providers.add( new JacksonJaxbJsonProvider() );
	   
		ObjectMapper mapper = new ObjectMapper();
		
		WebClient jobClient = WebClient.create(REST_URI, providers);
		String s = "";

		jobClient = jobClient.path("/jobPostings").accept(MediaType.APPLICATION_JSON).type(MediaType.APPLICATION_JSON);
		
		List<JobPosting> jobList = (ArrayList<JobPosting>) jobClient.getCollection(JobPosting.class);
		
		s = jobClient.get(String.class);
		
		request.setAttribute("jobList", jobList);
		
		return "home";
	}
	
	@RequestMapping(value = "/advancedSearch", method = RequestMethod.GET)
	public String advancedSearch(HttpServletRequest request) {
		return "advancedSearch";
	}
	
	@RequestMapping(value = "/SearchJobs", method = RequestMethod.GET)
	public String SearchJobs(HttpServletRequest request) {
		List<Object> providers = new ArrayList<Object>();
		providers.add( new JacksonJaxbJsonProvider() );
		
		String jobName = request.getParameter("jobname");
		String position = request.getParameter("position");
		String location = request.getParameter("location");
		String description = request.getParameter("description");
		
		ObjectMapper mapper = new ObjectMapper();
		
		WebClient jobClient = WebClient.create(REST_URI, providers);
		String s = "";

		jobClient = jobClient.path("/jobPostings/jobSearch").accept(MediaType.APPLICATION_JSON).type(MediaType.APPLICATION_JSON);
		if (jobName != null){
			jobClient.query("jobName", jobName);
		}
		if(position != null) {
			jobClient.query("position", position);
		}
		if (location != null) {
			jobClient.query("location", location);
		}
		if (description != null) {
			jobClient.query("description", description);
		}
		
		
		List<JobPosting> jobList = (ArrayList<JobPosting>) jobClient.getCollection(JobPosting.class);
		
		request.setAttribute("jobList", jobList);
		
		System.out.println("Get all Jobs --");
        System.out.println(s);
		//System.out.println(jobList.get(1).getJobName());
		return "home";
	}
	
	@RequestMapping(value = "/TeamApplications", method = RequestMethod.GET)
	public String TeamApplications(HttpServletRequest request) {
		List<Object> providers = new ArrayList<Object>();
		providers.add( new JacksonJaxbJsonProvider() );
		
		RegisteredUser user = (RegisteredUser) request.getSession().getAttribute("user");
				
		ObjectMapper mapper = new ObjectMapper();
		
		WebClient appClient = WebClient.create(REST_URI, providers);
		String s = "";

		appClient = appClient.path("/assignedApplicationByTeam/" + user.getDepartment()).accept(MediaType.APPLICATION_JSON).type(MediaType.APPLICATION_JSON);
				
		List<AssignedApplication> assignedAppList = (ArrayList<AssignedApplication>) appClient.getCollection(AssignedApplication.class);
		List<Application> appList = new ArrayList<Application>();
		int i = 0;
		
		while (assignedAppList != null && assignedAppList.get(i) != null) {
			appClient = WebClient.create(REST_URI, providers);
			appClient = appClient.path("/viewByID").accept(MediaType.APPLICATION_JSON).type(MediaType.APPLICATION_JSON);
			appClient.query("appID", assignedAppList.get(i).getAppId());
			appList.add(appClient.get(Application.class));
		}
			
		request.setAttribute("appList", appList);
		
		System.out.println("Get all Jobs --");
        System.out.println(s);
		//System.out.println(jobList.get(1).getJobName());
		return "allTeamApplications";
	}
	
	@RequestMapping(value = "/displayJob", method = RequestMethod.GET)
	public String displayJob(HttpServletRequest request) {
		String jobIdString = request.getParameter("jobid");
		List<Object> providers = new ArrayList<Object>();
		providers.add( new JacksonJaxbJsonProvider() );
	   
		ObjectMapper mapper = new ObjectMapper();
		
		WebClient jobClient = WebClient.create(REST_URI, providers);
		String s = "";

		jobClient = jobClient.path("/jobPostings/" + jobIdString).accept(MediaType.APPLICATION_JSON).type(MediaType.APPLICATION_JSON);
		
		
		JobPosting job = jobClient.get(JobPosting.class);
		
		request.setAttribute("job", job);
		
		return "displayJob";
	}
	
	@RequestMapping(value = "/displayApplication", method = RequestMethod.GET)
	public String displayApplication(HttpServletRequest request) {
		String appIdString = request.getParameter("appID");
		List<Object> providers = new ArrayList<Object>();
		providers.add( new JacksonJaxbJsonProvider() );
	   
		ObjectMapper mapper = new ObjectMapper();
		
		WebClient appClient = WebClient.create(REST_URI, providers);
		String s = "";

		appClient = appClient.path("/applications/viewByID").accept(MediaType.APPLICATION_JSON).type(MediaType.APPLICATION_JSON);
		appClient.query("appID", appIdString);
		
		Application app = appClient.get(Application.class);

		request.setAttribute("app", app);
		
		return "displayApplication";
	}
	
	@RequestMapping(value = "/apply", method = RequestMethod.GET)
	public String applyToJob(HttpServletRequest request) {
		String jobIdString = request.getParameter("jobid");
		List<Object> providers = new ArrayList<Object>();
		providers.add( new JacksonJaxbJsonProvider() );
	   
		ObjectMapper mapper = new ObjectMapper();
		
		WebClient jobClient = WebClient.create(REST_URI, providers);
		String s = "";

		jobClient = jobClient.path("/jobPostings/" + jobIdString).accept(MediaType.APPLICATION_JSON).type(MediaType.APPLICATION_JSON);
		
		//List<JobPosting> jobList = (ArrayList<JobPosting>) jobClient.getCollection(JobPosting.class);
		
		JobPosting job = jobClient.get(JobPosting.class);
		
		request.setAttribute("job", job);
		
		return "apply";
	}
	
	@RequestMapping(value = "/apply", method = RequestMethod.POST)
	public String appliedToJob(HttpServletRequest request) {
		String jobIdString = request.getParameter("jobid");
		Application app = new Application();
		
		app.setFirstName(request.getParameter("firstName"));
		app.setLastName(request.getParameter("surname"));
		app.setDriversLicence(Integer.parseInt(request.getParameter("licence")));
		app.setEmail(request.getParameter("email"));
		app.setPhoneNumber(request.getParameter("phone"));
		app.setPostcode(Integer.parseInt(request.getParameter("postcode")));
		app.setCoverLetter(request.getParameter("cover"));
		app.setResume(request.getParameter("resume"));
		app.setJobId(Integer.parseInt(jobIdString));
		
		List<Object> providers = new ArrayList<Object>();
		providers.add( new JacksonJaxbJsonProvider() );
	   
		ObjectMapper mapper = new ObjectMapper();
		
		WebClient jobClient = WebClient.create(REST_URI, providers);
		String s = "";

		jobClient = jobClient.path("/applications/newApplication").accept(MediaType.APPLICATION_JSON).type(MediaType.APPLICATION_JSON);
		URI appLoc = jobClient.post(app).getLocation();
		
		String msg = "Your application can be viewed and updated at: "
				+ CLIENT_URI + "displayApplication?" + appLoc.getQuery();
		
		request.setAttribute("msg", msg);
		
		return "msg";
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
		Response response = userClient.post(form);
		
		if(response.readEntity(String.class).equals("true")) {
			HttpSession session = request.getSession(true);		//if no session create one
			session.setAttribute("user", username);
		} else {
			System.out.println("Incorrect Username or password");
		}
		
		
		
		
		return "home";
	}
	
}
