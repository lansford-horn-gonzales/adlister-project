<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div class="container">
    <h2>Welcome to ${ad.title}'s profile!</h2>
    <p>Read all about her:</p>


    <div class="card col-md-6">
        <div class="card-body">
            <img src="${ad.image}" width="300">
            <h4 class="card-title">${ad.title}</h4>
            <p class="card-text">${ad.description}</p>


<%--            <form action="/show-ad" method="get">--%>
<%--                <input type="hidden" name="show-ad" value="${ad.id}">--%>

<%--            </form>--%>
            <%--            <form action="/ads/delete" method="post">--%>
            <%--                <input type="hidden" name="id" value="${ad.id}">--%>
            <%--                <button class="btn btn-danger">Delete</button>--%>
            <%--            </form>--%>

        </div>

    </div>
</div>

</body>
</html>
