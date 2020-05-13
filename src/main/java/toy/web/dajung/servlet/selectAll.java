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
import java.util.ArrayList;

// 나중에 활용할라나?
@WebServlet("/asdasd")
public class selectAll extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("why");
        ItemDAO dao = new ItemDAO();
        try{
            ArrayList<Item> list = dao.selectAll();
            if(list != null){
                request.setAttribute("list", list);
                System.out.println("list : " + list.toString());
            }
            else{
                System.out.println("selectAll list 비었습니다.");
            }

            RequestDispatcher dis = request.getRequestDispatcher("/");
            dis.forward(request, response);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
