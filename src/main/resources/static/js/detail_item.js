function count_up() {
    var c;
    c = document.getElementById("buy_count").value;
    c = Number(c) + 1; //���ڷ� ���
    document.getElementById("buy_count").value = c;
}

function count_down() {
    var c;
    c = document.getElementById("buy_count").value;
    c = Number(c) - 1;
    if(c >= 1){ //������ 1������
        document.getElementById("buy_count").value = c;
    }
}

function count_check() {
    var c;
    c = document.getElementById("buy_count").value;
    c = Number(c);
    if(c <= 0){
        alert("������ ������ �Է��ϼ���.");
        return document.getElementById("buy_count").focus();
    }
    document.getElementById("detail_form").submit();
}