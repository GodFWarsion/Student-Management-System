package com.nfsu.sis.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nfsu.sis.entities.TotalGrades;

public interface TotalGradesRepository extends JpaRepository<TotalGrades, Integer>{
	TotalGrades findByStudentSid(int sid);
}
