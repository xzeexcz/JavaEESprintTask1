<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.sprinttask.db.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="head.jsp"%>
</head>
  <body>
        <%@include file="navbar.jsp"%>
        <div class="row mt-3">
            <div class="col-12">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addTask">
                    + Добавить задание
                </button>
                <div class="modal fade" id="addTask" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Добавление задания</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <%@include file="bodyAddTask.jsp"%>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
        <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Наименование</th>
                            <th>Крайний срок</th>
                            <th>Выполнено</th>
                            <th>Детали</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            ArrayList<Tasks> tasks = (ArrayList<Tasks>)request.getAttribute("zadanies");
                            if(tasks!=null){
                                for(Tasks task :tasks) {
                        %>
                        <tr>
                            <td><%=task.getId()%></td>
                            <td><%=task.getName()%></td>
                            <td><%=task.getDeadLineDate()%></td>
                            <td><%=task.getStatus()%></td>
                            <td><a href="/details?id=<%=
                            task.getId()
                    %>" class="btn btn-outline-dark">Детали</a></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
            </div>
        </div>
  </body>
</html>
