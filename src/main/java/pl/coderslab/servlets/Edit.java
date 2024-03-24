package pl.coderslab.servlets;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import pl.coderslab.entity.User;
import pl.coderslab.entity.UserDao;
import pl.coderslab.service.InputValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/users/edit")
public class Edit extends HttpServlet {
    public static final Logger log = LogManager.getLogger(Edit.class);

    public static UserDao userDao = new UserDao();
    public static final String USERNAME_VALIDATION_INFORMATION = "Musi składać się z co najmniej 8 symboli";
    public static final String PASSWORD_VALIDATION_INFORMATION = "Musi składać się z co najmniej 8 symboli, posiadać co najmniej jedną dużą literę, co najmniej jedną małą literę, co najmniej jedną cyfrę oraz co najmniej jednen specjalny symbol";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer userIdToEdit = InputValidator.parseInteger(req.getParameter("id"));
        if (userIdToEdit == null) {
            resp.sendRedirect("/users/pageNotFound");
            return;
        }

        User user = userDao.read(userIdToEdit);
        log.info(user);
        req.setAttribute("user", user);
        req.setAttribute("passwordRequirement", PASSWORD_VALIDATION_INFORMATION);
        req.setAttribute("usernameRequirement", USERNAME_VALIDATION_INFORMATION);
        getServletContext().getRequestDispatcher("/users/edit-user-form.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("id"));
        String newUsername = req.getParameter("newUsername");
        String newEmail = req.getParameter("newEmail");
        String newPassword = req.getParameter("newPassword");
        User updatedUser = new User(newUsername, newEmail, newPassword);
        updatedUser.setId(userId);
        log.info("After update " + updatedUser);
        if (userDao.update(updatedUser)) {
            req.setAttribute("user", updatedUser);
            req.setAttribute("isUserUpdated", true);
        } else {
            req.setAttribute("isUserUpdated", false);
            User notUpdatedUser = userDao.read(userId);
            req.setAttribute("user", notUpdatedUser);
        }
        getServletContext().getRequestDispatcher("/users/edit-user-form.jsp").forward(req, resp);
    }
}
