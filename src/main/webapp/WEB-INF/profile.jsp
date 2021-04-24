<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/login-navbar.jsp"/>
<div class="container">
    <h1>Welcome, ${sessionScope.user.username}!</h1>
</div>
<div class="card">
    <div class="card-header">
        <h2>Profile</h2>
    </div>
    <ul class="list-group list-group-flush">
        <li class="list-group-item">Username: ${sessionScope.user.username}</li>
        <br>
        <br>
        <li class="list-group-item">Email: ${sessionScope.user.email}</li>
        <br>
        <br>
        Password:
        <li class="list-group-item">*************</li>
    </ul>
</div>

<div align="center">
    <form method="post" action="/delete-profile">
        <input type="hidden" name="userId" value="${user.id}">
        <button class="btn btn-danger">Delete Profile</button>
    </form>
    <form action="/edit-profile">
        <button type="submit" name="editUser" id="editUser" class="btn btn-primary m-2" value="${user.id}">Edit Info
        </button>
    </form>
</div>


    <div class="card">
        <div class="card-header">
            <h2>Profile</h2>
        </div>
        <ul class="list-group list-group-flush">
            Username:<li class="list-group-item">${sessionScope.user.username}</li>
            <br>
            <br>
            Email:<li class="list-group-item">${sessionScope.user.email}</li>
            <br>
            <br>
            Password:<li class="list-group-item">*************</li>
        </ul>
    </div>

    <div align="center">
        <button><a href="/edit-profile">Edit Profile</a></button>
    </div>

</body>
</html>
