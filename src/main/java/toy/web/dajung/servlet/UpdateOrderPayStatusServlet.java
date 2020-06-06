package toy.web.dajung.servlet;

import org.slf4j.Logger;
import toy.web.dajung.service.OrderDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static org.slf4j.LoggerFactory.getLogger;

@WebServlet("/payService")
public class UpdateOrderPayStatusServlet extends HttpServlet {
    private static final Logger logger = getLogger(UpdateOrderPayStatusServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String[] orderIds = req.getParameter("orderIds").split(",");
            logger.warn("orderIds : {}", orderIds);
            logger.warn("orderIds.size : {}", orderIds.length);

            OrderDAO orderDAO = new OrderDAO();
            orderDAO.updatePayStatus(orderIds);

            req.setAttribute("isPayed", true);

            RequestDispatcher dis = req.getRequestDispatcher("/OrderCheckList");
            dis.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
