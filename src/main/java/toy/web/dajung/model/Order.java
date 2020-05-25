package toy.web.dajung.model;

public class Order {
    private int order_id; //해당 id
    private int user_id;
    private int item_id;
    private int count; //구매 수량
    private boolean is_pay; //구매 여부
    private boolean is_delivery; //배송 여부

    public Order(int order_id, int user_id, int item_id, int count, boolean is_pay, boolean is_delivery) {
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

    public int getUser_id() {
        return user_id;
    }

    public int getItem_id() {
        return item_id;
    }

    public int getCount() {
        return count;
    }

    public boolean isIs_pay() {
        return is_pay;
    }

    public boolean isIs_delivery() {
        return is_delivery;
    }
}


