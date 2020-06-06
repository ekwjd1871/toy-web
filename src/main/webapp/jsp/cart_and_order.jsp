<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
    <link rel="stylesheet" href="/css/cart.css"/>
    <link rel="stylesheet" href="/css/form.css"/>
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">

    <c:choose>
        <c:when test="${isOrderList}">
            <title>sellup - 주문확인</title>
        </c:when>
        <c:otherwise>
            <title>sellup - 장바구니</title>
        </c:otherwise>
    </c:choose>
</head>

<body>
<%@include file="/jsp/commons/header.jsp"%>

<main class="main-container">
    <!--로그인한 회원의 장바구니 상품 리스트(cart)-->
    <!-- [체크박스] - 상품<이미지,이름> - 가격 - 담은수량 - 배송비 - 총 가격(배송비포함) -->

    <c:choose>
        <c:when test="${isPayList}">
            <h2 class="login-tit">주문확인</h2>
            <h2 class="login-sub">주문한 상품 목록입니다!</h2>

            <div class="container-box" style="width: 1000px;">
                <div class="cart-list">
                    <table>
                        <div class="cart-top">
                            <div style="width: 1800px;">상품</div>
                            <div style="width: 50%">수량</div>
                            <div>가격</div>
                            <div>배송비</div>
                            <div>총 가격</div>
                            <div>배송상태</div>
                        </div>

                        <c:choose>
                            <c:when test="${not empty payList}">
                                <c:forEach var="order" items="${payList}" varStatus="status">
                                    <div class="cart-item">
                                        <div style="width: 1800px;">
                                            <p><img width="100" height="100" src="/upload/${order.img1}"></p>
                                            <p>${order.name}</p>
                                        </div>
                                        <div style="width: 50%">${order.count}</div>
                                        <div>
                                            <fmt:formatNumber value="${order.discounted}" pattern="#,###" /> 원
                                        </div>
                                        <div>
                                            <c:if test="${order.delivery_fee eq '0'}">무료</c:if>
                                            <c:if test="${order.delivery_fee ne '0'}">
                                                <fmt:formatNumber value="${order.delivery_fee}" pattern="#,###" /> 원
                                            </c:if>
                                        </div>
                                        <div>
                                            <fmt:formatNumber value="${order.total}" pattern="#,###" /> 원
                                        </div>
                                        <div>
                                            <c:if test="${order.is_delivery}">배송중</c:if>
                                            <c:if test="${!order.is_delivery}">배송준비중</c:if>
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
        </c:when>

        <c:otherwise>
            <h2 class="login-tit">장바구니</h2>
            <h2 class="login-sub">담은 상품을 확인해보세요!</h2>

            <div class="container-box" style="width: 1000px;">
                <div class="cart-list">
                    <table>
                        <div class="cart-top">
                            <div style="width: 50%;">선택</div>
                            <div style="width: 1500px;">상품</div>
                            <div style="width: 50%;">수량</div>
                            <div>가격</div>
                            <div>배송비</div>
                            <div>총 가격</div>
                        </div>

                        <c:choose>
                            <c:when test="${not empty cart}">
                                <c:forEach var="order" items="${cart}" varStatus="status">
                                    <div class="cart-item">
                                        <div style="width: 50%;">
                                            <input type="checkbox" id="ck${status.index}" value="${order.order_id}" name="orderIds"
                                                   onclick="test(${status.index}, ${order.count}, ${order.discounted}, ${order.delivery_fee})">
                                            <label for="ck${status.index}"></label>
                                        </div>
                                        <div style="width: 1500px;">
                                            <p><img width="100" height="100" src="/upload/${order.img1}"></p>
                                            <p>${order.name}</p>
                                        </div>
                                        <div style="width: 50%;">${order.count}</div>
                                        <div>
                                            <fmt:formatNumber value="${order.discounted}" pattern="#,###" /> 원
                                        </div>
                                        <div>
                                            <c:if test="${order.delivery_fee eq 0}">무료</c:if>
                                            <c:if test="${order.delivery_fee ne 0}">
                                                <fmt:formatNumber value="${order.delivery_fee}" pattern="#,###" /> 원
                                            </c:if>
                                        </div>
                                        <div>
                                            <fmt:formatNumber value="${order.total}" pattern="#,###" /> 원
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="btn-area">
                                    <div class="total-price">
                                        <div class="price-detail">
                                            <dl>
                                                <dt>총 상품금액</dt>
                                                <dd id="item-price">0 원</dd>
                                            </dl>
                                            <strong class="plus">+</strong>
                                            <dl>
                                                <dt>배송비</dt>
                                                <dd id="delivery-fee">0 원</dd>
                                            </dl>
<%--                                            <strong class="minus">-</strong>--%>
<%--                                            <dl>--%>
<%--                                                <dt>할인금액</dt>--%>
<%--                                                <dd>1,000원</dd>--%>
<%--                                            </dl>--%>
                                        </div>
                                        <strong class="price-total">
                                            총 주문금액
                                            <span id="price-total">0 원</span>
                                        </strong>
                                    </div>
<%--                                    <button>삭제</button>--%>
                                    <button onclick="payConfirm()">결제</button>
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
        </c:otherwise>
    </c:choose>
</main>

<%@include file="/jsp/commons/footer.jsp"%>
</body>
</html>

<script>
    $(document).ready(function () {
        <c:if test="${isPayed}">
            alert("결제가 완료되었습니다!");
        </c:if>
    });

    function payConfirm() {
        var ids = [];

        $("input[name=orderIds]:checked").each(function () {
            ids.push($(this).val());
        })

        if(ids.length === 0) {
            alert("상품을 선택해주세요!");
            return;
        }

        if(confirm("선택한 상품을 결제하시겠습니까?")) {
            location.href="/payService?orderIds=" + ids;
        } else {
            return;
        }
    }

    function test(index, count, price, delivery_fee) {
        var item_total = $('#item-price').text().replace("원", "").replace(",", "");
        var delivery_total = $('#delivery-fee').text().replace("원", "").replace(",", "");

        if($('#ck' + index).is(":checked") == true) {
            item_total = Number(item_total) + Number(price) * Number(count);
            delivery_total = Number(delivery_total) + Number(delivery_fee);
        } else {
            item_total = Number(item_total) - Number(price) * Number(count);
            delivery_total = Number(delivery_total) - Number(delivery_fee);

        }

        var price_total = item_total + delivery_total;

        item_total = numberWithCommas(item_total).concat(" 원");
        delivery_total = numberWithCommas(delivery_total).concat(" 원");
        price_total = numberWithCommas(price_total).concat(" 원");

        $('#item-price').text(item_total);
        $('#delivery-fee').text(delivery_total);
        $('#price-total').text(price_total);
    }

    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
</script>
