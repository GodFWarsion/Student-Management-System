package com.nfsu.sis.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nfsu.sis.entities.StudentList;

public interface StudentListRepository extends JpaRepository<StudentList, Integer>{
	

}
