package kz.sprinttask.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.sprinttask.db.DBManager;
import kz.sprinttask.db.Tasks;

import java.io.IOException;

@WebServlet(value = "/edit-task")
public class EditTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("task_name");
        String description = req.getParameter("task_descr");
        String deadLine = req.getParameter("task_dd");
        String status = req.getParameter("task_status");
        Long id = -1L;
        try{
            id = Long.parseLong(req.getParameter("task_id"));
        } catch (Exception e) {

        }
        if((name!=null) && (description!=null) && (deadLine !=null) && (status.equals("Да"))) {
            Tasks task = DBManager.getTask(id);
            task.setName(name);
            task.setDescription(description);
            task.setDeadLineDate(deadLine);
            task.setStatus(status);
            DBManager.editTask(task);
            resp.sendRedirect("/home");
        } else {
            resp.sendRedirect("/404.jsp");
        }
    }
}
