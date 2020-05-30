<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">
    <link rel="stylesheet" href="/css/form.css" />
</head>

<body>
<%@include file="/jsp/commons/header.jsp"%>

<main class="main-container">
    <h2 class="login-tit">SELLUP 회원가입</h2>

    <c:choose>
        <c:when test="${isSignUp}">
            <h2 class="login-sub">SELLUP 회원이 되셨습니다!</h2>
            <div class="nav">
                <b onclick="location.href='/'">HOME</b>
                <b onclick="location.href='/jsp/user/login.jsp'">로그인</b>
            </div>
        </c:when>
        <c:otherwise>
            <h2 class="login-sub">회원가입을 통해 SEELUP 회원이 되어보세요!</h2>
            <div class="container-box login-box">
                <p class="form-tit">
                    <span class="sellup">SELLUP</span>
                </p>
                <div class="login-form">
                    <form class="form-box" action="/users/create" method="post">
                        <div class="form-input">
                            <input id="name" type="text" name="name" value="" placeholder="이름" autofocus="autofocus" class="form-control">
                        </div>
                        <div class="form-input">
                            <input id="userId" type="text" name="userId" value="" placeholder="아이디" autofocus="autofocus" class="form-control">
                        </div>
                        <div class="form-input">
                            <input id="password" type="password" name="password" value="" autocomplete="false" placeholder="비밀번호" autofocus="autofocus" class="form-control password">
                        </div>
                        <div class="form-input">
                            <input id="password-check" type="password" value="" autocomplete="false" placeholder="비밀번호 확인" autofocus="autofocus" class="form-control password">
                        </div>
                        <div class="form-input msg" style="text-align: left; display: none;">
                            <label id="system-msg" class="form-control"></label>
                        </div>
                        <div class="form-input">
                            <button type="submit" id="form-submit" disabled="" class="form-control">
                                가입하기
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</main>
</body>

<script>
    $('.password').focusout(function () {
        var actual = $('#password').val()
        var matcher = $('#password-check').val()
        var systemMessage = ""

        if(actual !== "" && matcher !== "") {
            $('.msg').css("display", "inline-block")

            if(actual === matcher) {
                systemMessage = "비밀번호가 일치합니다";
                $('#form-submit').attr("disabled", false);
                $('#form-submit').css("cursor", "pointer");
                $('#system-msg').css("color", "darksalmon");
            } else {
                systemMessage = "비밀번호가 일치하지 않습니다";
                $('#form-submit').attr("disabled", true);
                $('#form-submit').css("cursor", "not-allowed");
                $('#system-msg').css("color", "red");
            }
        }

        $('#system-msg').text(systemMessage);
    })
</script>
