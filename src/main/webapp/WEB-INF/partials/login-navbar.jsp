<%--
  Created by IntelliJ IDEA.
  User: samlansford
  Date: 4/20/21
  Time: 4:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
        <div class="search-container">
            <form class="form-inline" action="/ads/search" method="post">
                <input id="search" name="search" type="text">
                <button type="submit">Submit</button>
            </form>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/index.jsp">Home</a></li>
            <li><a href="/profile">Profile</a></li>
            <li><a href="/ads/create">Create Ad</a></li>
            <li><a href="/logout">Logout</a></li>
        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
