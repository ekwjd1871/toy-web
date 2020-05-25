<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>sellup</title>
    <link rel="stylesheet" href="/static/css/global.css"/>
    <link rel="stylesheet" href="/css/detail_item.css"/>
    <script type="text/javascript" src="/js/detail_item.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<header style="text-align: center">
    a(관리자) 님
    로그아웃
    <div>
        <a class="header_logo" href="/">
            <img src="/img/SELLUP_logo.png" width="290px" height="70px">
        </a>
    </div>
    <div>
        <a class="header_side" href="/jsp/register_item.jsp">상품 등록</a> <br>
        <a class="" href="">배송 관리</a>
    </div>
</header>
<br><br>
<hr>
<br>
<main>
    <div>
        <img class="img1" src="/upload/${item.img1}">
        <div class="item_info">
            ${item.name}<br>
            ${item.category}<br>
            가격&nbsp${item.price}원<br>
            할인가&nbsp${item.discounted}원<br>
            배송비&nbsp${item.delivery_fee}<br>
            <br>
            <input type="text" value="1"  style="width: 15px; height:15px; text-align: center">
                <img name="up_button" src="/img/preview_grey.png" style="width: 15px; height:15px;">&nbsp;
                <img name="up_button" src="/img/preview_grey.png" style="width: 15px; height:15px;">
            <!--위아래버튼--> <!--크기좀만키우고 숫자처리 제이에스 고고 근데 내일 풀 받아야해-->
        </div>
    </div>
    <br><br>
    <hr>
    <br><br>
    <img src="/upload/${item.img2}" width="60%" height="auto">
    <br>
    <img src="/img/guid.jpg" width="60%" height="auto">
</main>

<footer>

</footer>

</body>
</html>
