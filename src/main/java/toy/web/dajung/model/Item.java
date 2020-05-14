package toy.web.dajung.model;

public class Item {
    private int id;
    private String name;
    private String category;
    private String price; //4 (천단위 숫자 처리)
    private String discounted; //5
    private String delivery_fee;
    private String count; //7
    private String img1;
    private String img2;

    // id 번호는 생략, auto_increment (id 번호는 쿼리를 통해 시작 번호를 제때 변경할 수 있다  ex. alter table ITEM auto_increment = 1; )
    public Item(int id, String name, String category, String price, String discounted, String delivery_fee, String count, String img1, String img2) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.discounted = discounted;
        this.delivery_fee = delivery_fee;
        this.count = count;
        this.img1 = img1;
        this.img2 = img2;
    }

    public int getId() {
        return id;
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

    public String getImg2() {
        return img2;
    }
}
