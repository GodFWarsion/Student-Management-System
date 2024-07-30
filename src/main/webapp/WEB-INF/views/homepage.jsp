<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Information System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/homestyles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
        function validateForm() {
            var name = document.forms["studentForm"]["name"].value;
            if (name == "") {
                alert("Name must be filled out");
                return false;
            }
        }
    </script>
</head>
<body>
    <div class="container-fluid">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home/CourseList">Course List</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home/StudentList">Student List</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home/AddStudent?sid=${sid}">Add Student</a></li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/register"><i class="fas fa-user-plus"></i> Register</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home/AboutUs">About</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logmeout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </nav>
        <header class="jumbotron text-center mt-3">
            <h1>Welcome ${uname} to the Student Information System</h1>
        </header>
		<!--<p>Logged in as: ${uname}</p>-->
        <main class="mt-4">
            <p>This is the home page of the Student Information System. Use the navigation pane to access different sections.</p>
        </main>
        <footer>
            <p>© 2024 Student Information System</p>
        </footer>
    </div>
</body>
</html>
