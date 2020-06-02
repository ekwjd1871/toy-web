<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <title>sellup - 장바구니</title>
    <link rel="stylesheet" href="/css/global.css"/>
    <link rel="stylesheet" href="/css/cart.css"/>
    <script type="text/javascript" charset="euc-kr" src="/js/cart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">
</head>
<body>
<%@include file="/jsp/commons/header.jsp"%>

<main>

    <!-- 위에는 jstl 확인 (한 주문의 총 가격 합산 못함) / 밑에는 테이블헤더만 작성       + form을 어디에 ..  -->


    <!--로그인한 회원의 장바구니 상품 리스트(cart)-->
    <!-- [체크박스] - 상품<이미지,이름> - 가격 - 담은수량 - 배송비 - 총 가격(배송비포함) -->
    <c:if test="${not empty cart}">
        <c:forEach var="order" items="${cart}" varStatus="status">
            <div class="" >
                <ul class="desc">
                    <li></li>
                    <li class=""> <img width="10%" height="10%" src="/upload/${order.img1}"> <br> ${order.name} </li>
                    <li id="discounted" class="">${order.discounted}</li>
                    <li id="count" class="">${order.count}</li>
                    <li id="deleivery_fee" class="">${order.delivery_fee}</li>
                    <li id="total" onload="" class=""></li> <!-- 총가격 = 할인가 * 수량 + 배송비 -->
                </ul>
            </div>
        </c:forEach>
    </c:if>


    <br><br>

    <div class="del_wrapper">

        <div class="del_1">
            <h4> 장바구니 </h4>
        </div>


        <hr width="70%">


        <div class="del_2">

            <div class="del_ta">

                <table>
                    <thead>
                    <tr>
                        <th class="1"> &nbsp; </th>
                        <th class="2">상품</th>
                        <th class="3">가격</th>
                        <th class="del_info">수량</th>
                        <th class="del_num">배송비</th>
                        <th class="del_pri">총 가격</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td class="del_date">     </td>
                        <td class="del_info">
                            <img src="C:/Users/oo/Desktop/변민선/delivery/coffee.jpg" width="90" height="90">
                            <p> [일리] Y3.2 커피머신 블랙 </p>
                        </td>
                        <td class="del_num"> 1 </td>
                        <td class="del_pri">90,000</td>
                    </tr>
                    </tbody>
                    <tbody>
                    <tr>
                        <td class="del_date">2020. 05. 23</td>
                        <td class="del_info">
                            <img src="C:/Users/oo/Desktop/변민선/delivery/coffee.jpg" width="90" height="90">
                            <p> [일리] Y3.2 커피머신 블랙 </p>
                        </td>
                        <td class="del_num"> 1 </td>
                        <td class="del_pri">90,000</td>
                    </tr>
                    </tbody>

                    <tbody>
                    <tr>
                        <td class="del_date">2020. 05. 23</td>
                        <td class="del_info">
                            <img src="C:/Users/oo/Desktop/변민선/delivery/coffee.jpg" width="90" height="90">
                            <p> [일리] Y3.2 커피머신 블랙 </p>
                        </td>
                        <td class="del_num"> 1 </td>
                        <td class="del_pri">90,000</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

    <br><br>

</main>

<footer>

</footer>

</body>
</html>
