package toy.web.dajung.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import toy.web.dajung.model.User;
import toy.web.dajung.service.jdbc.JdbcConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);

    private JdbcConnector connector;
    private Connection con;
    private PreparedStatement psmt;
    private ResultSet rs;

    public UserDAO() throws Exception {
        this.connector = new JdbcConnector();
        this.con = connector.getConnection();
        this.psmt = null;
        this.rs = null;
    }

    public int createUser(User user) throws SQLException {
        int row = 0;

        try {
            psmt = con.prepareStatement("insert into users (userId, password, name, role) values(?, ?, ?, ?)");

            psmt.setString(1, user.getUserId());
            psmt.setString(2, user.getPassword());
            psmt.setString(3, user.getName());
            psmt.setString(4, user.getRole());

            row = psmt.executeUpdate();
        } catch (SQLException e) {
            logger.error("Exception " + e);
        } finally {
            close();
        }

        return row;
    }

    public int removeUser(String userId) throws SQLException {
        int row = 0;

        try {
            psmt = con.prepareStatement("delete from users where userId = ?");

            psmt.setString(1, userId);

            row = psmt.executeUpdate();
        } catch (SQLException e) {
            logger.error("Exception " + e);
        } finally {
            close();
        }

        return row;
    }

    public User findByUserId(String userId) throws SQLException {
        User user = new User();

        try {
            psmt = con.prepareStatement("select * from users where userId = ?");
            psmt.setString(1, userId);
            rs = psmt.executeQuery();

            if (rs.next()) {
                user = new User(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)
                );
            }
        } catch (SQLException e) {
            logger.error("Exception : " + e);
        } finally {
            close();
        }

        return user;
    }

    public void close() throws SQLException {
        if (rs != null) rs.close();
        if (psmt != null) psmt.close();
        if (con != null) con.close();
    }
}
