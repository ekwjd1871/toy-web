package toy.web.dajung.model;

import toy.web.dajung.exception.LoginException;
import toy.web.dajung.service.UserDAO;

import java.util.Objects;

public class User {
    private String userId;
    private String password;
    private String name;
    private String role;

    public User() {
        //
    }

    public User(String userId, String password, String name, String role) {
        this.userId = userId;
        this.password = password;
        this.name = name;
        this.role = role;
    }

    public String getUserId() {
        return userId;
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
                "userId='" + userId + '\'' +
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
        return Objects.equals(userId, user.userId) &&
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
