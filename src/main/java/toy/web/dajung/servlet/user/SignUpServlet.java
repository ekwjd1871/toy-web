package toy.web.dajung.servlet.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import toy.web.dajung.model.User;
import toy.web.dajung.service.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/users/create")
public class SignUpServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(SignUpServlet.class);
    private UserDAO userDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            userDAO = new UserDAO();

            User user = new User(req.getParameter("userId"), req.getParameter("password"), req.getParameter("name"), "USER");
            logger.debug("Sign Up User : {}", user);

            userDAO.createUser(user);

            req.setAttribute("isSignUp", true);

            RequestDispatcher dis = req.getRequestDispatcher("/jsp/user/sign_up.jsp");
            dis.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
