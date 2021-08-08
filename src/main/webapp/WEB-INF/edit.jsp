<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
		<div>
			<form action="/languages/${language.id}" method="post">
    			<input type="hidden" name="_method" value="delete">
    			<input type="submit" value="Delete">
			</form>
			<p><a href="/languages">Dashboard</a></p>
		</div>
		<div>
			<form:form action="/languages/${language.id}" method="post" modelAttribute="language">
				<input type="hidden" name="_method" value="put">
				<div>
					<form:label path="name">Name</form:label>
					<form:errors path="name"/>
					<form:input path="name"/>
				</div>
				<div>
					<form:label path="creator">Creator</form:label>
					<form:errors path="creator"/>
					<form:input path="creator"/>
				</div>
				<div>
					<form:label path="currentVersion">Version</form:label>
					<form:errors path="currentVersion"/>
					<form:input path="currentVersion"/>
				</div>
				<input type="submit" value="Submit">
			</form:form>
		</div>
		<script type="text/javascript" src="js/app.js"></script>
	</body>
</html>