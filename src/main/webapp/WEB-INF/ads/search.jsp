<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: anngonzales
  Date: 4/21/21
  Time: 5:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
    <title>Found Ads</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h2>Ads matching your search...</h2>


    <c:forEach var="ad" items="${ads}">
        <div class="card col-md-6">
            <div class="card-body">
                <h4 class="card-title">${ad.title}</h4>
                <p class="card-text">${ad.description}</p>
                <!-- ryan added -->
                <form action="/show-ad" method="get">
                    <input type="hidden" name="showAd" value="${ad.id}">
                    <button class="btn btn-primary">View Ad</button>
                </form>
                <!-- ryan added -->
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
