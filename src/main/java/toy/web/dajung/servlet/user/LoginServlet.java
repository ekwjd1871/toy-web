package toy.web.dajung.servlet.user;

import org.slf4j.Logger;
import toy.web.dajung.exception.LoginException;
import toy.web.dajung.model.User;
import toy.web.dajung.service.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import static org.slf4j.LoggerFactory.getLogger;

@WebServlet("/users/login")
public class LoginServlet extends HttpServlet {
    private static final Logger logger = getLogger(LoginServlet.class);
    private UserDAO userDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            userDAO = new UserDAO();

            String id = req.getParameter("userId");
            String pw = req.getParameter("password");

            User.login(id, pw);

            HttpSession session = req.getSession();

            User user = userDAO.findByUserId(id);
            session.setAttribute("user", user);
            logger.info("User login Success : {}", user);

            resp.sendRedirect("/");
        } catch (LoginException e) {
            errorForward(req, resp, LoginException.LOGIN_ERROR);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void errorForward(HttpServletRequest req, HttpServletResponse resp, String errorMessage) throws ServletException, IOException {
        req.setAttribute("errorMessage", errorMessage);
        RequestDispatcher rd = req.getRequestDispatcher("/jsp/user/login.jsp");
        rd.forward(req, resp);
    }
}
