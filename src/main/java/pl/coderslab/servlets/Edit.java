package pl.coderslab.servlets;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import pl.coderslab.entity.model.User;
import pl.coderslab.entity.dao.UserDao;
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer userIdToEdit = InputValidator.parseInteger(req.getParameter("id"));
        if (userIdToEdit == null) {
            resp.sendRedirect("/views/pageNotFound");
            return;
        }

        User user = userDao.read(userIdToEdit);
        log.info(user);
        req.setAttribute("user", user);
        getServletContext().getRequestDispatcher("/views/edit-user.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("id"));
        String newUsername = req.getParameter("username");
        String newEmail = req.getParameter("email");
        String newPassword = req.getParameter("password");
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
        getServletContext().getRequestDispatcher("/views/edit-user.jsp").forward(req, resp);
    }
}
