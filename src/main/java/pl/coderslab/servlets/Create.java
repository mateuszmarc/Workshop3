package pl.coderslab.servlets;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import pl.coderslab.entity.User;
import pl.coderslab.entity.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/users/add")
public class Create extends HttpServlet {
    public static final Logger log = LogManager.getLogger(Create.class);
    public static final UserDao userDao = new UserDao();
    public static final String USERNAME_VALIDATION_INFORMATION = "Musi składać się z co najmniej 8 symboli";
    public static final String PASSWORD_VALIDATION_INFORMATION = "Musi składać się z co najmniej 8 symboli, posiadać co najmniej jedną dużą literę, co najmniej jedną małą literę, co najmniej jedną cyfrę oraz co najmniej jednen specjalny symbol";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String validInput = req.getParameter("input");
        if ("invalid".equals(validInput)) {
            req.setAttribute("isUserAdded", false);
        } else if ("valid".equals(validInput)) {
            req.setAttribute("isUserAdded", true);
        }
        req.setAttribute("usernameRequirement", USERNAME_VALIDATION_INFORMATION);
        req.setAttribute("passwordRequirement", PASSWORD_VALIDATION_INFORMATION);
        getServletContext().getRequestDispatcher("/users/add-user-form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = new User(username, email, password);
        User addedUser = userDao.create(user);
        log.info(addedUser);
        if (addedUser == null) {
            resp.sendRedirect("/users/add?input=invalid");
            return;
        }
        resp.sendRedirect("/users/add?input=valid");

    }
}
