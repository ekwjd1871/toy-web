package toy.web.dajung.model;

public class User {
    private int item_id;
    private String item_name;
    private String item_category;
    private String item_price;
    private String item_discouted;

    //int item_id 는 auto_increament이라서 생성자에만 빼준다.
    public User(String item_name, String item_category, String item_price, String item_discouted) {
        //this.item_id = item_id;    //자동으로 디비에서 id번호를 생성해줄까? ㅇㅇㅇ
        this.item_name = item_name;
        this.item_category = item_category;
        this.item_price = item_price;
        this.item_discouted = item_discouted;
    }

    public int getItem_id() {
        return item_id;
    }

    public String getItem_name() {
        return item_name;
    }

    public String getItem_category() {
        return item_category;
    }

    public String getItem_price() {
        return item_price;
    }

    public String getItem_discouted() {
        return item_discouted;
    }


    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public void setItem_category(String item_category) {
        this.item_category = item_category;
    }

    public void setItem_price(String item_price) {
        this.item_price = item_price;
    }

    public void setItem_discouted(String item_discouted) {
        this.item_discouted = item_discouted;
    }

    @Override
    public String toString() {
        return "User{" +
                "item_id=" + item_id +
                ", item_name='" + item_name + '\'' +          //'string' 으로 표기되는 거임
                ", item_category='" + item_category + '\'' +
                ", item_price='" + item_price + '\'' +
                ", item_discouted='" + item_discouted + '\'' +
                '}';
    }
}
