<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/login-navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>

    <div class="card">
        <div class="card-header">
            <h2>Profile</h2>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">Username: ${sessionScope.user.username}</li>
            <li class="list-group-item">Email: ${sessionScope.user.email}</li>
        </ul>
    </div>

    <div align="center">

<%--        //form--%>
        <button><a href="/edit-profile">Edit Profile</a></button>

        <form method="post" action="/delete-profile">
            <input type="hidden" name="userId" value="${user.id}">
            <button class="btn btn-danger">Delete Profile</button>
        </form>
    </div>

</body>
</html>
