<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <title>sellup - 장바구니</title>
    <link rel="stylesheet" href="/css/cart.css"/>
    <link rel="stylesheet" href="/css/form.css"/>
    <script type="text/javascript" charset="euc-kr" src="/js/cart.js"></script>
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">
</head>
<body>
<%@include file="/jsp/commons/header.jsp"%>

<main class="main-container">
    <!-- 위에는 jstl 확인 (한 주문의 총 가격 합산 못함) / 밑에는 테이블헤더만 작성       + form을 어디에 ..  -->
    <!--로그인한 회원의 장바구니 상품 리스트(cart)-->
    <!-- [체크박스] - 상품<이미지,이름> - 가격 - 담은수량 - 배송비 - 총 가격(배송비포함) -->
    <h2 class="login-tit">장바구니</h2>
    <h2 class="login-sub">담은 상품을 확인해보세요!</h2>
    <div class="container-box" style="width: 1000px;">
        <div class="cart-list">
            <table>
                <div class="cart-top">
                    <div>-</div>
                    <div>상품</div>
                    <div>수량</div>
                    <div>가격</div>
                    <div>배송비</div>
                    <div>총가격</div>
                </div>

            <c:if test="${not empty cart}">
                <c:forEach var="order" items="${cart}" varStatus="status">
                <div class="cart-item">
                    <div>체크박스</div>
                    <div>
                        <img width="100" height="100" src="/upload/${order.img1}">
                        <p>${order.name}</p>
                    </div>
                    <div>${order.count}</div>
                    <div>
                        <fmt:formatNumber value="${order.discounted}" pattern="#,###" /> 원
                    </div>
                    <div>
                        <fmt:formatNumber value="${order.delivery_fee}" pattern="#,###" />
                    </div>
                    <div>
                        <fmt:formatNumber value="${order.total}" pattern="#,###" /> 원
                    </div>
                </div>
                </c:forEach>
            </c:if>
            </table>
        </div>
    </div>
</main>

<footer>

</footer>
</body>
</html>
