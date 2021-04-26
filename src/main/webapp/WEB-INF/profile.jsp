<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/login-navbar.jsp"/>

<div class="container">
    <h1>Welcome, ${sessionScope.user.username}!</h1>
</div>

<h2>Your active ads:</h2>

<div class="container">
    <c:forEach var="ad" items="${ads}">
        <div class="card col-md-6">
            <div class="card-body">
                <div class="image">${ad.image}</div>
                <h4 class="card-title">${ad.title}</h4>
                <p class="card-text">${ad.description}</p>
<%--                <a href="#" class="card-link">Edit</a>--%>
                <form action="/ads/delete" method="post">
                    <input type="hidden" name="id" value="${ad.id}">
                    <button class="btn btn-danger">Delete</button>
                </form>

                <form action="/edit-ads" method="get">
                    <input type="hidden" name="editAd" value="${ad.id}">
                    <button class="btn btn-primary">Edit</button>
                </form>

            </div>
        </div>
    </c:forEach>
</div>

<div class="card">
    <div class="card-header">
        <h2>Your profile info: </h2>
    </div>
    <ul class="list-group list-group-flush">
        <li class="list-group-item">Username: ${sessionScope.user.username}</li>
        <li class="list-group-item">Email: ${sessionScope.user.email}</li>
    </ul>
</div>

<div align="center">

    <form action="/edit-profile">
        <button type="submit" name="editUser" id="editUser" class="btn btn-primary m-2" value="${user.id}">Edit Info
        </button>
    </form>

    <form method="post" action="/delete-profile">
        <input type="hidden" name="userId" value="${user.id}">
        <button class="btn btn-danger">Delete Profile</button>
    </form>

</div>

</body>
</html>
