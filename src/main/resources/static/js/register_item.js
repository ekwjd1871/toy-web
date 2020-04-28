
//-----------------------------자동 컴마 생성 + 문자 및 소수점 에러 처리-------------------------------------------------

function inputNumberAutoComma(obj) {
    //console.log('value : ', obj.value) //콘솔창에서 값 확인
    // 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
    var deleteComma = obj.value.replace(/\,/g, "");

    // 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
    if(isFinite(deleteComma) == false) {
        alert("문자는 입력하실 수 없습니다.");
        obj.value = "";
        return false;
    }

    // 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
    obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
}




// 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
function inputNumberWithComma(str) {

    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
}

// 콤마( , )가 들어간 값에 콤마를 제거하는 함수
function inputNumberRemoveComma(str) {

    str = String(str);
    return str.replace(/[^\d]+/g, "");
}




// ---------------------------판매가격 입력 후 최대할인가(밑 text)에 자동 입력-------------------------------------

// function priceAutoInput(obj) {
//     var price;
//     price = obj.value;
//     document.getElementById("input_item_discounted").value = price;
// }

function priceAutoInput(value, htmlElement) {
    htmlElement.value = value;
}


// ---------------------------------------할인하는 가격 계산----------------------------------------------

function calcul_discount() {
    var price, dised, dis;  // 원가, 할인된 가격, 할인하는 가격

    price = document.getElementById("input_item_price").value;  //값을 가져옴
    dised = document.getElementById("input_item_discounted").value;
    dis = inputNumberRemoveComma(price) - inputNumberRemoveComma(dised);  //컴마를 제외해서 할인하는 가격 계산
    if(dis < 0){
        alert("최대할인가가 판매가격보다 높습니다.");
        document.getElementById("input_item_discounted").value = document.getElementById("input_item_price").value;  //다시 원가로 변경
        document.getElementById("discounted_price").innerHTML = "0";  //할인하는 가격 0원으로
    }
    else{
        document.getElementById("discounted_price").innerHTML = inputNumberWithComma(dis); //할인하는 가격 출력
    }
}




//---------------- submit 제출 전 가격에 컴마를 제거, 안됌..ㅠㅠ 다시 , 함수가 먹힘 ---------------
function submitTest() {

    //price, discounted 두 변수 - 컴마가 있는 값을 가져옴 , 컴마를 없애서 그것으로 변경
    var price, dised; //원가, 할인되는 가격

    price = document.getElementById("input_item_price").value;
    dised = document.getElementById("input_item_discounted").value;
    //alert(inputNumberRemoveComma(price));
    inputNumberRemoveComma(price);
    inputNumberRemoveComma(dised);
    document.getElementById("input_item_price").value = price;
    document.getElementById("input_item_discounted").value = dised;
    alert(price + " " + dised + "  컴마 사라졌니?")

}



//-----------------------------상품 데이터 null확인 + 상품 등록 알림---------------------------------------
function formCheck() { // 오ㅗㅇ 됏다 다정아천재야

    <!--각 데이터 한개씩 비워있는 지 check-->
    if(document.getElementById("input_item_name").value == ""){
        alert("상품명을 입력해주세요.");
        return document.getElementById("input_item_name").focus();
    }

    if(document.getElementById("input_item_category").value == ""){
        alert("상품 카테고리를 선택해주세요.");
        return document.getElementById("input_item_category").focus();
    }

    if(document.getElementById("input_item_price").value == ""){
        alert("판매가격을 입력해주세요.");
        return document.getElementById("input_item_price").focus();
    }

    if(document.getElementById("input_item_discounted").value == ""){
        alert("최대할인가를 입력해주세요.");
        return document.getElementById("input_item_discounted").focus();
    }

    //라디오 버튼
    var radio = document.getElementsByName('delivery_fee');
    var select_value = null;

    for(var i=0; i<radio.length; i++){
        if(radio[i].checked == true){
            select_value = radio[i].value;
        }
    }

    if(select_value == null){
        alert("배송비를 선택해주세요.");
        return document.getElementsByName('delivery_fee')[0].focus();
    }

    if(document.getElementById("input_item_count").value == ""){
        alert("재고수량을 입력해주세요.");
        return document.getElementById("input_item_count").focus();
    }

    if(document.getElementById("input_item_img1").value == ""){
        alert("상품 이미지를 등록해주세요.");
        return document.getElementById("input_item_img1").focus();
    }

    if(document.getElementById("input_item_img2").value == ""){
        alert("상세 설명 이미지를 등록해주세요.");
        return document.getElementById("input_item_img2").focus();
    }

    alert("상품 등록이 완료되었습니다.");

    document.getElementById("item_form").submit();


}