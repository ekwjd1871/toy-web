package toy.web.dajung.database;

import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import toy.web.dajung.service.jdbc.JdbcConnector;

import java.sql.Connection;

import static org.junit.Assert.assertNotNull;

public class DatabaseTest {
    private static final Logger logger = LoggerFactory.getLogger(DatabaseTest.class);

    private JdbcConnector jdbc;

    @Before
    public void setup() {
        this.jdbc = new JdbcConnector();
    }

    @Test
    public void isConnection() throws Exception {
        Connection conn = jdbc.getConnection();
        logger.debug("Db connection : {}", conn.toString());
        assertNotNull(conn);
    }
}
