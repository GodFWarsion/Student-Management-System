<%@ page import="java.util.List" %>
<%@ page import="com.nfsu.sis.entities.StudentList" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student List | Student Information System</title>
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
            <h1>Student List</h1>
        </header>
        <main class="mt-4">
			<form action="${pageContext.request.contextPath}/home/StudentList" method="GET">
			                <div class="form-row">
			                    <div class="col-md-3">
			                        <input type="number" class="form-control" placeholder="Min Grade" name="minGrade">
			                    </div>
			                    <div class="col-md-3">
			                        <input type="number" class="form-control" placeholder="Max Grade" name="maxGrade">
			                    </div>
			                    <div class="col-md-3">
			                        <button type="submit" class="btn btn-primary">Apply Filter</button>
			                    </div>
			                </div>
			            </form>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<StudentList> students = (List<StudentList>) request.getAttribute("studentList");
                        if (students != null) {
                            for (StudentList student : students) {
                    %>
                    <tr>
                        <td><%= student.getSid() %></td>
                        <td><%= student.getFname() %></td>
                        <td><%= student.getLname() %></td>
                        <td><%= student.getEmail() %></td>
                        <td><a href="${pageContext.request.contextPath}/home/StudentList/StudentDetails?sid=<%= student.getSid() %>" class="btn btn-info">View Details</a></td>
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
