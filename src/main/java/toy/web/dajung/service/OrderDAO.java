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

    // 1. 장바구니 담기
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

    // 2. 장바구니 페이지 - 로그인한 회원의 모든 주문을 담은 장바구니 데이터 뽑아냄
    public ArrayList<Order> cartList(String login_id) throws SQLException {
        ArrayList<Order> cart = new ArrayList<>();
        psmt = con.prepareStatement("select od.order_id, od.count, item.img1, item.name, item.discounted, item.delivery_fee, item.item_id " +
                                         "from orders as od, item " +
                                         "where od.user_id = ? and item.item_id = od.item_id");
        psmt.setString(1, login_id);
        rs = psmt.executeQuery();

        while (rs.next()) {
            String fee = "";
            fee = rs.getString(6);
            if (fee == "무료") {
                fee = "0";
            } else {
                fee = "2500";
            }

            cart.add(new Order(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    fee,
                    rs.getInt(7)
            ));
        }
        close();

        return cart;
    }

    // 3. 주문 확인 페이지 - 로그인 회원의 결제한 주문 데이터 뽑아냄
    public ArrayList<Order> payList(String login_id) throws SQLException {
        ArrayList<Order> paylist = new ArrayList<>();

        psmt = con.prepareStatement("select od.order_id, od.date_time, od.count, od.is_delivery, it.item_id, it.img1, it.`name`, it.discounted, it.delivery_fee " +
                "from orders as od, item as it " +
                "where od.user_id = ? and od.is_pay = '1' and it.item_id = od.item_id"); //위에 'name', 밑에 '1' 되려나????????????????
        psmt.setString(1, login_id);
        rs = psmt.executeQuery();

        while (rs.next()) {
            String fee = "";
            fee = rs.getString(9);
            if (fee.equals("무료")) {
                fee = "0";
            } else {
                fee = "2500";
            }

            Item item = new Item(
                            rs.getInt(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getString(8),
                            fee
            );

            paylist.add(new Order(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        item//객체지향도 잘되려나???????????????????????????????
            ));


        }
        close();
        return paylist;
    }

    /* 객체 지향적 @@
    public ArrayList<Order> cartList2(String login_id) throws SQLException {
        ArrayList<Order> cart = new ArrayList<>();
        psmt = con.prepareStatement("select od.order_id, od.count, item.img1, item.name, item.discounted, item.delivery_fee, item.item_id " +
                "from orders as od, item " +
                "where od.user_id = ? and item.item_id = od.item_id");
        psmt.setString(1, login_id);
        rs = psmt.executeQuery();

        while (rs.next()) {           //rs는 레코드 하나를 말함
            String fee = "";

            fee = rs.getString(6);

            if (fee == "무료") {
                fee = "0";
            } else {
                fee = "2500";
            }

            Item item = new Item( // 해당하는 생성자 필요
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    fee,
                    rs.getString(7)
            );

            cart.add(new Order(
                    rs.getInt(1),
                    rs.getString(2),
                    item    // ${order.item.delivery_fee}
            ));
        }
        close();

        return cart;
    }
    */

    public void close() throws SQLException {
        if (rs != null) rs.close();
        if (psmt != null) psmt.close();
        if (con != null) con.close();
    }
}
