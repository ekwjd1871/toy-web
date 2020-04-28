package toy.web.dajung.servlet;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import toy.web.dajung.model.Item;
import toy.web.dajung.service.ItemDAO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/UploadService") //Form에 이름 변경나중에 해야함
public class UploadService extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //String iname = request.getParameter("input_item_name");
        //System.out.println(iname);

        ServletContext context = getServletContext();
        String saveDir = context.getRealPath("/upload");
        System.out.println(saveDir);

        int maxSize = 15 * 1024 * 1024; //15MB
        String encoding = "euc-kr";

        Boolean isMulti = ServletFileUpload.isMultipartContent(request); //multipart/form-data 형식인가?
        if (isMulti) {
            MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
                                       // MultipartRequest를 생성하면서 saveDir 지정한 곳에 파일(이미지 등)이 자동 저장이 됨
            //ItemDAO itemDao = new ItemDAO();

            String name = multi.getParameter("input_item_name");
            String category = multi.getParameter("input_item_category");
            String price = multi.getParameter("input_item_price");
            String discounted = multi.getParameter("input_item_discounted");
            String delivery_fee = multi.getParameter("delivery_fee");
            String count = multi.getParameter("input_item_count");
            String img1 = multi.getFilesystemName("input_item_img1"); //파일이름은 getFilesystemName 으로 가져옴
            String img2 = multi.getFilesystemName("input_item_img2");

            // Item 레코드 1 (객체 1) - 데이터를 객체로 묶어줌 (넘겨주는 게 간단해짐)
            Item item = new Item(name, category, price, discounted, delivery_fee, count, img1, img2);
            //ItemDAO itemDAO = new ItemDAO();

            try {
                ItemDAO.getInstance().insert(item);
                response.sendRedirect("/");

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        else {
            System.out.println("일반 전송 Form입니다");
        }

    }
}
