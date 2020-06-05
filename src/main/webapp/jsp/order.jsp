<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
    <link rel="stylesheet" href="/css/cart.css"/>
    <link rel="stylesheet" href="/css/form.css"/>
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">

    <title>sellup 관리자 - 주문확인</title>
</head>

<body>
<%@include file="/jsp/commons/header.jsp"%>

<main class="main-container">
    <h2 class="login-tit">주문확인</h2>
    <h2 class="login-sub">결제완료된 상품 리스트 입니다.</h2>
    <div class="container-box" style="width: 1000px;">
        <div class="cart-list">
            <table>
                <div class="cart-top">
                    <div>상품</div>
                    <div>수량</div>
                    <div>가격</div>
                    <div>배송비</div>
                    <div>총 가격</div>
                    <div>배송상태</div>
                    <div>-</div>
                </div>

            <c:choose>
                <c:when test="${not empty order}">
                    <c:forEach var="item" items="${order}" varStatus="status">
                        <div class="cart-item">
                            <div>
                                <img width="100" height="100" src="/upload/${item.img1}">
                                <p>${item.name}</p>
                            </div>
                            <div>${item.count}</div>
                            <div>
                                <fmt:formatNumber value="${item.discounted}" pattern="#,###" /> 원
                            </div>
                            <div>
                                <fmt:formatNumber value="${item.delivery_fee}" pattern="#,###" />
                            </div>
                            <div>
                                <fmt:formatNumber value="${item.total}" pattern="#,###" /> 원
                            </div>
                            <div>${item.is_delivery}</div>
                            <div>
                                <button type="button" onclick="isDelivery()">배송처리</button>
                                <button type="button" onclick="isCancel()">배송취소</button>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="cart-item">
                        <strong class="none-message">결제된 상품이 없습니다.</strong>
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
    function isDelivery() {
        if(confirm("배송 처리 할까요?")) {
            location.href="#";
        } else {
            return;
        }
    }

    function isCancel() {
        if(confirm("배송 취소 할까요?")) {
            location.href="#";
        } else {
            return;
        }
    }
</script>
