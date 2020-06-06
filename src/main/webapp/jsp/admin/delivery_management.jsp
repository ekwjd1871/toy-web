<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
    <link rel="stylesheet" href="/css/cart.css"/>
    <link rel="stylesheet" href="/css/form.css"/>
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">

    <title>sellup 관리자 - 배송관리</title>
</head>

<body>
<%@include file="/jsp/commons/header.jsp"%>

<main class="main-container">
    <h2 class="login-tit">배송관리</h2>
    <h2 class="login-sub">주문 상품 리스트입니다!</h2>
    <div class="container-box" style="width: 1000px;">
        <div class="cart-list">
            <table>
                <div class="cart-top">
                    <div>회원</div>
                    <div>상품</div>
                    <div>수량</div>
                    <div>총 가격</div>
                    <div>상태</div>
                </div>

            <c:choose>
                <c:when test="${not empty payList}">
                    <c:forEach var="order" items="${payList}" varStatus="status">
                        <div class="cart-item">
                            <div>${order.user_id}</div>
                            <div>
                                <img width="100" height="100" src="/upload/${order.img1}">
                                <p>${order.name}</p>
                            </div>
                            <div>${order.count}</div>
                            <div>
                                <fmt:formatNumber value="${order.total}" pattern="#,###" /> 원
                            </div>
                            <div>
                                <c:if test="${order.is_delivery}">
                                    <strong><h4>배송처리 완료</h4></strong>
                                </c:if>
                                <c:if test="${!order.is_delivery}">
                                    <button type="button" onclick="isDelivery(${order.order_id})">배송시작</button>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="cart-item">
                        <strong class="none-message">결제된 상품이 없어요</strong>
                    </div>
                </c:otherwise>
            </c:choose>
            </table>
        </div>
    </div>
</main>

<%@include file="/jsp/commons/footer.jsp"%>
</body>
</html>

<script>
    function isDelivery(orderId) {
        if(confirm("배송 처리 할까요?")) {
            location.href="/deliveryService?orderId=" + orderId;
        } else {
            return;
        }
    }
</script>
