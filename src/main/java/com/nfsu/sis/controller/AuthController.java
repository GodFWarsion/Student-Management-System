package com.nfsu.sis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nfsu.sis.entities.AdminLogin;
import com.nfsu.sis.entities.Userlogin;
import com.nfsu.sis.service.AuthService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {
	
	@Autowired
	private AuthService authService;
	
	@GetMapping("/adminlogin")
	public String adminLogin()
	{
		return "adminlogin";
	}
	
	@PostMapping("/adminlogging")
	public String AdLoggingIn(HttpSession session,Model model,@RequestParam String adminUsername,@RequestParam String adminPassword)
	{
		System.out.println("Login attempt with username: " + adminUsername);
		AdminLogin admin = authService.findAdminByUsername(adminUsername);
		if(admin != null && admin.getPasswd().equals(adminPassword))
		{
			System.out.println("User found: " + admin.getUsername());
			System.out.println("Password provided: " + adminPassword);
			session.setAttribute("adusername",adminUsername);
			int sid = admin.getId();
			System.out.println("SID given"+ sid);
			session.setAttribute("sid", sid);
			return "redirect:/home";
		}
		else {
			model.addAttribute("error", "Error You are not admin");
			return "adminlogin";
		}
	}
	@GetMapping("/login")
	public String Login()
	{
		return "loginpage";
	}
	
	@PostMapping("/logging")
	public String loggingIn(Model model,@RequestParam String uname,@RequestParam String pswd, HttpSession session)
	{
		System.out.println("Login attempt with username: " + uname);
		
		Userlogin user = authService.findByUsername(uname);
		if(user != null && user.getPasswd().equals(pswd) && user.getIs_active())
		{
			System.out.println("User found: " + user.getUsername());
			System.out.println("Password provided: " + pswd);
			session.setAttribute("uname",uname);
			int sid = user.getId();
			System.out.println("SID provided: " + sid);
			session.setAttribute("sid", sid);
			return "redirect:/home";
		}
		else 
		{
			model.addAttribute("error","Invalid username or password");
			return "loginpage";
				
		}
	}
	
	@GetMapping("/register")
	public String registerIn(HttpSession session,Model model)
	{
		String errorMessage = (String) session.getAttribute("error");
        if (errorMessage != null) {
            model.addAttribute("error", errorMessage);
            session.removeAttribute("error");
        }
		return "registerpage";
	}
	
	@PostMapping("/register")
	public String registerUser(HttpSession session,Model model,@RequestParam String firstName,@RequestParam String lastName,@RequestParam String email,@RequestParam String username,@RequestParam String password,@RequestParam int age,@RequestParam String phoneNumber) 
	{
		try {
		authService.registerUser(firstName, lastName, email, username, password, age, phoneNumber);
		session.setAttribute("success","Registration successful! Please log in!!");
		return "redirect:/login";
		
		}catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "An error occurred during registration. Please try again.");
			return "redirect:/register";
		}
		
	}
	
	
}
	


