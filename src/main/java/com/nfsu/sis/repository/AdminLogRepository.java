package com.nfsu.sis.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nfsu.sis.entities.AdminLogin;

public interface AdminLogRepository extends JpaRepository<AdminLogin, Integer>{
	AdminLogin  findByUsername(String username);
}
