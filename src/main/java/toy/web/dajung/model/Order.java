package toy.web.dajung.model;
// <Order + Item> 데이터  =   회원 -> 장바구니 페이지, 주문 확인 페이지  /  관리자 ->  주문 관리 페이지
public class Order {
    private int order_id; //해당 id
    private String user_id;
    private Item item;
    private String count; //구매 수량
    private String is_pay; //구매 여부
    private String is_delivery; //배송 여부
    private String date_time;

    // 1. 장바구니 담기 (주문상세 페이지에서 일어남)
    public Order(int order_id, String user_id, int item_id, String count, String is_pay, String is_delivery, String date_time) {
        item = new Item();

        this.order_id = order_id;
        this.user_id = user_id;
        item.setItem_id(item_id); //
        this.count = count;
        this.is_pay = is_pay;
        this.is_delivery = is_delivery;
        this.date_time = date_time;
    }

    // 2. 로그인 회원의 장바구니의 리스트 각 주문(상품)
    public Order(int order_id, String count, String img1, String name, String discounted, String delivery_fee, int item_id){
        item = new Item();

        this.order_id = order_id;
        this.count = count;
        item.setImg1(img1);
        item.setName(name);
        item.setDiscounted(discounted);
        item.setDelivery_fee(delivery_fee);
        item.setItem_id(item_id);
    }

    // 1. ~
    public int getOrder_id() { return order_id; }

    public String getUser_id() { return user_id; }

    public int getItem_id() { return item.getItem_id(); }

    public String getCount() {
        return count;
    }

    public String getIs_pay() {
        return is_pay;
    }

    public String getIs_delivery() {
        return is_delivery;
    }

    public String getDate_time() { return date_time; }

    // 2. ~

    public String getImg1() { return item.getImg1(); }

    public String getName() { return item.getName(); }

    public String getDiscounted() { return item.getDiscounted(); }

    public String getDelivery_fee() { return item.getDelivery_fee(); }

}


