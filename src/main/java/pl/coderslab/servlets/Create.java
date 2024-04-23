package pl.coderslab.servlets;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import pl.coderslab.entity.model.User;
import pl.coderslab.entity.dao.UserDao;

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
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String validInput = req.getParameter("input");
        if ("invalid".equals(validInput)) {
            req.setAttribute("isUserAdded", false);
        } else if ("valid".equals(validInput)) {
            req.setAttribute("isUserAdded", true);
        }
        getServletContext().getRequestDispatcher("/views/add-user.jsp").forward(req, resp);
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
            resp.sendRedirect("/views/add?input=invalid");
            return;
        }
        resp.sendRedirect("/views/add?input=valid");

    }
}
