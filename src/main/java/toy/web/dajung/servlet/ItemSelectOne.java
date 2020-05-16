package toy.web.dajung.servlet;

import toy.web.dajung.model.Item;
import toy.web.dajung.service.ItemDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/ItemSelectOne")
public class ItemSelectOne extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        ItemDAO dao = new ItemDAO();

        try {
            Item item = dao.selectOne(id); //해당 id번호로 DB select 후, 해당 item 모델 넘겨줌

            if (item != null) {
                req.setAttribute("item", item);
            } else {
                System.out.println("item one 못가져옴.");
            }
            RequestDispatcher dis = req.getRequestDispatcher("/jsp/detail_item.jsp");
            dis.forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
