package toy.web.dajung.service;

import toy.web.dajung.model.Item;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

public class ItemDAO {
    private Connection con = null;
    private PreparedStatement psmt = null;
    private ResultSet rs = null;
    private int result = 0;
    private static ItemDAO instance = new ItemDAO(); //static instance(변수) 한개 고정 사용

    public static ItemDAO getInstance() {
        return instance;
    } // 클래스의 변수를 생성하지 않고 만들어진 instance를 불러옴

    //--------------- DB 연결 ------------------
    public void getConnection() throws IOException { //con 변수에 Connection을 담음
        FileInputStream fi = new FileInputStream("db.properties");
        Properties prop = new Properties();
        prop.load(fi);

        String driver = prop.getProperty("driver");
        String url = prop.getProperty("url");
        String id = prop.getProperty("user");
        String pw = prop.getProperty("password");

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, id, pw);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    //---------- 모든 DB관련 종료(반환) ----------
    public void close() throws SQLException {
        if (rs != null) rs.close();
        if (psmt != null) psmt.close();
        if (con != null) con.close();
    }

    //---------- 데이터 삽입 ----------- OKOK
    public void insert(Item item) throws SQLException, IOException {
        getConnection();
        //실제 쿼리문     / auto_increment인 id가 맨앞에 원래 있어서 필드를 직접 적어줌
        psmt = con.prepareStatement("insert into item (name, category, price, discounted, delivery_fee, count, img1, img2) values(?,?,?,?,?,?,?,?)");
        psmt.setString(1, item.getName());
        psmt.setString(2, item.getCategory());

        String price = item.getPrice();
        price = price.replace(",", ""); //가격 컴마 제거
        psmt.setString(3, price);

        String discounted = item.getDiscounted();
        discounted = discounted.replace(",", ""); //가격 컴마 제거
        psmt.setString(4, discounted);

        psmt.setString(5, item.getDelivery_fee());
        psmt.setString(6, item.getCount());
        psmt.setString(7, item.getImg1());
        psmt.setString(8, item.getImg2());

        psmt.executeUpdate();

        close();
    }

    //----------------모든 데이터 객체 select-----------------//객체단위로 뽑아냄
    public ArrayList<Item> selectAll() throws ClassNotFoundException, IOException, SQLException {
        getConnection();

        ArrayList<Item> tempList = new ArrayList<>();
        psmt = con.prepareStatement("select * from item order by id ASC"); //오름차순
        rs = psmt.executeQuery();

        while (rs.next()) {           //rs는 레코드 하나를 말함
            tempList.add(new Item(     //tempList <- Item(select 결과들 rs) 각 객체 생성 및 저장
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    //String.format("%,d", rs.getString(4)), 컴마 표시 하고싶은데

                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getString(8),
                    rs.getString(9)
            ));
        }

        close();

        return tempList;
    }

    public Item selectOne(int id) throws ClassNotFoundException, IOException, SQLException{
        getConnection();

        Item item = null; //초기화 필요

        psmt = con.prepareStatement("select * from item where id=?");
        psmt.setInt(1, id);
        rs = psmt.executeQuery();

        if(rs.next()){  //레코드(객체) 하나 존재
            item = new Item(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getString(8),
                    rs.getString(9));
        }

        close();
        return item;
    }


}
