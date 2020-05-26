package toy.web.dajung.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import toy.web.dajung.model.Order;
import toy.web.dajung.service.jdbc.JdbcConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        int row = 0;//이건모지 쿼리 실행 완료시 1 리턴?
        //연결하는 문장이 없어도 되는건가????????????????
        try {                                                  //order_id 생략
            psmt = con.prepareStatement("insert into orders (user_id, item_id, count, is_pay, is_delivery) values (?, ?, ?, ?, ?)");

            psmt.setString(1, order.getUser_id());
            psmt.setString(2, Integer.toString(order.getItem_id()));
            psmt.setString(3, order.getCount());
            psmt.setString(4, order.getIs_pay());
            psmt.setString(5, order.getIs_delivery());

            row = psmt.executeUpdate();
        } catch (SQLException e) {
            logger.error("Exception ", e);
        } finally {
            close();
        }

        return row;
    }

    public void close() throws SQLException {
        if (rs != null) rs.close();
        if (psmt != null) psmt.close();
        if (con != null) con.close();
    }


}
