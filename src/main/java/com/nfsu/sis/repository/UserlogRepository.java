package com.nfsu.sis.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.nfsu.sis.entities.Userlogin;



public interface UserlogRepository extends JpaRepository<Userlogin, Integer> {
	
	Userlogin  findByUsername(String username);

}
