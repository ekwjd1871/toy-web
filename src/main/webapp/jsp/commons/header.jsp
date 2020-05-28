<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <%-- `css` resources --%>
    <link rel="stylesheet" href="/css/global.css"/>
    <link rel="stylesheet" href="/css/header.css"/>
    <link rel="stylesheet" href="/css/index.css"/>

    <%-- `font` resources --%>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <%--`jquery` resrouce --%>
    <script src="//code.jquery.com/jquery-latest.min.js"></script>

    <title>sellup</title>
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
<%--            <a class="" href="">로그아웃</a>--%>
            <a class="" href="/jsp/user/login_form.jsp">로그인</a>
        </div>
    </header>
</body>
</html>
