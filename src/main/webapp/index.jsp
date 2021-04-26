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
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome to the Adlister!</h1>
        <p>Welcome to the lands of Ether where wild creatures roam in a land of uncharted territory. Amongst the magical beasts of Ether, one will encounter the collection of CryptoHorns designed and curated by artist Emily Horn. Each CryptoHorn is specifically mined just for you, and can be verified by EtherScan, making these Non-Fungible Tokens unique  and destined to increase in value as the price of Etherium rises during these exciting times of adventurous pursuits in decentralized finance.
            Let’s face it, the journey into cryptocurrency can be a little scary. Why face it alone, if you can have your very own CryptoHorn friend with you on your journey. Make CryptoHorns by Emily Horn a part of your wallet today!</p>
    </div>
</body>
</html>
