package kz.sprinttask.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.sprinttask.db.DBManager;
import kz.sprinttask.db.Tasks;

import java.io.IOException;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = -1L;
        try {
            id = Long.parseLong(req.getParameter("id"));
        } catch (Exception e) {

        }
        Tasks task = DBManager.getTask(id);
        req.setAttribute("zadana", task);
        req.getRequestDispatcher("/details.jsp").forward(req,resp);
    }
}
