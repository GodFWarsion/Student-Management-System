<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.nfsu.sis.entities.CourseList" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Course List | Student Information System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/clstyles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
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
            <h1>Course List</h1>
        </header>
        <main class="mt-4">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Course ID</th>
                        <th>Course Name</th>
                        <th>Credits</th>
                        <th>Type</th>
                        <th>Theory</th>
                        <th>Lab</th>
                        <th>Internal</th>
                        <th>End Sem</th>
                        <th>Practical</th>
                        <th>Professor</th>
                    </tr>
                </thead>
                <tbody>
					<c:out value="hi am"/>
					<c:forTokens items = "Zara,nuha,roshy" delims = "," var = "name">
						<c:out value = "${name}"/><p>
					</c:forTokens>
					
                    <%
                        List<CourseList> courses = (List<CourseList>) request.getAttribute("listCourses");
                        if (courses != null) {
                            for (CourseList course : courses) {
                    %>
                    <tr>
                        <td><%= course.getC_CourseID() %></td>
                        <td><%= course.getCourse_name() %></td>
                        <td><%= course.getC_credit() %></td>
                        <td><%= course.getC_typeString() %></td>
                        <td><%= course.getC_theory() %></td>
                        <td><%= course.getC_lab() %></td>
                        <td><%= course.getCinternal() %></td>
                        <td><%= course.getC_endsem() %></td>
                        <td><%= course.getPractical() %></td>
                        <td><%= course.getProfessor() %></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </main>
        <footer>
            <p>© 2024 Student Information System</p>
        </footer>
    </div>
</body>
</html>
