package kz.sprinttask.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.sprinttask.db.DBManager;
import kz.sprinttask.db.Tasks;

import java.io.IOException;

@WebServlet(value = "/add-task")
public class addTaskServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = "";
        String description = "";
        String deadLine = "";
        String status = "";
        try{
            name = req.getParameter("task_name");
            description = req.getParameter("task_descr");
            deadLine = req.getParameter("task_dd");
            status = req.getParameter("task_status");
        } catch (Exception e) {

        }
        if((name!=null) && (description!=null) && (deadLine !=null) && (status.equals("Да"))) {
            Tasks tasks = new Tasks();
            tasks.setName(name);
            tasks.setDescription(description);
            tasks.setDeadLineDate(deadLine);
            tasks.setStatus(status);
            DBManager.addTask(tasks);
            req.setAttribute("dobav",tasks);
            resp.sendRedirect("/home");
        } else {
            resp.sendRedirect("/404.jsp");
        }
    }
}
