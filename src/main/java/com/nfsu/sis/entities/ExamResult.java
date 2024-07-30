package com.nfsu.sis.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="examresult")
public class ExamResult {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int resid;
	
	@ManyToOne
	@JoinColumn(name="sid",nullable = false)
	private StudentList student;
	
	@ManyToOne
	@JoinColumn(name="cid",nullable = false)
	private CourseList course;
	
	@ManyToOne
	@JoinColumn(name = "exid",nullable = false)
	private ExamList exam;
	
	private int obtmarks;

	public int getResid() {
		return resid;
	}

	public void setResid(int resid) {
		this.resid = resid;
	}

	public StudentList getStudent() {
		return student;
	}

	public void setStudent(StudentList student) {
		this.student = student;
	}

	public CourseList getCourse() {
		return course;
	}

	public void setCourse(CourseList course) {
		this.course = course;
	}

	public ExamList getExam() {
		return exam;
	}

	public void setExam(ExamList exam) {
		this.exam = exam;
	}

	public int getObtmarks() {
		return obtmarks;
	}

	public void setObtmarks(int obtmarks) {
		this.obtmarks = obtmarks;
	}
	
	
}
