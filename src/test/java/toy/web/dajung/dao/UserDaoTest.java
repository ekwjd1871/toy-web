package toy.web.dajung.dao;

import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import toy.web.dajung.model.User;
import toy.web.dajung.service.UserDAO;

import java.sql.SQLException;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;

public class UserDaoTest {
    private static final Logger logger = LoggerFactory.getLogger(UserDaoTest.class);
    public static User TEST_USER = new User("id", "pw", "name", "TESTER");

    private UserDAO userDAO;

    @Before
    public void setup() throws Exception {
        this.userDAO = new UserDAO();
    }

    @Test
    public void crd() throws SQLException {
        assertThat(userDAO.createUser(TEST_USER), is(1));

        User matcher = userDAO.findByUserId(TEST_USER.getUserId());

        assertThat(userDAO.removeUser(TEST_USER.getUserId()), is(1));
        assertThat(TEST_USER, is(matcher));
    }
}
