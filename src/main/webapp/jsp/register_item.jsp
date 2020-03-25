<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>sellup - 상품 등록</title>
    <link rel="stylesheet" href="/css/all.css"/> <!--body_header.css가 없어서 로고가 중앙에 위치-->
    <link rel="stylesheet" href="/css/register_item.css">
    <script type="text/javascript" src="/js/register_item.js"></script>
</head>

<!--
-->

<body>
<header style="text-align: center">
    <div>
        <a class="header_logo" href="localhost:8080">
            <img src="/img/SELLUP_logo.png" ; width="290px" ; height="70px">
        </a>
    </div>
    <div class="header_side"> <!--비어있음-->
    </div>
</header>
<main>
    <div class="background_input_data">
        <p class="input_data_title">상품 등록</p>
        <p class="intro">* 판매하실 상품의 정보를 입력해주세요.</p>
        <hr>
        <br/>
        <form action="/UploadService" method="post" enctype="multipart/form-data" accept-charset="EUC-KR" onsubmit="return submitTest();">  <!--★★getParameter 할때 필요한 건 'name' 이었다..; -->
            <label for="input_item_name">
                상품명
                <input type="text" id="input_item_name" name="input_item_name" maxlength="52">
                <p class="notice" style="margin-left: 78px">*  50자 이하로 입력이 가능합니다.</p>
            </label>
            <label for="input_item_category">
                상품 카테고리
                <select name="input_item_category" id="input_item_category" class="input_item_category">
                    <option value="" selected disabled hidden>   </option> <!--목록에는 없지만 처음 뜨는 글-->
                    <option value="clothes">의류/잡화/뷰티</option>       <!--그냥 selected만 적어놓으면 디폴트 값이 됨-->
                    <option value="foods">식품/생필품</option>
                    <option value="stationary">문구/취미/반려</option>
                    <option value="electronics">가전/컴퓨터/디지털</option>
                    <option value="sports">스포츠/건강</option>
                    <option value="travel">여행/도서/티켓</option>
                </select>
            </label>
            <br><br>
            <label for="input_item_price">
                판매가격(원)                                                      <!--onsubmit에도 컴마 계속 유지 ㅠㅠ--> <!--가격입력후 최대할인가도 자동입력-->
                <input type="text" id="input_item_price" name="input_item_price" onkeyup="inputNumberAutoComma(this);" onblur="priceAutoInput(this.value, document.getElementById('input_item_discounted'))" maxlength="15">
            </label>
            <br><br>
            <label for="input_item_discounted">
                최대할인가(원)
                <input type="text" id="input_item_discounted" name="input_item_discounted" onkeyup="inputNumberAutoComma(this); calcul_discount();" maxlength="15"> <!--가격넘으면 알림창-->
                <span class="discount_notice" style="margin-left: 15px">총</span>    <span id="discounted_price" class="discount_notice">0</span>    <span class="discount_notice">(원)이 할인되었습니다. </span>
                <p class="notice" style="margin-left: 137px; color: crimson">*  실제 판매되는 가격입니다.</p>
            </label>
            <label> <!--radio가 여러개라서 id로 하기는 그래서 그냥 안적음-->
                배송비
                <input type="radio" name="delivery_fee" value="free" style="margin-left: 80px">   <span class="radio_span">무료 (+0원)</span>
                <input type="radio" name="delivery_fee" value="pay" style="margin-left: 15px">    <span class="radio_span">유료 (+2500원)</span>
            </label>
            <br><br>
            <label for="input_item_count">
                재고수량(개)
                <input type="text" id="input_item_count" name="input_item_count" onkeyup="inputNumberAutoComma(this)">
            </label>
            <br><br>
            <label for="input_item_img1">
                상품 이미지
                <div class="filebox">
                    <label>선택       <!--   file버튼 안의 글 /이미지도 OK-->
                        <input type="file" id="input_item_img1" name="input_item_img1">
                    </label>
                </div>
            </label>




            <!--
            <input type="file" value="등록" name="input_item_img" style="margin-left: 5px">
            -->

            <br><br>
            <br><br><br><br><br><br><br><br><br><br><br>
            <input type="submit">제출 test</input> <!--onsubmit을 하려면 button태그 XX-->
            <!--디비에 데이터 넣어야 함-->
        </form>


    </div>
    <footer>

    </footer>
</main>
</body>
</html>