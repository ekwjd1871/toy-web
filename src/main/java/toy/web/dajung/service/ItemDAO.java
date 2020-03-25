package toy.web.dajung.service;

import toy.web.dajung.model.Item;

import java.sql.*;

public class ItemDAO {
    private Connection con = null;
    private PreparedStatement psmt = null;
    private ResultSet rs = null;
    private int result = 0;
    private static ItemDAO instance = new ItemDAO(); //static instance(변수) 한개 고정 사용


    public static ItemDAO getInstance() { return instance; } // 클래스의 변수를 생성하지 않고 만들어진 instance를 불러옴



    //--------------- DB 연결 ------------------
    public void getConnection() { //con 변수에 Connection을 담음 , OK 잘됨
        String url = "jdbc:mysql://localhost:3306/market"; //?useUnicode=true
        String id = "root";
        String pw = "63896389";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, id, pw);
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
    }


    //---------- 모든 DB관련 종료(반환) ----------
    public void close() throws SQLException {
        if(rs!=null) rs.close();
        if(psmt!=null) psmt.close();
        if(con!=null) con.close();
    }

    //---------- 데이터 삽입 ----------- OKOK
    public void insert(Item item) throws SQLException{
        getConnection();
                                        //실제 쿼리문     / auto_increment인 id가 맨앞에 원래 있어서 필드를 직접 적어줌
        psmt = con.prepareStatement("insert into item (name, category, price, discounted, delivery_fee, count, img1, img2) values(?,?,?,?,?,?,?,?)");
        psmt.setString(1, item.getName());
        psmt.setString(2, item.getCategory());

        String price =  item.getPrice();
        price = price.replace(",", ""); //가격 컴마 제거
        psmt.setString(3, price);

        String discounted =  item.getDiscounted();
        discounted = discounted.replace(",", ""); //가격 컴마 제거
        psmt.setString(4, discounted);

        psmt.setString(5, item.getDelivery_fee());
        psmt.setString(6, item.getCount());
        psmt.setString(7, item.getImg1());
        psmt.setString(8, item.getImg2());

        psmt.executeUpdate();

        close();
    }





}
