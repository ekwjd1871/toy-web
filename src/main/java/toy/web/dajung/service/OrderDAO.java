package toy.web.dajung.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import toy.web.dajung.model.Item;
import toy.web.dajung.model.Order;
import toy.web.dajung.service.jdbc.JdbcConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDAO {
    private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);

    private JdbcConnector connector;
    private Connection con;
    private PreparedStatement psmt;
    private ResultSet rs;

    public OrderDAO() throws Exception {
        this.connector = new JdbcConnector();
        this.con = connector.getConnection();
        this.psmt = null;
        this.rs = null;
    }

    public int createOrder(Order order) throws SQLException {
        int row = 0;

        try {                                                  //order_id 생략
            psmt = con.prepareStatement("insert into orders (user_id, item_id, count, is_pay, is_delivery, date_time) values (?, ?, ?, ?, ?, ?)");

            psmt.setString(1, order.getUser_id());
            psmt.setString(2, Integer.toString(order.getItem_id()));
            psmt.setString(3, order.getCount());
            psmt.setString(4, order.getIs_pay());
            psmt.setString(5, order.getIs_delivery());
            psmt.setString(6, order.getDate_time());

            row = psmt.executeUpdate();
        } catch (SQLException e) {
            logger.error("Exception ", e);
        } finally {
            close();
        }
        return row;
    }

    //로그인한 회원에 대한 모든 주문을 담은 장바구니 데이터 뽑아냄
    public ArrayList<Order> cartList(String login_id) throws SQLException {
        ArrayList<Order> cart = new ArrayList<>();
        psmt = con.prepareStatement("select od.order_id, od.count, item.img1, item.name, item.discounted, item.delivery_fee, item.item_id " +
                                         "from orders as od, item " +
                                         "where od.user_id = ? and item.item_id = od.item_id");
        psmt.setString(1, login_id);
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

    public void close() throws SQLException {
        if (rs != null) rs.close();
        if (psmt != null) psmt.close();
        if (con != null) con.close();
    }
}
