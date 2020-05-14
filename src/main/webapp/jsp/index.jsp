<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
﻿
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>sellup</title>
    <link rel="stylesheet" href="/css/all.css"/>
    <link rel="stylesheet" href="/css/index.css"/>
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

<main class="main" style="text-align: center"> <!--style 있음-->
    <img src="img/index_ad.jpg" width="970px" height="200px">

    <c:if test="${not empty list}">
        <c:forEach var="item" items="${list}" varStatus="status">
            <table>
                <tr>
                    <th rowspan="5">
                        <a href="ItemSelectOne?id=${item.id}">
                            <img width="25%" height="auto" src="upload/${item.img1}">
                        </a>
                    </th>
                    <td>
                        <a href="ItemSelectOne?id=${item.id}">
                            ${item.name}
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>가격&nbsp${item.price}</td>
                </tr>
                <tr>
                    <td>할인가&nbsp${item.discounted}</td>
                </tr>
                <tr>
                    <td>배송비&nbsp${item.delivery_fee}</td>
                </tr>
                <tr>
                    <td>${item.category}</td>
                </tr>
            </table>
            <br><br>
        </c:forEach>
    </c:if>

    <a href="ItemSelectOne?id=${item.id}"></a>
    <!--  여기는 실제로 사용할 데이터만 간단하게 뽑아놓음
    <img width="25%" height="auto" src="upload/${item.img1}">
    <a >${item.name}
    가격&nbsp${item.price}
    할인가&nbsp${item.discounted}
    배송비&nbsp${item.delivery_fee}
    ${item.category}
    -->

    <footer></footer>
</main>
</body>
</html>
