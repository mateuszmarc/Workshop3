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
import java.util.List;

@WebServlet("/users/list")
public class ReadAll extends HttpServlet {
    public static final Logger log = LogManager.getLogger(ReadAll.class);
    public static final UserDao userDao = new UserDao();
    public static final int RECORD_NUMBER_BY_PAGE = 10;
    public static final int STARTING_PAGE = 1;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int numberOfUsers = userDao.countAll();
        int numberOfPages = (int) Math.ceil((double) numberOfUsers / RECORD_NUMBER_BY_PAGE);
        Integer currentPage = InputValidator.parseInteger(req.getParameter("pageIndex"));
        int offset = 0;

        if (currentPage == null) {
            req.setAttribute("pageIndex", STARTING_PAGE);
        } else {
            req.setAttribute("pageIndex", currentPage);
            offset = (currentPage - 1) * RECORD_NUMBER_BY_PAGE;
        }
        List<User> retrievedUsers = userDao.findUsersBasedOnOffsetAndLimit(offset, RECORD_NUMBER_BY_PAGE);

        req.setAttribute("recordNumberByPage", RECORD_NUMBER_BY_PAGE);
        req.setAttribute("numberOfUsers", numberOfUsers);
        req.setAttribute("numberOfPages", numberOfPages);
        req.setAttribute("retrievedUsers", retrievedUsers);

        getServletContext().getRequestDispatcher("/users/list.jsp").forward(req, resp);

    }
}
