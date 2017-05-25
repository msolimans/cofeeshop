<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>


<nav class="navbar navbar-default">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Coffeeshop</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


            <ul class="nav navbar-nav navbar-right">

                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name == null}">

                        <li>
                            <form class="navbar-form navbar-left" action="/login"  method="post">
                                <div class="form-group">
                                    <input type="text"   class="form-control" id="username" placeholder="Enter email" name="username" value="${cookie.username.value}"  required>

                                    <input type="password"  class="form-control" id="password" placeholder="Enter password" name="password" required>
                                </div>

                                <input name="submit" type="submit" value="Sign In" class="btn btn-success"/>
                                <a href="/signup" class="btn btn-info">Signup</a>

                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </form>
                            <c:if test="${not empty error}">
                                <p class="error message">${error}</p>
                            </c:if>

                        </li>

                    </c:when>
                    <c:otherwise>
                        <li class="header"><a href="/logout">Logout</a></li>
                        <sec:authorize access="hasRole('USER')">
                            <li class="header user-icon"><a
                                    href="person/changeInformation?username=${pageContext.request.userPrincipal.name}"><img
                                    src="../resources/image/user.png"/>Admin</li>
                            <li class="header count">
                                <span class="badge badge-danger">${sessionScope['cart'].size == null ? 0 : sessionScope['cart'].size}</span></li>
                            <li class="header user-icon"><a href="/order"><img src="../resources/image/cart.png"/></a></li>
                        </sec:authorize>
                    </c:otherwise>
                </c:choose>



                <sec:authorize access="hasRole('ADMIN')">
                    <li class="dropdown" style="margin-top: 5px">
                        <button class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                                ${pageContext.request.userPrincipal.name} <span class="caret"></span>
                        </button>

                        <ul class="dropdown-menu">

                            <li><a href="/product/list">Product</a></li>
                            <li><a href="/person/list">Person</a></li>
                            <li><a href="/order/list">Order</a></li>

                        </ul>

                    </li>

                </sec:authorize>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


</body>
</html>
