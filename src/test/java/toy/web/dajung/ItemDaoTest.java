package toy.web.dajung;

import org.junit.Before;
import org.junit.Test;
import toy.web.dajung.model.Item;
import toy.web.dajung.service.ItemDAO;

import java.io.IOException;
import java.sql.SQLException;

public class ItemDaoTest {

    private ItemDAO itemDoa;

    @Before
    public void setup() {
        this.itemDoa = new ItemDAO();
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
