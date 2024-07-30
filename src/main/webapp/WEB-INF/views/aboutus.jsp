<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>About Us - Student Information System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/homestyles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
    <div class="container-fluid">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/register"><i class="fas fa-user-plus"></i> Register</a></li>
            </ul>
        </nav>
        <header class="jumbotron text-center mt-3">
            <h1>About Us</h1>
        </header>
        <main class="mt-4">
            <h2>Student Information System</h2>
            <p>The Student Information System (SIS) project is designed to manage and streamline student data efficiently. This system allows administrators to manage student records, course information, and other academic details seamlessly.</p>
            <h3>Technologies Used</h3>
            <ul>
                <li><strong>Spring Boot:</strong> The backbone of the application, providing a robust and scalable framework for building Java-based web applications.</li>
                <li><strong>JSP:</strong> JavaServer Pages are used for creating dynamic web content and rendering the user interface.</li>
                <li><strong>MySQL:</strong> The database management system used to store and manage student and course data.</li>
                <li><strong>Bootstrap:</strong> A front-end framework used to create responsive and visually appealing web pages.</li>
                <li><strong>Spring Security:</strong> Ensures the application is secure by managing authentication and authorization.</li>
                <li><strong>Maven:</strong> A build automation tool used for managing project dependencies and building the application.</li>
            </ul>
            <h3>Project Features</h3>
            <ul>
                <li>Manage student records and course information.</li>
                <li>User authentication and authorization.</li>
                <li>Responsive design for better user experience.</li>
                <li>Easy navigation and user-friendly interface.</li>
            </ul>
            <p>We hope this system helps in managing student information efficiently and effectively. For any queries or support, feel free to contact us.</p>
        </main>
        <footer>
            <p>© 2024 Student Information System</p>
        </footer>
    </div>
</body>
</html>
