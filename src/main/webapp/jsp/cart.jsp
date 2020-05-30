<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <title>sellup - 장바구니</title>
    <link rel="stylesheet" href="/css/global.css"/>
    <link rel="stylesheet" href="/css/cart.css"/>
    <script type="text/javascript" charset="euc-kr" src=""></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">
</head>
<body>
<%@include file="/jsp/commons/header.jsp"%>

<main>

    <!--로그인한 회원의 장바구니 상품 리스트(cart)-->
    <c:if test="${not empty cart}">
        <c:forEach var="order" items="${cart}" varStatus="status">
            <div class="" >
                <div class="">
                </div>
                <ul class="desc">
                    <li class="desc name">${order.order_id}</li>
                    <li class="desc category">${order.item_id}</li>
<%--                    <li class="desc price">${order.price}<h6>원</h6></li>--%>
<%--                    <li class="desc discount"><h5>${order.discounted}</h5><h6 style="font-size: 1.6rem">원</h6></li>--%>
<%--                    <li class="desc fee">배송비 ${order.delivery_fee}</li>--%>
                </ul>
            </div>
        </c:forEach>
    </c:if>


    <br><br>

    <div class="del_wrapper">

        <div class="del_1">
            <h4> 장바구니 </h4>
        </div>


        <hr width="45%">


        <div class="del_2">

            <div class="del_ta">

                <table>
                    <thead>
                    <tr>
                        <th class="del_date">&nbsp;</th>
                        <th class="del_info">구매 정보</th>
                        <th class="del_num">수량</th>
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
