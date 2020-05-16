<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

<head>
    <meta charset="EUC-KR">
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">
    <link rel="shortcut icon" type="image/png" sizes="16x16" href="/img/favicon.png">
    <title>sellup</title>
    <link rel="stylesheet" href="/css/index.css"/>
</head>

<body>
<%@include file="/jsp/commons/header.jsp"%>

<main class="main-container"> <!--style 있음-->
    <div class="container-ad">
        <img src="img/index_ad.jpg">
    </div>
    <div class="container-items">
        <c:if test="${not empty list}">
            <c:forEach var="item" items="${list}" varStatus="status">
                <div class="item-warp" onclick="location.href='/ItemSelectOne?id=${item.id}'">
                    <div class="item thumbnail">
                        <img width="25%" height="auto" src="upload/shampoo.jpg">
                    </div>
                    <ul class="desc">
                        <li class="desc name">${item.name}</li>
                        <li class="desc category">${item.category}</li>
                        <li class="desc price">${item.price}<h6>원</h6></li>
                        <li class="desc discount"><h5>${item.discounted}</h5><h6 style="font-size: 1.6rem">원</h6></li>
                        <li class="desc fee">배송비 ${item.delivery_fee}</li>
                    </ul>
                </div>
            </c:forEach>
        </c:if>
    </div>

    <a href="ItemSelectOne?id=${item.id}"></a>
    <!--  여기는 실제로 사용할 데이터만 간단하게 뽑아놓음
    <img width="25%" height="auto" src="upload/${item.img1}">
    <a >${item.name}
    가격&nbsp${item.price}
    할인가&nbsp${item.discounted}
    배송비&nbsp${item.delivery_fee}
    ${item.category}
    -->

    <footer></footer>
</main>
</body>
</html>

<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
