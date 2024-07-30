package com.nfsu.sis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nfsu.sis.entities.CourseList;
import com.nfsu.sis.repository.CourseListRepository;

@Service
public class CourseService {
	
	@Autowired
	private CourseListRepository courseListRepository;
	
	public List<CourseList> getAllCourses()
	{
		return courseListRepository.findAll();
	}
	
	public CourseList getCourseBy(int cid)
	{
		return courseListRepository.findById(cid).orElse(null);
	}
}
