package com.nfsu.sis.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nfsu.sis.entities.CourseList;
import com.nfsu.sis.repository.CourseListRepository;
 


@Controller
public class CourseController {
	
	@Autowired
	private CourseListRepository courseListRepository;
	
	@GetMapping("/home/CourseList")
	public String getCourseList(Model model)
	{
		List<CourseList> courses = courseListRepository.findAll();
		
		
//		model.addAttribute("listCourses",courses);
		model.addAttribute("listCourses",courses);
		return "courselist";  
	}
	

}
 