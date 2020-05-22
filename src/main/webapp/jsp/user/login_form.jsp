<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

<head>
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">
    <link rel="stylesheet" href="/css/login_form.css"/>
</head>

<body>
<%@include file="/jsp/commons/header.jsp"%>

<main class="main-container">
    <h2 class="login-tit">SELLUP 로그인</h2>
    <h2 class="login-sub">SELLUP 에 오신것을 환영합니다</h2>
    <div class="container-box login-box">
        <p class="form-tit">
            <span class="sellup">SELLUP</span>
            아이디로 로그인
        </p>
        <div class="login-form">
            <form class="form-box">
                <div class="form-input">
                    <input id="userId" type="text" name="userId" value="" autocomplete="username" placeholder="SELLUP 아이디" autofocus="autofocus" class="form-control">
                </div>
                <div class="form-input">
                    <input id="password" type="text" name="password" value="" autocomplete="password" placeholder="SELLUP 비밀번호" autofocus="autofocus" class="form-control">
                </div>
                <div class="form-input">
                    <button type="button" class="form-control">
                        로그인
                    </button>
                </div>
            </form>
        </div>
        <p class="form-sign-up">
            <span class="sellup">SELLUP</span>
            회원이 아니신가요?
            <b class="sign-up">회원가입</b>
        </p>
    </div>
</main>
</body>
</html>
