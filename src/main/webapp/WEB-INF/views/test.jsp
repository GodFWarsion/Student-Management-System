<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test JSP Page</title>
</head>
<body>
    <h1>Test JSP Page</h1>
    <p>This is a simple test page to verify JSP functionality.</p>
    <p>Current Date and Time: <%= new java.util.Date() %></p>
    <p>Server Info: <%= application.getServerInfo() %></p>
</body>
</html>
