<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">
    <link rel="stylesheet" href="/css/detail_item.css"/>

    <script type="text/javascript" charset="euc-kr" src="/js/detail_item.js"></script><!--왜 이건 한글이 깨질까-->
</head>
<body>
<%@include file="/jsp/commons/header.jsp"%>

<main class="main-container">
    <div class="item-header">
        <div class="item-thumb">
            <img src="/upload/${item.img1}">
        </div>
        <ul class="desc" style="text-align: left; position: relative">
            <li class="desc name">${item.name}</li>
            <li class="desc category">${item.category}</li>
            <li class="desc price">가격 ${item.price}원</li>
            <li class="desc discount">할인가 ${item.discounted}원</li>
            <li class="desc fee">배송비 ${item.delivery_fee}</li>

            <div class="desc cart_area">
                <c:choose>
                    <c:when test="${not empty user}">
                        <form id="detail_form" action="/AddCartService" method="post" accept-charset="EUC-KR">
                            <input name="user_id" type="hidden" value="${user.userId}"> <!--user id 값 넣어야함-->
                            <input name="item_id" type="hidden" value="${item.item_id}"> <!--""안에 넣는게 맞는가-->

                            <!--숫자만 입력 가능 / 이 주석은 남기길 바람-->
                            <div class="buy_count_box">
                                <button type="button" src="/img/preview_grey.png" onclick="count_down()">-</button>
                                <input name="buy_count" id="buy_count" type="text" value=1
                                       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                >
                                <button type="button" src="/img/preview_grey.png" onclick="count_up()">+</button>
                            </div>

                            <div class="form-input" style="width: 50%; margin-top: 5%;">
                                <button type="button" class="form-control" onclick="count_check()" style="width: 100%; padding: 2%;">
                                    장바구니 담기
                                </button>
                            </div>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <div class="form-input">
                            <b style="color: darksalmon;" onclick="location.href='/jsp/user/login.jsp'">
                                로그인이 필요합니다
                            </b>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </ul>
    </div>
    <div class="item-detail">
        <img src="/upload/${item.img2}" width="60%" height="auto">
        <img src="/img/guid.jpg" width="60%" height="auto">
    </div>
</main>

<%@include file="/jsp/commons/footer.jsp"%>
</body>
</html>
