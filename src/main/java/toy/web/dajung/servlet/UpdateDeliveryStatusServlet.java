package toy.web.dajung.servlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import toy.web.dajung.service.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import static org.slf4j.LoggerFactory.getLogger;

@WebServlet("/deliveryService")
public class UpdateDeliveryStatusServlet extends HttpServlet {
    private static final Logger logger = getLogger(UpdateDeliveryStatusServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(req.getParameter("orderId"));
            logger.info("target orderId : " + orderId);

            OrderDAO orderDAO = new OrderDAO();
            orderDAO.updateDeliveryStatus(orderId);

            resp.sendRedirect("/deliveryManageList");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
