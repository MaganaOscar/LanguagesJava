<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Language</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
		<p><a href="/languages">Dashboard</a></p>
		<h1><c:out value="${language.name}"/></h1>
		<p>Creator: <c:out value="${language.creator}"/></p>
		<p>Version: <c:out value="${language.currentVersion}"/></p>
		<a href="/languages/${language.id}/edit">Edit</a>
		<form action="/languages/${language.id}" method="post">
    		<input type="hidden" name="_method" value="delete">
    		<input type="submit" value="Delete">
		</form>
		<script type="text/javascript" src="js/app.js"></script>
	</body>
</html>