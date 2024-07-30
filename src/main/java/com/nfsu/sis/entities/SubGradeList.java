package com.nfsu.sis.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="subgradelist")
public class SubGradeList {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int grid;
	
	@ManyToOne
	@JoinColumn(name="sid",nullable = false)
	private StudentList student;
	
	@ManyToOne
	@JoinColumn(name="cid",nullable = false)
	private CourseList course;
	
	private String grade;

	public int getGrid() {
		return grid;
	}

	public void setGrid(int grid) {
		this.grid = grid;
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

}
