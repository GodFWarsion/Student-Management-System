<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nfsu.sis.entities.StudentList" %>
<%@ page import="com.nfsu.sis.entities.SubGradeList" %>
<%@ page import="com.nfsu.sis.entities.TotalGrades" %>
<%@ page import="com.nfsu.sis.entities.CourseList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Details | Student Information System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clstyles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<style>
	        body {
	            display: flex;
	            flex-direction: column;
	            min-height: 100vh;
	        }

	        main {
	            flex: 1;
	        }

	        footer {
	            position: relative;
	            bottom: 50;
	            width: 100%;
	            background-color: #f8f9fa;
	            padding: 10px 0;
	            text-align: center;
	        }
	    </style>
</head>
<body>
    <div class="">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home/CourseList">Course List</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home/StudentList">Student List</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home/AddStudent">Add Student</a></li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home/AboutUs">About</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logmeout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </nav>
        <header class="jumbotron text-center mt-3">
            <h1>Student Details</h1>
        </header>
        <main class="mt-4">
            <div class="container">
                <h3>Student Information</h3>
                <table class="table table-bordered">
                    <tr>
                        <th>Student ID</th>
                        <td><%= ((StudentList) request.getAttribute("student")).getSid() %></td>
                    </tr>
                    <tr>
                        <th>First Name</th>
                        <td><%= ((StudentList) request.getAttribute("student")).getFname() %></td>
                    </tr>
                    <tr>
                        <th>Last Name</th>
                        <td><%= ((StudentList) request.getAttribute("student")).getLname() %></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><%= ((StudentList) request.getAttribute("student")).getEmail() %></td>
                    </tr>
                </table>

                <h3>Courses and Grades</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Course ID</th>
                            <th>Course Name</th>
                            <th>Grade</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<SubGradeList> subGradeList = (List<SubGradeList>) request.getAttribute("subGradeList");
                            for (SubGradeList subGrade : subGradeList) {
                        %>
                        <tr>
                            <td><%= subGrade.getCourse().getCid() %></td>
                            <td><%= subGrade.getCourse().getCourse_name() %></td>
                            <td><%= subGrade.getGrade() %></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>

                <h3>Total Grade</h3>
                <table class="table table-bordered">
                    <tr>
                        <th>Total Score</th>
                        <td><%= ((TotalGrades) request.getAttribute("totalGrade")).getTotalscore() %></td>
                    </tr>
                    <tr>
                        <th>Grade</th>
                        <td><%= ((TotalGrades) request.getAttribute("totalGrade")).getGrade() %></td>
                    </tr>
                </table>
            </div>
        </main>
        <footer>
            <p>© 2024 Student Information System</p>
        </footer>
    </div>
</body>
</html>
