package com.nfsu.sis.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nfsu.sis.entities.StudentList;
import com.nfsu.sis.entities.SubGradeList;
import com.nfsu.sis.entities.TotalGrades;
import com.nfsu.sis.repository.StudentListRepository;
import com.nfsu.sis.repository.SubGradeListRepository;
import com.nfsu.sis.repository.TotalGradesRepository;

@Service
public class StudentService {
	
	@Autowired
	private StudentListRepository studentListRepository;
	
	@Autowired
	private SubGradeListRepository subGradeListRepository;
	
	@Autowired
	private TotalGradesRepository totalGradesRepository;
	
	public List<StudentList> getAllStudents()
	{
		return studentListRepository.findAll();
	}
	
	public StudentList getStudentById(int sid)
	{
	     return	studentListRepository.findById(sid).orElse(null);
	}
	
	public List<SubGradeList> getGradesByStudentId(int sid) {
		return subGradeListRepository.findByStudentSid(sid);
	}
	
	public TotalGrades getTotalGradeByStudentId(int sid) {
		return totalGradesRepository.findByStudentSid(sid);
	}
	public List<StudentList> getStudentsByGradeRange(int minGrade,int maxGrade)
	{
		List<StudentList> studentsInRangeList = new ArrayList<>();
		
		List<StudentList> studentsList = studentListRepository.findAll();
		
		for(StudentList student : studentsList) {
			
			TotalGrades totalGrades = totalGradesRepository.findByStudentSid(student.getSid());
			
			if(totalGrades != null)
			{
				int grade = totalGrades.getTotalscore();
				if(grade >= minGrade && grade <= maxGrade)
				{
					studentsInRangeList.add(student);
				}
			}
		}
		
		return studentsInRangeList;
		
	}
}
