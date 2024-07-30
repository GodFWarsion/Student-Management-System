package com.nfsu.sis.entities;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "examlist")
public class ExamList {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int exid;
	
	@Column(name = "exname",nullable = false)
	private String exanme;
	
	@Column(name="exdate",nullable = false)
	private Date exDate;

	public int getExid() {
		return exid;
	}

	public void setExid(int exid) {
		this.exid = exid;
	}

	public String getExanme() {
		return exanme;
	}

	public void setExanme(String exanme) {
		this.exanme = exanme;
	}

	public Date getExDate() {
		return exDate;
	}

	public void setExDate(Date exDate) {
		this.exDate = exDate;
	}

	public ExamList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ExamList(int exid) {
		super();
		this.exid = exid;
	}
	
	

}
