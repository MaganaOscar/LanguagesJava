<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
		<h1>All Languages</h1>
		<table>
    		<thead>
        		<tr>
            		<th>Name</th>
            		<th>Creator</th>
            		<th>Version</th>
            		<th>Actions</th>
        		</tr>
    		</thead>
    		<tbody>
        		<c:forEach items="${languages}" var="lang">
	        		<tr>
    	        		<td><a href="/languages/${lang.id}"><c:out value="${lang.name}"/></a></td>
        	    		<td><c:out value="${lang.creator}"/></td>
  	          			<td><c:out value="${lang.currentVersion}"/></td>
 	           			<td>
 	           				<form action="/languages/${lang.id}" method="post">
 	           					<input type="hidden" name="_method" value="delete">
 	           					<input type="submit" value="Delete">
 	           				</form>
 	           				<a href="/languages/${lang.id}/edit">Edit</a>
 	           			</td>
  	      			</tr>
        		</c:forEach>
    		</tbody>
		</table>
		
		<div>
			<form:form action="/languages" method="post" modelAttribute="language">
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