package com.nfsu.sis.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nfsu.sis.entities.SubGradeList;

public interface SubGradeListRepository extends JpaRepository<SubGradeList, Integer>{
	
	List<SubGradeList> findByStudentSid(int sid);

}
