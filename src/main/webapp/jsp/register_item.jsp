<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon.png">
    <link rel="stylesheet" href="/css/register_item.css">
    <script type="text/javascript" src="/js/register_item.js"></script>
</head>

<body>
<%@include file="/jsp/commons/header.jsp"%>

<main>
    <div class="background_input_data">
        <p class="input_data_title">상품 등록</p>
        <p class="intro">* 판매하실 상품의 정보를 입력해주세요.</p>
        <hr>
        <br/>
        <form id="item_form" action="/UploadService" method="post" enctype="multipart/form-data" accept-charset="EUC-KR"
              onsubmit="return submitTest();">  <!--★★<form>에서 getParameter 할때 필요한 건 'name' 이었다..; -->
            <label for="input_item_name">
                상품명
                <input type="text" id="input_item_name" name="input_item_name" maxlength="52">
                <p class="notice" style="margin-left: 78px">* 50자 이하로 입력이 가능합니다.</p>
            </label>
            <label for="input_item_category">
                상품 카테고리
                <select name="input_item_category" id="input_item_category" class="input_item_category">
                    <option value="" selected disabled hidden></option> <!--목록에는 없지만 처음 뜨는 글-->
                    <option value="의류/잡화/뷰티">의류/잡화/뷰티</option>       <!--그냥 selected만 적어놓으면 디폴트 값이 됨-->
                    <option value="식품/생필품">식품/생필품</option>
                    <option value="문구/취미/반려">문구/취미/반려</option>
                    <option value="가전/컴퓨터/디지털">가전/컴퓨터/디지털</option>
                    <option value="스포츠/건강">스포츠/건강</option>
                    <option value="여행/도서/티켓">여행/도서/티켓</option>
                </select>
            </label>
            <br><br>
            <label for="input_item_price">
                판매가격(원)                                                      <!--onsubmit에도 컴마 계속 유지 ㅠㅠ-->
                <!--가격입력후 최대할인가도 자동입력-->
                <input type="text" id="input_item_price" name="input_item_price" onkeyup="inputNumberAutoComma(this);"
                       onblur="priceAutoInput(this.value, document.getElementById('input_item_discounted'))"
                       maxlength="15">
            </label>
            <br><br>
            <label for="input_item_discounted">
                최대할인가(원)
                <input type="text" id="input_item_discounted" name="input_item_discounted"
                       onkeyup="inputNumberAutoComma(this); calcul_discount();" maxlength="15"> <!--가격넘으면 알림창-->
                <span class="discount_notice" style="margin-left: 15px">총</span> <span id="discounted_price"
                                                                                       class="discount_notice">0</span>
                <span class="discount_notice">(원)이 할인되었습니다. </span>
                <p class="notice" style="margin-left: 137px; color: crimson">* 실제 판매되는 가격입니다.</p>
            </label>
            <label> <!--radio가 여러개라서 id로 하기는 그래서 그냥 안적음-->
                배송비
                <input type="radio" name="delivery_fee" value="무료" style="margin-left: 80px"> <span class="radio_span">무료 (+0원)</span>
                <input type="radio" name="delivery_fee" value="2,500원" style="margin-left: 15px"> <span
                        class="radio_span">유료 (+2500원)</span>
            </label>
            <br><br>
            <label for="input_item_count">
                재고수량(개)
                <input type="text" id="input_item_count" name="input_item_count" onkeyup="inputNumberAutoComma(this)">
            </label>
            <br><br><br>

            <table border="0" style="">
                <tr>
                    <td align="center">
                        <label for="input_item_img1">
                            상품 이미지
                            <div class="filebox">
                                <label>선택       <!--   file버튼 안의 글 /이미지도 OK-->
                                    <input type="file" id="input_item_img1" name="input_item_img1">
                                </label>
                            </div>
                            <br>
                            <img id="img1_preveiw" src="/img/preview_grey.png" width="170px" height="170px"
                                 style="margin:15px 0 0 0px">
                        </label>
                    </td>
                    <td>
                        &nbsp &nbsp &nbsp &nbsp &nbsp
                    </td>
                    <td>
                        <label for="input_item_img2">
                            상세 설명 이미지
                            <div class="filebox">
                                <label>선택       <!--   file버튼 안의 글 /이미지도 OK-->
                                    <input type="file" id="input_item_img2" name="input_item_img2">
                                </label>
                            </div>
                            <br>
                            <img id="img2_preveiw" src="/img/preview_grey.png" width="170px" height="170px"
                                 style="margin:15px 0 0 0px">
                        </label>
                    </td>
                </tr>
            </table>
            <br>
            <hr>
            <br><br>
            <br><br>
            <input class="submit_button" type="button" value="등록하기" onclick="formCheck()">
            <!--onsubmit을 하려면 button태그 XX--> <!--함수안에서 데이터가 다 있을 시 submit()실행-->
        </form>
    </div>
    <footer>
        <br><br>
        <br><br><br><br>
    </footer>
</main>


<script>
    <!---->
    function readURL1(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img1_preveiw').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    <!--사진2 변환-->
    function readURL2(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img2_preveiw').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    <!--사진1 파일선택 감지-->
    $("#input_item_img1").change(function () {
        readURL1(this);
    });

    <!--사진2 파일선택 감지-->
    $("#input_item_img2").change(function () {
        readURL2(this);
    });

</script>
</body>
</html>

