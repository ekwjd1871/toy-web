package toy.web.dajung.servlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Go")
public class MyServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(MyServlet.class);
/*
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logger.info("hello 로 갔나요?? ^^..");
        resp.sendRedirect("/jsp/Zhello.jsp");
    }
*/
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logger.info("doPost 실행~~~");
        String name = req.getParameter("input_item_name");
        // 변수 확인시 보통 사용법
        logger.info("name : {}", name); //웹으로 실행하고 밑에 콘솔창에 보여짐 //데이터 잘 들어옴

        resp.sendRedirect("/jsp/Zhello.jsp"); //실행 완료 후 이동경로
        // 다른 jsp에 데이터 가져오는 방법 고우고우 (서버 , 디비를 해야한다~ 스키마 짜야한다 -> 그 전에 상품페이지 다 만들자 오케이)
    }
}
