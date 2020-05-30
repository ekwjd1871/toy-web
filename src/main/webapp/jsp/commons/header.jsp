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
            <c:if test="${not empty user}">
                <p>
                    ${user.userId}
                    <c:choose>
                        <c:when test="${user.role eq 'ADMIN'}">(관리자) 님</c:when>
                        <c:otherwise>(회원) 님</c:otherwise>
                    </c:choose>
                </p>
            </c:if>
        </div>
        <div class="header-logo">
            <a href="/">
                <img src="/img/SELLUP_logo.png">
            </a>
        </div>
        <div class="header-nav">
            <c:if test="${not empty user}">
                <c:choose>
                    <c:when test="${user.role eq 'ADMIN'}">
                        <a class="header_side" href="/jsp/register_item.jsp">상품등록</a>
                        <a class="" href="">배송관리</a>
                    </c:when>
                    <c:otherwise>
                        <a class="header_side" href="/jsp/register_item.jsp">장바구니</a>
                        <a class="" href="">주문확인</a>
                    </c:otherwise>
                </c:choose>
            </c:if>
            <c:choose>
                <c:when test="${not empty user}">
                    <a href="javascript:checkLogout()">로그아웃</a>
                </c:when>
                <c:otherwise>
                    <a href="/jsp/user/login.jsp">로그인</a>
                </c:otherwise>
            </c:choose>
        </div>
    </header>
</body>
</html>

<script>
    function checkLogout() {
        if (confirm("로그아웃 하시겠어요?")) {
            location.href ="/users/logout";
        } else {
            return;
        }
    }
</script>
