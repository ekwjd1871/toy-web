<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

<head>
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">
</head>

<body>
<%@include file="/jsp/commons/header.jsp"%>

<main class="main-container"> <!--style 있음-->
    <div class="container-ad">
        <img src="img/index_ad.jpg">
    </div>
    <div class="container-box">
        <c:if test="${not empty list}">
            <c:forEach var="order" items="${list}" varStatus="status">
                <div class="item-warp" onclick="location.href='/ItemSelectOne?item_id=${order.item_id}'">
                    <div class="item thumbnail">
                        <img width="25%" height="auto" src="upload/${order.img1}">
                    </div>
                    <ul class="desc">
                        <li class="desc name" style="margin-bottom: 3%">${order.name}</li>
                        <li class="desc category">${order.category}</li>
                        <li class="desc price">${order.price}<h6>원</h6></li>
                        <li class="desc discount"><h5>${order.discounted}</h5><h6 style="font-size: 1.6rem">원</h6></li>
                        <li class="desc fee" style="font-size: 18px">배송비 ${order.delivery_fee}</li>
                    </ul>
                </div>
            </c:forEach>
        </c:if>
    </div>

    <a href="/ItemSelectOne?item_id=${item.item_id}"></a>
    <!--  여기는 실제로 사용할 데이터만 간단하게 뽑아놓음
    <img width="25%" height="auto" src="upload/${item.img1}">
    <a >${item.name}
    가격&nbsp${item.price}
    할인가&nbsp${item.discounted}
    배송비&nbsp${item.delivery_fee}
    ${item.category}
    -->
</main>

<%@include file="/jsp/commons/footer.jsp"%>
</body>
</html>
