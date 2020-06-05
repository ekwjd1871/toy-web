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
import java.sql.SQLException;
import java.util.ArrayList;

// 주문 확인 페이지 - 회원이 결제한 주문 데이터 뿌림
@WebServlet("/PayListService")
public class PayListService extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(PayListService.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User loginUser = (User) SessionUtils.getObjectValue(session, "user");

        try {
            OrderDAO dao = new OrderDAO();
            ArrayList<Order> paylist = dao.payList(loginUser.getUserId());
            if(paylist != null){
                for(Order order: paylist) {
                    logger.info("order : {}", order);
                }

                req.setAttribute("paylist", paylist);
            }
            else{
                System.out.println("pay list가 비었습니다.");
            }
            //RequestDispatcher dis = req.getRequestDispatcher("/jsp/");
            //dis.forward(req, resp);
            resp.sendRedirect("/");
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }
}