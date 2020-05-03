<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>sellup - 상품을 올리는 마켓</title>
    <link rel="stylesheet" href="/css/all.css"/>
    <link rel="stylesheet" href="/static/css/index.css"/>
</head>

<!--
-->

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

<br><br><br>

<main class="main"> <!--style 있음-->
    <div class="ad">

    </div>



    <div class="item_list">
        <c:forEach items="${requestScope.list}" var="i">
            <tr>
                <td>${i.num }</td>
                <td>${i.title }</td>
                <td>${i.author }</td>
                <td><a href="SelectOne?num=${i.num}">${i.file }</a></td>
                <td>${i.day }</td>
            </tr>
        </c:forEach>

    </div>



    <footer>
        <br><br>
        <br><br><br><br>
    </footer>
</main>
</body>
</html>