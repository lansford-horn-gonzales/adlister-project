<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: anngonzales
  Date: 4/26/21
  Time: 1:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${ad.title}</title>
</head>
<body>

<div class="container">
    <h2>Here are all the ads!</h2>
    <p>Feel free to browse these great deals: </p>


    <div class="card col-md-6">
        <div class="card-body">
            <img src="${ad.image}" width="300">
            <h4 class="card-title">${ad.title}</h4>
            <p class="card-text">${ad.description}</p>


            <form action="/show-ad" method="get">
                <input type="hidden" name="show-ad" value="${ad.id}">

            </form>


            <%--            <form action="/ads/delete" method="post">--%>
            <%--                <input type="hidden" name="id" value="${ad.id}">--%>
            <%--                <button class="btn btn-danger">Delete</button>--%>
            <%--            </form>--%>

        </div>

    </div>
</div>

</body>
</html>
