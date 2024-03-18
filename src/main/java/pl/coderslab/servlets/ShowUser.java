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

@WebServlet("/users/show")
public class ShowUser extends HttpServlet {
    public static final Logger log = LogManager.getLogger(ShowUser.class);
    public static final UserDao userDao = new UserDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer userIdToEdit;
        try {
            userIdToEdit = Integer.parseInt(req.getParameter("id"));
            log.info(userIdToEdit);
        } catch (NumberFormatException ignored) {
            resp.sendRedirect("/users/pageNotFound");
            return;
        }

        User readUser = userDao.read(userIdToEdit);
        if (readUser != null) {
            readUser.setId(userIdToEdit);
            req.setAttribute("user", readUser);
        }
        getServletContext().getRequestDispatcher("/users/show.jsp").forward(req, resp);
    }
}
