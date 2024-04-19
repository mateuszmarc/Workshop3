package pl.coderslab.servlets;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import pl.coderslab.entity.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/users/delete")
public class Delete extends HttpServlet {
    public static Logger log = LogManager.getLogger(Delete.class);
    public static final UserDao userDao = new UserDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userIdToDelete;
        try {
            userIdToDelete = Integer.parseInt(req.getParameter("id"));
            log.info(userIdToDelete);
        } catch (NumberFormatException ignored) {
            resp.sendRedirect("/users/pageNotFound");
            return;
        }
        boolean isDeleted = userDao.delete(userIdToDelete);
        req.setAttribute("isDeleted", isDeleted);
        getServletContext().getRequestDispatcher("/users/delete.jsp").forward(req, resp);
    }
}
