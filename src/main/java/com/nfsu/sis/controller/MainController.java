package com.nfsu.sis.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpSession;



@Controller
public class MainController {
		
	@GetMapping("/")
	public String defaultHome()
	{
		return "loginpage";
	}

	@GetMapping("/home")
	public String Home(HttpSession session,Model model)
	{
		String uname =(String)session.getAttribute("uname");
		int sid = (Integer)session.getAttribute("sid");
		System.out.println("SID provided: "+sid + uname );
		model.addAttribute("sid", sid);
		model.addAttribute("uname",uname);
//		if(sid != 0)
//		{
//			StudentList student = studentService.getStudentById(sid);
//			model.addAttribute("student", student);
//		}
		return "homepage";
	}
	
	@GetMapping("/home/AboutUs")
    public String getAboutus() {
        return "aboutus";
    }
	 

}
