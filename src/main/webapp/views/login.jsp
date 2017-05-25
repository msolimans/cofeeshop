<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login Page</title>
		<jsp:include page="layout.jsp"></jsp:include>
	</head>
	<body>
		<div id="login">
				<div class="container">
					<form action="/login" method="post">
						<div class="form-group">
							<label for="username">Username:</label> <input type="text"
								class="form-control" id="username" placeholder="Enter email" name="username" value="${cookie.username.value}"  required>
						</div>
						<div class="form-group">
							<label for="password">Password:</label> <input type="password"
								class="form-control" id="password" placeholder="Enter password" name="password" required>
						</div>
						
						<input name="submit" type="submit" value="Sign In" class="btn btn-success"/>

						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
					<c:if test="${not empty error}">
						<p class="error message">${error}</p>
					</c:if>
				</div>
			</div>
	</body>
</html>