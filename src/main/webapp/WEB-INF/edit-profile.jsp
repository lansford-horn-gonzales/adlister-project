<%--
  Created by IntelliJ IDEA.
  User: samlansford
  Date: 4/22/21
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Profile" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/login-navbar.jsp"/>
<div class="container">
    <h1>Edit Profile</h1>
    <form action="/edit-profile" method="post">
        <div class="form-group">
            <label for="username">New Username</label>
            <input id="username" name="username" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="email">New Email</label>
            <input id="email" name="email" class="form-control" type="text">
        </div>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
</body>
</html>
