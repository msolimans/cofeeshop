<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <jsp:include page="layout.jsp"></jsp:include>

</head>
<body>

<div id="home" class="container">

    <%--<jsp:include page="carousel.jsp"></jsp:include>--%>

        <h2 class="text-center">Products</h2>
        <hr/>
        <div class="row">

            <c:forEach items="${products}" var="product" varStatus="loop">
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="thumbnail">
                        <c:choose>
                            <c:when test="${loop.count == 1}">
                                <img class="img   img-responsive" src="../resources/image/ads/product1.png"/>
                            </c:when>
                            <c:when test="${loop.count == 2}">
                                <img class="img img-responsive" src="../resources/image/product2.png"/>
                            </c:when>
                            <c:when test="${loop.count == 3}">
                                <img class="img   img-responsive" src="../resources/image/product3.png"/>
                            </c:when>
                            <c:when test="${loop.count == 4}">
                                <img class="img  img-responsive" src="../resources/image/product4.png"/>
                            </c:when>
                            <c:otherwise>
                                <img class="img   img-responsive" src="../resources/image/product1.png"/>
                            </c:otherwise>
                        </c:choose>

                        <div class="caption">
                            <h4 class="text text-center"> ${product.productName}</h4>
                            <p class="text text-center"><small>${product.price}</small></p>

                            <sec:authorize access="hasRole('USER')">
                                <p class="text-center"><a class="btn btn-info" href="product/addToCart?productId=${product.id}">Add To Cart</a></p>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ADMIN')">
                                <p class="text-center"><a href="/product?action=update&productId=${product.id}" id="updateLnk" class="btn btn-info">Update</a>
                                <a href="/product?action=delete&productId=${product.id}" id="deleteLnk" class="btn btn-danger">Delete</a></p>
                            </sec:authorize>

                        </div>

                    </div>
                </div>

            </c:forEach>

        </div>




</div>
</body>
</html>