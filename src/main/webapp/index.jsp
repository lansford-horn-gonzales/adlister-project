<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="css/main.css">

    <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
</head>


<section class="showcase">
    <header>
        <h2>Welcome to CryptoHorns!</h2>
        <div class="toggle"></div>
    </header>
    <video src="mp4/pexels-rostislav-uzunov-5453622.mp4" muted loop autoplay></video>
    <div class="overlay"></div>
    <div class="text">

        <p>Welcome to the lands of Ether where wild creatures roam in a land of uncharted territory. Amongst the magical
            beasts of Ether, one will encounter the collection of CryptoHorns designed and curated by artist Emily Horn.
            Each CryptoHorn is specifically mined just for you, and can be verified by EtherScan, making these
            Non-Fungible Tokens unique and destined to increase in value as the price of Etherium rises during these
            exciting times of adventurous pursuits in decentralized finance.
            Let’s face it, the journey into cryptocurrency can be a little scary. Why face it alone, if you can have
            your very own CryptoHorn friend with you on your journey. Make CryptoHorns by Emily Horn a part of your
            wallet today!</p>
        </p>

    </div>
    <ul class="social">
        <li><a href="#"><img src="https://i.ibb.co/x7P24fL/facebook.png"></a></li>
        <li><a href="#"><img src="https://i.ibb.co/Wnxq2Nq/twitter.png"></a></li>
        <li><a href="#"><img src="https://i.ibb.co/ySwtH4B/instagram.png"></a></li>
    </ul>
</section>

</html>
