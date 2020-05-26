package toy.web.dajung.model;

public class Order {
    private int order_id; //해당 id
    private String user_id;
    private int item_id;
    private String count; //구매 수량
    private String is_pay; //구매 여부
    private String is_delivery; //배송 여부

    public Order(int order_id, String user_id, int item_id, String count, String is_pay, String is_delivery) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.item_id = item_id;
        this.count = count;
        this.is_pay = is_pay;
        this.is_delivery = is_delivery;
    }

    public int getOrder_id() {
        return order_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public int getItem_id() {
        return item_id;
    }

    public String getCount() {
        return count;
    }

    public String getIs_pay() {
        return is_pay;
    }

    public String getIs_delivery() {
        return is_delivery;
    }
}


