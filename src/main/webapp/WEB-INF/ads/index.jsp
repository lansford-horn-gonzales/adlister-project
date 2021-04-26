<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h2>Here are all the ads!</h2>
    <p>Feel free to browse these great deals: </p>

    <c:forEach var="ad" items="${ads}">
    <div class="card col-md-6">
        <div class="card-body">
            <div class="img">${ad.image}</div>
            <h4 class="card-title">${ad.title}</h4>
            <p class="card-text">${ad.description}</p>


<%--            <form action="/edit-ads" method="get">--%>
<%--                <input type="hidden" name="editAd" value="${ad.id}">--%>
<%--                <button class="btn btn-primary">Edit</button>--%>
<%--            </form>--%>


<%--            <form action="/ads/delete" method="post">--%>
<%--                <input type="hidden" name="id" value="${ad.id}">--%>
<%--                <button class="btn btn-danger">Delete</button>--%>
<%--            </form>--%>

        </div>
    </div>
    </c:forEach>
</div>

</body>
</html>
