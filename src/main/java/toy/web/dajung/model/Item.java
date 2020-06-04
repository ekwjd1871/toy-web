package toy.web.dajung.model;

import java.text.DecimalFormat;

public class Item {
    private DecimalFormat formatter = new DecimalFormat("###,###");

    private int item_id;
    private String name;
    private String category;
    private String price; //4 (천단위 숫자 처리)
    private String discounted; //5
    private String delivery_fee;
    private String count; //7
    private String img1;
    private String img2;

    // (id 번호는 쿼리를 통해 시작 번호를 제때 변경할 수 있다  ex. alter table ITEM auto_increment = 1; )
    public Item(int id, String name, String category, String price, String discounted, String delivery_fee, String count, String img1, String img2) {
        this.item_id = id;
        this.name = name;
        this.category = category;
        this.price = formatter.format(Integer.parseInt(price.replaceAll(",", "")));
        this.discounted = formatter.format(Integer.parseInt(discounted.replaceAll(",", "")));
        this.delivery_fee = delivery_fee;
        this.count = count;
        this.img1 = img1;
        this.img2 = img2;
    }

    public Item(){
        //
    }

    // Order 3번에 쓰임
    public Item(int item_id, String img1,String name, String discounted, String delivery_fee){
        this.item_id = item_id;
        this.img1 = img1;
        this.name = name;
        this.discounted = discounted;
        this.delivery_fee = delivery_fee;
    }

    public int getItem_id() {
        return item_id;
    }

    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
    }

    public String getPrice() {
        return price;
    }

    public String getDiscounted() {
        return discounted;
    }

    public String getDelivery_fee() {
        return delivery_fee;
    }

    public String getCount() {
        return count;
    }

    public String getImg1() {
        return img1;
    }

    public String getImg2() { return img2; }


    public void setItem_id(int item_id) { this.item_id = item_id; }

    public void setName(String name) { this.name = name; }

    public void setCategory(String category) { this.category = category; }

    public void setPrice(String price) { this.price = price; }

    public void setDiscounted(String discounted) { this.discounted = discounted; }

    public void setDelivery_fee(String delivery_fee) { this.delivery_fee = delivery_fee; }

    public void setCount(String count) { this.count = count; }

    public void setImg1(String img1) { this.img1 = img1; }

    public void setImg2(String img2) { this.img2 = img2; }
}
