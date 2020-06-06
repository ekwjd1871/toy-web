package toy.web.dajung.model;

import java.util.Objects;

// <Order + Item> 데이터  =   회원 -> 장바구니 페이지, 주문 확인 페이지  /  관리자 ->  주문 관리 페이지
//DB의 select 쿼리에 따라 데이터모델을 맞춰주는 것(생성자로)
public class Order {
    private int order_id; //해당 id
    private String user_id;
    private Item item;
    private String count; //구매 수량
    private String is_pay; //구매 여부
    private boolean is_delivery; //배송 여부
    private String date_time;
    private String total;

    // 1. 장바구니 담기 (주문상세 페이지에서 일어남)
    public Order(int order_id, String user_id, int item_id, String count, String is_pay, boolean is_delivery, String date_time) {
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
        this.setTotalPrice(discounted, count, delivery_fee);
    }

    // 3. 로그인한 회원의 결제한, 주문 확인 페이지
    public Order(int order_id, String date_time, String count, boolean is_delivery, String user_id, Item item){
        this.order_id = order_id;
        this.date_time = date_time;
        this.count = count;
        this.is_delivery = is_delivery;
        this.user_id = user_id;
        this.item = item;

        this.setTotalPrice(item.getDiscounted(), count, item.getDelivery_fee());
    }

    // 1. ~
    public int getOrder_id() { return order_id; }

    public String getUser_id() { return user_id; }

    public int getItem_id() { return item.getItem_id(); }

    public String getCount() { return count; }

    public String getIs_pay() { return is_pay; }

    public boolean getIs_delivery() { return is_delivery; }

    public String getDate_time() { return date_time; }

    // 2. ~

    public String getImg1() { return item.getImg1(); }

    public String getName() { return item.getName(); }

    public String getDiscounted() { return item.getDiscounted(); }

    public String getDelivery_fee() { return item.getDelivery_fee(); }

    public String getTotal() { return total; }

    public void setTotal(String total) { this.total = total; }

    private void setTotalPrice(String discounted, String count, String delivery_fee) {
        int disc = Integer.parseInt(discounted);
        int cnt = Integer.parseInt(count);
        int fee = Integer.parseInt(delivery_fee);

        setTotal(Integer.toString((disc * cnt) + fee));
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Order order = (Order) o;
        return order_id == order.order_id &&
                is_delivery == order.is_delivery &&
                Objects.equals(user_id, order.user_id) &&
                Objects.equals(item, order.item) &&
                Objects.equals(count, order.count) &&
                Objects.equals(is_pay, order.is_pay) &&
                Objects.equals(date_time, order.date_time) &&
                Objects.equals(total, order.total);
    }

    @Override
    public int hashCode() {
        return Objects.hash(order_id, user_id, item, count, is_pay, is_delivery, date_time, total);
    }

    @Override
    public String toString() {
        return "Order{" +
                "order_id=" + order_id +
                ", user_id='" + user_id + '\'' +
                ", item=" + item +
                ", count='" + count + '\'' +
                ", is_pay='" + is_pay + '\'' +
                ", is_delivery='" + is_delivery + '\'' +
                ", date_time='" + date_time + '\'' +
                ", total='" + total + '\'' +
                '}';
    }
}


