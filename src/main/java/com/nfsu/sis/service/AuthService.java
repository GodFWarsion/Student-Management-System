package com.nfsu.sis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nfsu.sis.entities.AdminLogin;
import com.nfsu.sis.entities.StudentList;
import com.nfsu.sis.entities.Userlogin;
import com.nfsu.sis.repository.AdminLogRepository;
import com.nfsu.sis.repository.StudentListRepository;
import com.nfsu.sis.repository.UserlogRepository;

@Service
public class AuthService {

    @Autowired
    private UserlogRepository userlogRepository;

    @Autowired
    private StudentListRepository studentListRepository;
    
    @Autowired
    private AdminLogRepository adminLogRepository;
 
    public Userlogin findByUsername(String username) {
        return userlogRepository.findByUsername(username);
    }
    
    public AdminLogin findAdminByUsername(String username)
    {
    	return adminLogRepository.findByUsername(username);
    }

    @Transactional
    public void registerUser(String firstName, String lastName, String email,
                             String username, String password, int age, String phoneNumber) {
        // Save student first
        StudentList student = new StudentList();
        student.setFname(firstName);
        student.setLname(lastName);
        student.setEmail(email);
        student.setAge(age);
        student.setPhone_number(phoneNumber);
        studentListRepository.save(student);

        // Retrieve the generated sid
        int studentId = student.getSid();
        System.out.println("Generated Student ID: " + studentId);

        // Save user login with the retrieved sid
        Userlogin userlogin = new Userlogin();
        userlogin.setId(studentId); // Set the foreign key
        userlogin.setUsername(username);
        userlogin.setIs_active(true);
        userlogin.setPasswd(password);

        userlogRepository.save(userlogin);
    }
}
