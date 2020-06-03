<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <c:if test="${not empty cart}">
        <c:forEach var="order" items="${cart}" varStatus="status">
            <div class="container-box" style="width: 1000px;">
                <ul class="desc">
                    <li></li>
                    <li class="">
                        <img width="10%" height="10%" src="/upload/${order.img1}">${order.name}
                    </li>
                    <li id="discounted" class="">${order.discounted}</li>
                    <li id="count" class="">${order.count}</li>
                    <li id="deleivery_fee" class="">${order.delivery_fee}</li>
                    <li id="total" class="">총액 ${order.total} 원</li> <!-- 총가격 = 할인가 * 수량 + 배송비 -->
                </ul>
            </div>
        </c:forEach>
    </c:if>

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

                <div class="cart-item">
                    <div>체크박스</div>
                    <div>
                        <img src="C:/Users/oo/Desktop/변민선/delivery/coffee.jpg" width="90" height="90">
                        <p> [일리] Y3.2 커피머신 블랙 </p>
                    </div>
                    <div>1</div>
                    <div>90,000</div>
                    <div>2,500</div>
                    <div>50,000</div>
                </div>
                <div class="cart-item">
                    <div>체크박스</div>
                    <div>
                        <img src="C:/Users/oo/Desktop/변민선/delivery/coffee.jpg" width="90" height="90">
                        <p> [일리] Y3.2 커피머신 블랙 </p>
                    </div>
                    <div>1</div>
                    <div>90,000</div>
                    <div>2,500</div>
                    <div>50,000</div>
                </div>
                <div class="cart-item">
                    <div>체크박스</div>
                    <div>
                        <img src="C:/Users/oo/Desktop/변민선/delivery/coffee.jpg" width="90" height="90">
                        <p> [일리] Y3.2 커피머신 블랙 </p>
                    </div>
                    <div>1</div>
                    <div>90,000</div>
                    <div>무료</div>
                    <div>50,000</div>
                </div>
                <div class="btn-area">
                    <button>삭제</button>
                    <button>결제</button>
                </div>
            </table>
        </div>
    </div>
</main>

<footer>

</footer>
</body>
</html>
