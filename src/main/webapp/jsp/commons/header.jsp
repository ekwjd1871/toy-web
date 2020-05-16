<%--
  Created by IntelliJ IDEA.
  User: Cher
  Date: 2020-05-16
  Time: 오후 3:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <%-- `css` resources --%>
    <link rel="stylesheet" href="/css/global.css"/>
    <link rel="stylesheet" href="/css/header.css"/>
    <%-- `font` resources --%>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
</head>
<body>
    <header class="main-header">
        <div class="header-user">
            <p>`관리자` 님</p>
        </div>
        <div class="header-logo">
            <a href="/">
                <img src="/img/SELLUP_logo.png">
            </a>
        </div>
        <div class="header-nav">
            <a class="header_side" href="/jsp/register_item.jsp">상품등록</a>
            <a class="" href="">배송관리</a>
            <a class="" href="">로그아웃</a>
        </div>
    </header>
</body>
</html>
