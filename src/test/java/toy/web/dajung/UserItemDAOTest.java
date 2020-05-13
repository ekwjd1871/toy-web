package toy.web.dajung;

import org.junit.Before;
import toy.web.dajung.model.Item;
import toy.web.dajung.service.ItemDAO;
import toy.web.dajung.service.UserDAO;

import static org.junit.Assert.*;

import org.junit.Test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class UserItemDAOTest {

    private UserDAO userDao;

    @Before
    public void setup() {
        userDao = new UserDAO();
    }

    @Test //connection 테스트
    public void connectionTest() {
        Connection con = userDao.getConnection();

        assertNotNull(con);
    }

    @Test //insert() 실제 실행
    public void insertTest() throws Exception {
        userDao.insert(UserTest.b);  //데이터 모델 클래스를 받아서 insert 쿼리문을 실행한다
        //같은 test폴더 클래스의 static이라서 UserTest클래스를 import안해도 된다
    }


    //-------------- Item DAO ----------------


    @Before
    public void setup2() {
        ItemDAO itemDoa = ItemDAO.getInstance();
    }

    @Test
    public void connectionT() throws IOException {
        ItemDAO.getInstance().getConnection();
        //assertTrue(itemDao.conIsNotNull()); //OKOKOK
    }

    @Test
    public void insertT() throws SQLException, IOException {
        Item item = new Item(100, "appple 한글테스트", "food", "10,000", "9,500", "free", "55", "ex1", "ex2");
        ItemDAO.getInstance().insert(item);
    }


    @Test
    public void removeComma() {


        String a = "1,112,000";
        a = a.replace(",", ""); // 실제 값을 바꾸어 주지 않음 !! (주의!!!!!!!!!!!)
        System.out.println(a);
    }


}
