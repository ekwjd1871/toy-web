package toy.web.dajung.service.jdbc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class JdbcConnector {
    private static final Logger logger = LoggerFactory.getLogger(JdbcConnector.class);

    public Connection getConnection() throws IOException, SQLException {
        FileInputStream fi = new FileInputStream("db.properties");
        Properties prop = new Properties();
        prop.load(fi);

        String driver = prop.getProperty("driver");
        String url = prop.getProperty("url");
        String id = prop.getProperty("user");
        String pw = prop.getProperty("password");

        try {
            Class.forName(driver);
        } catch (Exception e) {
            logger.debug(e.getMessage());
        }

        return DriverManager.getConnection(url, id, pw);
    }
}
