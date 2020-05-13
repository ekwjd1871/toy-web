package toy.web.dajung.service;

import toy.web.dajung.model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {
    //private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);

    //---------------------------- DB 연결--------------------------------------
    public Connection getConnection() {
        String url = "jdbc:mysql://localhost:3306/market";  // + /DB이름
        String id = "root";
        String pw = "63896389";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(url, id, pw); //Connection(DB) 객체를 넘김
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    //------------------------------데이터 삽입 쿼리문 (틀)-----------------------------
    public void insert(User user) throws SQLException {       //데이터 모델 클래스를 받아서 insert 쿼리문을 실행한다
        //logger.warn("잘들어왔나 : {}", user);  잘들어옴
        String sql = "insert into ITEM (item_name, item_category, item_price, item_discounted) values(?,?,?,?)";
        PreparedStatement pstmt = getConnection().prepareStatement(sql);
        //PreparedStatement( ) 메소드를 통해 PreparedStatement 객체를 생성할 때 인자값으로 실행할 SQL문을 지정하는데, 값을 동적으로 지정해야할 때 ? 기호로 대체한다.

        //pstmt.setString(1, user.getItem_id());     //sql문이 String이니까 안에 함수를 작성할 수 없으니
        pstmt.setString(1, user.getItem_name());   //?의 인덱스, 들어갈 값  ; 1부터 시작
        pstmt.setString(2, user.getItem_category());
        pstmt.setString(3, user.getItem_price());
        pstmt.setString(4, user.getItem_discouted());

        pstmt.executeUpdate(); //쿼리문 실행
    }
}