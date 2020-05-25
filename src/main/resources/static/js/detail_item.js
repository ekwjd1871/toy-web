function count_up() {
    var c;
    c = document.getElementById("buy_count").value;
    c = Number(c) + 1; //숫자로 계산
    document.getElementById("buy_count").value = c;
}

function count_down() {
    var c;
    c = document.getElementById("buy_count").value;
    c = Number(c) - 1;
    if(c >= 1){ //수량을 1까지만
        document.getElementById("buy_count").value = c;
    }
}

function count_check() {
    var c;
    c = document.getElementById("buy_count").value;
    c = Number(c);
    if(c <= 0){
        alert("구매할 수량을 입력하세요.");
        return document.getElementById("buy_count").focus();
    }
    document.getElementById("detail_form").submit();
}