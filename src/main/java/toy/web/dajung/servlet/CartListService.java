package toy.web.dajung.servlet;

import toy.web.dajung.model.Order;
import toy.web.dajung.model.User;
import toy.web.dajung.service.OrderDAO;
import toy.web.dajung.utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

// 해당 회원의 장바구니 리스트 데이터를 장바구니 페이지에 넘겨줌
@WebServlet("/CartListService")
public class CartListService extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User loginUser = (User) SessionUtils.getObjectValue(session, "user");

        try {
            OrderDAO dao = new OrderDAO();
            ArrayList<Order> cart = dao.cartList(loginUser.getUserId());


        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
