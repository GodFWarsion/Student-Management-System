package com.nfsu.sis.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nfsu.sis.entities.CourseList;
import com.nfsu.sis.entities.StudentList;
import com.nfsu.sis.entities.SubGradeList;
import com.nfsu.sis.entities.TotalGrades;
import com.nfsu.sis.service.CourseService;
import com.nfsu.sis.service.MarksService;
import com.nfsu.sis.service.StudentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private MarksService marksService;
	
	@GetMapping("/home/StudentList")
	public String getStudentList(Model model,@RequestParam(required = false) Integer minGrade,@RequestParam(required = false)Integer maxGrade)
	{
		
		List<StudentList>  studentsList;
		if(minGrade != null && maxGrade != null)
		{
			studentsList = studentService.getStudentsByGradeRange(minGrade,maxGrade);
		}
		else {
			studentsList = studentService.getAllStudents();
		}
		model.addAttribute("studentList", studentsList);
		return "studentlist";
		
	}
	
	@GetMapping("/home/StudentList/StudentDetails")
	public String studentDetails(@RequestParam("sid") int sid,Model model) {
		StudentList student = studentService.getStudentById(sid);
		List<SubGradeList> subGradeList = studentService.getGradesByStudentId(sid);
		TotalGrades totalGrade = studentService.getTotalGradeByStudentId(sid);
		model.addAttribute("student", student);
		model.addAttribute("subGradeList", subGradeList);
		model.addAttribute("totalGrade", totalGrade);
		return "studentdetails";
	}
	
	@GetMapping("/home/AddStudent")
	public String getStudentForm(Model model,@RequestParam("sid")int sid)
	{
		System.out.println("Received sid: " + sid);
		List<CourseList>  courses = courseService.getAllCourses();
		StudentList student = studentService.getStudentById(sid);
		System.out.println("ADD STUDENT :" + student);
		model.addAttribute("courselist", courses);
		model.addAttribute("student",student);
		return "addstudent";
		
	}
	
	@PostMapping("/addMarks")
	public String addMarks(HttpSession session,@RequestParam int sid, @RequestParam int core1Internal,@RequestParam int core1EndSem,@RequestParam int core1Practical,@RequestParam int core2Internal,@RequestParam int core2EndSem,@RequestParam int core2Practical,
			@RequestParam int elective1,@RequestParam int elective1Internal,@RequestParam int elective1EndSem,@RequestParam Integer elective1Practical,@RequestParam int elective2,@RequestParam int elective2Internal,
			@RequestParam int elective2EndSem,@RequestParam int elective3, @RequestParam int elective3Internal, @RequestParam int elective3EndSem,@RequestParam(required = false) Integer elective3Practical)	{
		try {
		marksService.addMarks(sid, core1Internal, core1EndSem, core1Practical,core2Internal,core2EndSem,core2Practical,
				 elective1,elective1Internal,elective1EndSem, elective1Practical,elective2,elective2Internal,elective2EndSem,
					elective3,elective3Internal,elective3EndSem,elective3Practical);
		session.setAttribute("success","Marks added successfully!");
		return "redirect:/home/StudentList";
	}catch (Exception e) {
		
		e.printStackTrace();
		session.setAttribute("error","Try again some error in the server");
		return "redirect:/register";
	}
		
	}

}
