<%--
  Created by IntelliJ IDEA.
  User: samlansford
  Date: 4/24/21
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ads" />
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/login-navbar.jsp"/>
<%--this page displays editing form page--%>
<div class="container">
    <h1>Create a new Ad</h1>
    <form action="/edit-ads" method="post">
        <div class="form-group">
            <label for="image">Image</label>
            <textarea id="image" name="image" class="form-control" type="text"></textarea>
        </div>
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>
        <input type="submit" class="btn btn-block btn-primary">
        <input type="hidden" name="id" value="${ad.id}">
<%--        line 36 using the value to get the ad--%>
    </form>
</div>
</body>
</html>
