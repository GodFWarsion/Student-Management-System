package com.nfsu.sis.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "courselist")
public class CourseList {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cid;
	
	private String course_name;
    private int c_credit;
    private boolean c_type;
    private int c_theory;
    private int c_lab;
    private int cinternal;
    private int c_endsem;
    private int practical;
    private String professor;
    
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public int getC_credit() {
		return c_credit;
	}
	public void setC_credit(int c_credit) {
		this.c_credit = c_credit;
	}
	public boolean isC_type() {
		return c_type;
	}
	public void setC_type(boolean c_type) {
		this.c_type = c_type;
	}
	public int getC_theory() {
		return c_theory;
	}
	public void setC_theory(int c_theory) {
		this.c_theory = c_theory;
	}
	public int getC_lab() {
		return c_lab;
	}
	public void setC_lab(int c_lab) {
		this.c_lab = c_lab;
	}
	public int getCinternal() {
		return cinternal;
	}
	public void setCinternal(int cinternal) {
		this.cinternal = cinternal;
	}
	public int getC_endsem() {
		return c_endsem;
	}
	public void setC_endsem(int c_endsem) {
		this.c_endsem = c_endsem;
	}
	public int getPractical() {
		return practical;
	}
	public void setPractical(int practical) {
		this.practical = practical;
	}
	
	public String getC_typeString() {
        return c_type ? "Core" : "Elective";
    }
	public String getC_CourseID() {
        return "CTBTCSE P" + cid;
    }
	public CourseList(int cid) {
		super();
		this.cid = cid;
	}
	public CourseList() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
} 
