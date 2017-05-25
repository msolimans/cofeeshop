<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Order Management</title>
		<jsp:include page="layout.jsp"></jsp:include>
	</head>
	<body>

			<div class="container">
					<h3 class="text text-center">Order Management</h3>
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>Customer Name</th>
								<th>Customer Email</th>
								<th>Date Order</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="order" items="${orders}">
								<tr>
									<td>${order.id}</td>
									<td>${order.person.firstName}</td>
									<td>${order.person.lastName}</td>
									<td>${order.orderDate}</td>
									<td><a href="detail?orderId=${order.id}">Detail</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</div>



	</body>
</html>