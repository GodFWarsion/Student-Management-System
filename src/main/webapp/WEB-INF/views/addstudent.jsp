<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nfsu.sis.entities.StudentList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nfsu.sis.entities.CourseList" %>
<%StudentList student = (StudentList)request.getAttribute("student"); 
List<CourseList> courseList = (List<CourseList>)request.getAttribute("courselist");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student Marks</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Add Student Marks</h2>
        <form id="addMarksForm" action="/addMarks" method="POST" novalidate>
			<div class="form-row">
            <div class="form-group col-md-4">
                <label for="studentName">Student Name</label>
                <input type="text" class="form-control" id="studentName" name="studentName" value=<%= student.getFname() + ' ' + student.getLname() %> readonly>
            </div>
            <div class="form-group col-md-4">
                <label for="sid">Student ID</label>
                <input type="text" class="form-control" id="sid" name="sid" value=<%= student.getSid() %> readonly>
            </div>
            <div class="form-group col-md-4">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" value=<%= student.getEmail() %> readonly>
            </div>
			</div>
			
			<h4>Core Subjects</h4>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="core1Internal">Java Core - Internal</label>
                    <input type="number" class="form-control" id="core1Internal" name="core1Internal" required>
                </div>
                <div class="form-group col-md-4">
                    <label for="core1EndSem">Java Core - End Semester</label>
                    <input type="number" class="form-control" id="core1EndSem" name="core1EndSem" required>
                </div>
                <div class="form-group col-md-4">
                    <label for="core1Practical">Java Core - Practical</label>
                    <input type="number" class="form-control" id="core1Practical" name="core1Practical" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="core2Internal">OOPs with Python - Internal</label>
                    <input type="number" class="form-control" id="core2Internal" name="core2Internal" required>
                </div>
                <div class="form-group col-md-4">
                    <label for="core2EndSem">OOPs with Python - End Semester</label>
                    <input type="number" class="form-control" id="core2EndSem" name="core2EndSem" required>
                </div>
                <div class="form-group col-md-4">
                    <label for="core2Practical">OOPs with Python - Practical</label>
                    <input type="number" class="form-control" id="core2Practical" name="core2Practical" required>
                </div>
            </div>
			<h4>Elective Subjects</h4>
			<div class="form-row">
            <div class="form-group col-md-4">
                <label for="elective1">Elective Subject 1</label>
                <select class="form-control" id="elective1" name="elective1" required>
                    <%
                       
                        for (CourseList course : courseList) {
                            if (!course.isC_type()) { // Only include elective subjects
                    %>
                        <option value=<%= course.getCid() %>><%= course.getCourse_name() %></option>
                    <%
                            }
                        }
                    %>
			</select>
            </div>
            <div class="form-group col-md-4">
                <label for="elective1Internal">Elective Subject 1 - Internal</label>
                <input type="number" class="form-control" id="elective1Internal" name="elective1Internal" required>
            </div>
            <div class="form-group col-md-4">
                <label for="elective1EndSem">Elective Subject 1 - End Semester</label>
                <input type="number" class="form-control" id="elective1EndSem" name="elective1EndSem" required>
            </div>
            <div class="form-group col-md-4">
                <label for="elective1Practical">Elective Subject 1 - Practical</label>
                <input type="number" class="form-control" id="elective1Practical" name="elective1Practical" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="elective2">Elective Subject 2</label>
				<select class="form-control" id="elective2" name="elective2" required>
                    <%
                        for (CourseList course : courseList) {
                            if (!course.isC_type()) { // Only include elective subjects
                    %>
                        <option value="<%= course.getCid() %>"><%= course.getCourse_name() %></option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label for="elective2Internal">Elective Subject 2 - Internal</label>
				<input type="number" class="form-control" id="elective2Internal" name="elective2Internal" required>
                </div>
                <div class="form-group col-md-4">
                    <label for="elective2EndSem">Elective Subject 2 - End Semester</label>
                    <input type="number" class="form-control" id="elective2EndSem" name="elective2EndSem" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="elective3">Elective Subject 3</label>
                    <select class="form-control" id="elective3" name="elective3" required>
                        <%
                            for (CourseList course : courseList) {
                                if (!course.isC_type()) { // Only include elective subjects
                        %>
                            <option value="<%= course.getCid() %>"><%= course.getCourse_name() %></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label for="elective3Internal">Elective Subject 3 - Internal</label>
                    <input type="number" class="form-control" id="elective3Internal" name="elective3Internal" required>
                </div>
                <div class="form-group col-md-4">
                    <label for="elective3EndSem">Elective Subject 3 - End Semester</label>
                    <input type="number" class="form-control" id="elective3EndSem" name="elective3EndSem" required>
                </div>
				<div class="form-group col-md-4">
		            <label for="elective3Practical">Elective 3 - Practical</label>
		            <input type="number" class="form-control" id="elective3Practical" name="elective3Practical">
				</div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Add Marks</button>
        </form>
        <a href="${pageContext.request.contextPath}/home/StudentList" class="d-block text-center mt-3">View All Results</a>
    </div>
	
	            
				

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGaHf5K8czvFeg1FVKF5f3e6F" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- Custom JS for form validation -->
    <script>
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var form = document.getElementById('addMarksForm');
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            }, false);
        })();
    </script>
</body>
</html>
