<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detail Order</title>
    <jsp:include page="layout.jsp"></jsp:include>
</head>
<body>
<div class="container">

    <h1 class="text text-center">All Order Items</h1>
    <div>
        <a href="/order/list" id="backBtn">Back</a>
    </div>

    <table class="table">
        <thead>
        <tr>

            <th>Product</th>
            <th>ProductName</th>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderLines}" var="orderLine">
            <tr>
                <td><a><img alt="productImage"
                            src="<c:url value="../resources/image/product1.png"/>"></a></td>
                <td>${orderLine.product.productName}</td>
                <td>${orderLine.product.description}</td>
                <td>$${orderLine.product.price}</td>
                <td>${orderLine.quantity}</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>


    <div>
        <a href="/order/list" id="backBtn">Back</a>
    </div>
</div>
</body>
</html>