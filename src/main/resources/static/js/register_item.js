
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

function priceAutoInput(obj) {
    var price;
    price = obj.value;
    document.getElementById("input_item_discounted").value = price;
}




// ---------------------------------------할인하는 가격 계산----------------------------------------------

function calcul_discount() {
    var price, dised, dis;  // 원가, 최대할인가, 할인하는 가격

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