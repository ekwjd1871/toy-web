package toy.web.dajung.model;

import toy.web.dajung.exception.LoginException;
import toy.web.dajung.service.UserDAO;

import java.util.Objects;

public class User {
    private String user_id;
    private String password;
    private String name;
    private String role;

    public User() {
        //
    }

    public User(String userId, String password, String name, String role) {
        this.user_id = userId;
        this.password = password;
        this.name = name;
        this.role = role;
    }

    public String getUserId() {
        return user_id;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getRole() {
        return role;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + user_id + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", role='" + role + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(user_id, user.user_id) &&
                Objects.equals(password, user.password) &&
                Objects.equals(name, user.name) &&
                Objects.equals(role, user.role);
    }

    public boolean matchPassword(String newPassword) {
        return this.password.equals(newPassword);
    }

    public static boolean login(String userId, String password) throws Exception {
        UserDAO userDAO = new UserDAO();
        User user = userDAO.findByUserId(userId);

        if (user == null || !user.matchPassword(password)) {
            throw new LoginException();
        }

        return true;
    }
}
