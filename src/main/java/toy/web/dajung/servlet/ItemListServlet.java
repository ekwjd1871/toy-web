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

@WebServlet("") //context path '' // 서블릿에서 루트경로 설정 : "/"(X) "" (O)  -> mapping부분빼고 나머지는 / 로 이 서블릿 접속
public class ItemListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ItemDAO dao = new ItemDAO();
        try{
            ArrayList<Item> list = dao.selectAll();
            if(list != null){
                req.setAttribute("list", list);
            }
            else{
                System.out.println("selectAll list 비었습니다.");
            }
            RequestDispatcher dis = req.getRequestDispatcher("/jsp/index.jsp"); // (주의!!!)"/"은 서블릿 자신을 가리키기때문에 index.jsp로 적어줘야 한다.
            dis.forward(req, resp);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
