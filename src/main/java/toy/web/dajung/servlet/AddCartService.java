package toy.web.dajung.servlet;

import toy.web.dajung.model.Order;
import toy.web.dajung.service.ItemDAO;
import toy.web.dajung.service.OrderDAO;
import toy.web.dajung.service.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddCartService")
public class AddCartService extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_id = req.getParameter("user_id");
        int item_id = Integer.parseInt(req.getParameter("item_id"));
        String buy_count = req.getParameter("buy_count");

        Order order = new Order(100, user_id, item_id, buy_count, "0", "0"); //order_id는 임의//0은 false 의미

        try {
            int row = 0;
            OrderDAO dao = new OrderDAO();
            row = dao.createOrder(order);
            if(row != 0){
                resp.sendRedirect("/ItemSelectOne?item_id=" + item_id);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
