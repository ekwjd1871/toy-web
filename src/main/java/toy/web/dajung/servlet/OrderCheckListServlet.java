package toy.web.dajung.servlet;

import org.slf4j.Logger;
import toy.web.dajung.model.Order;
import toy.web.dajung.model.User;
import toy.web.dajung.service.OrderDAO;
import toy.web.dajung.utils.SessionUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static org.slf4j.LoggerFactory.getLogger;

/**
 *  3. 주문 확인 페이지 - 회원이 결제한 주문 데이터 뿌림
 *  4. 장바구니 페이지
 */
@WebServlet("/OrderCheckList")
public class OrderCheckListServlet extends HttpServlet {
    private static final Logger logger = getLogger(OrderCheckListServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User loginUser = (User) SessionUtils.getObjectValue(session, "user");

        try {
            OrderDAO dao = new OrderDAO();
            ArrayList<Order> payList = dao.payList(loginUser.getUserId());
            logger.info("PayList : {}", payList);

            req.setAttribute("payList", payList);
            req.setAttribute("isPayList", true);

            RequestDispatcher dis = req.getRequestDispatcher("/jsp/cart_and_order.jsp");
            dis.forward(req, resp);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
