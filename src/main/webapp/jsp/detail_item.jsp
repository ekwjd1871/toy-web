<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <title>sellup</title>
    <link rel="stylesheet" href="/css/global.css"/>
    <link rel="stylesheet" href="/css/detail_item.css"/>
    <script type="text/javascript" charset="euc-kr" src="/js/detail_item.js"></script><!--왜 이건 한글이 깨질까-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">
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
            <form id="detail_form" action="/" method="post" accept-charset="EUC-KR">
                <input name="user_id" type="hidden" value="user ID 123"> <!--user id 값 넣어야함-->
                <input name="item_id" type="hidden" value="${item.id}"> <!--""안에 넣는게 맞는가-->

                <input name="buy_count" id="buy_count" type="text" value=1 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"              style="width: 40px; height: 40px; text-align: center"> &nbsp;  <!--숫자만 입력 가능 / 이 주석은 남기길 바람-->
                <button class="up_button" onclick="count_up()"> <img  src="/img/preview_grey.png" style="width: 30px; height:30px;"> </button>&nbsp;
                <button class="down_button" onclick="count_down()"> <img  src="/img/preview_grey.png" style="width: 30px; height:30px;"> </button>
                <!-- 위아래버튼 아니면 +,- 버튼 -->
                <br>
                <input class="submit_button" type="button" value="장바구니 담기" onclick="count_check()">
                <!--다 OK form action땜에 에러가 나는거임-->
            </form>

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
