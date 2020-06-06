package toy.web.dajung.servlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

@WebServlet("/deliveryManage")
public class DeliveryManageServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(DeliveryManageServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User loginUser = (User) SessionUtils.getObjectValue(session, "user");

        try {
            OrderDAO dao = new OrderDAO();
            ArrayList<Order> payList = dao.payList(loginUser.getUserId(), loginUser.getRole());
            logger.info("PayList : {}", payList);

            req.setAttribute("payList", payList);

            RequestDispatcher dis = req.getRequestDispatcher("/jsp/admin/delivery_management.jsp");
            dis.forward(req, resp);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
