<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.sprinttask.db.Tasks" %>
<%@ page import="kz.sprinttask.db.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="head.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <%
        Tasks ts = (Tasks) request.getAttribute("zadana");
        if(ts!=null){

    %>
<%--    <div class="jumbotron">--%>
<%--        <p>NAME:</p><br>--%>
<%--        <h1 class="display-4"><%=ts.getName()%></h1><br>--%>
<%--        <p class="lead"><%=ts.getDescription()%></p>--%>
<%--        <hr class="my-4">--%>
<%--        <p><%=ts.getDeadLineDate()%></p>--%>
<%--        <a class="btn btn-primary btn-lg" href="/home" role="button">SAVE</a>--%>
<%--        <a class="btn btn-primary btn-lg" href="/delete?id=<%=ts.getId()%>" role="button">DELETE</a>--%>
<%--    </div>--%>
    <div class="container mt-5">
        <div class="row">
            <div class="col-6 mx-auto">
                <div class="row">
                    <div class="col-12">
                        <label>Наименование: </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="text" class="form-control" readonly value="<%=ts.getName()%>">
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <label>Описание: </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <textarea readonly rows="10" class="form-control"><%=ts.getDescription()%></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <label>Крайний срок: </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="text" class="form-control" readonly value="<%=ts.getDeadLineDate()%>">
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <label>Выполнено: </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="text" class="form-control" readonly value="<%=ts.getStatus()%>">
                    </div>
                </div>
                <a type="button" class="btn btn-danger btn-sm ms-1 mt-3" data-bs-toggle="modal" data-bs-target="#deleteTask">
                    Удалить задание
                </a>
                <a type="button" class="btn btn-primary btn-sm ms-1 mt-3" data-bs-toggle="modal" data-bs-target="#editTask">
                    Изменить задание
                </a>
                <a href="/home" class="bg-success btn btn-sm mt-3 ms-1">Сохранить задание</a>
                <div class="modal fade" id="editTask" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="/edit-task" method="post">
                                    <input type="hidden" name="task_id" value="<%=ts.getId()%>">
                                    <div class="row">
                                        <div class="col-12">
                                            <label>Наименование:</label>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-12">
                                            <input type="text" class="form-control" name="task_name" value="<%=ts.getName()%>">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <label>Описание:</label>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-12">
                                            <textarea name="task_descr" class="form-control" rows="10"><%=ts.getDescription()%></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <label>Крайний срок:</label>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-12">
                                            <input type="data" class="form-control" name="task_dd" value="<%=ts.getDeadLineDate()%>">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <label>Выполнено:</label>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-12">
                                            <select class="form-select" name="task_status">
                                                <option <%=(ts.getStatus().equals("Да")?"selected":"")%>>Да</option>
                                                <option <%=(ts.getStatus().equals("Нет")?"selected":"")%>>Нет</option>
                                            </select>
                                        </div>
                                    </div>
                                    <button class="btn btn-primary btn-sm mt-5">Сохранить изменения</button>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                            </div>
                    </div>
                 </div>
                </div>
                <div class="modal fade" id="deleteTask" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="/delete" method="post">
                                <input type="hidden" name="id" value="<%=ts.getId()%>">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5">Подтверждение удаления</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h5 class="text-center">Ты уверен?</h5>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Нет</button>
                                <button type="submit" class="btn btn-danger">Да</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>
</body>
</html>
