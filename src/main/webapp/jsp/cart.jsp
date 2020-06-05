<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
    <link rel="stylesheet" href="/css/cart.css"/>
    <link rel="stylesheet" href="/css/form.css"/>
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">

    <title>sellup - 장바구니</title>
</head>

<body>
<%@include file="/jsp/commons/header.jsp"%>

<main class="main-container">
    <!--로그인한 회원의 장바구니 상품 리스트(cart)-->
    <!-- [체크박스] - 상품<이미지,이름> - 가격 - 담은수량 - 배송비 - 총 가격(배송비포함) -->
    <h2 class="login-tit">장바구니</h2>
    <h2 class="login-sub">담은 상품을 확인해보세요!</h2>
    <div class="container-box" style="width: 1000px;">
        <div class="cart-list">
            <table>
                <div class="cart-top">
                    <div>선택</div>
                    <div>상품</div>
                    <div>수량</div>
                    <div>가격</div>
                    <div>배송비</div>
                    <div>총 가격</div>
                </div>

            <c:choose>
                <c:when test="${not empty cart}">
                    <c:forEach var="item" items="${cart}" varStatus="status">
                        <div class="cart-item">
                            <div>
                                <input type="checkbox" id="ck + '${status.index}'">
                                <label for="ck + '${status.index}'"></label>
                            </div>
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
                        </div>
                    </c:forEach>
                    <div class="btn-area">
                        <div class="total-price">
                            <div class="price-detail">
                                <dl>
                                    <dt>총 상품금액</dt>
                                    <dd>5,000원</dd>
                                </dl>
                                <strong class="plus">+</strong>
                                <dl>
                                    <dt>배송비</dt>
                                    <dd>5,000원</dd>
                                </dl>
                                <strong class="minus">-</strong>
                                <dl>
                                    <dt>할인금액</dt>
                                    <dd>1,000원</dd>
                                </dl>
                            </div>
                            <strong class="price-total">
                                총 주문금액
                                <span>120,000원</span>
                            </strong>
                        </div>
                        <button>삭제</button>
                        <button onclick="isPay()">결제</button>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="cart-item">
                        <strong class="none-message">장바구니가 비었어요!</strong>
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
    function isPay() {
        if(confirm("선택한 상품을 결제하시겠습니까?")) {
            location.href="#";
        } else {
            return;
        }
    }
</script>
