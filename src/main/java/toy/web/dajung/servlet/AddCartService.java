package toy.web.dajung.servlet;

import toy.web.dajung.model.Order;
import toy.web.dajung.model.User;
import toy.web.dajung.service.ItemDAO;
import toy.web.dajung.service.OrderDAO;
import toy.web.dajung.service.UserDAO;
import toy.web.dajung.utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@WebServlet("/AddCartService")
public class AddCartService extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User loginUser = (User) SessionUtils.getObjectValue(session, "user");

        int item_id = Integer.parseInt(req.getParameter("item_id"));
        String buy_count = req.getParameter("buy_count");

        SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd" + "\n" + "HH:mm"); //줄바꿈안되면 시간 없애버리지뭐
        Calendar time = Calendar.getInstance();
        String date_time = format.format(time.getTime());

        System.out.println(date_time);

        Order order = new Order(100, loginUser.getUserId(), item_id, buy_count, "0", "0", date_time); //order_id는 임의//0은 false 의미

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
