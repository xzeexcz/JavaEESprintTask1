<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="/add-task" method="get">
  <input type="hidden" name="task_status" value="Нет">
  <div class="row">
    <div class="col-12">
      <label>Наименование:</label>
     </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <input type="text" class="form-control" name="task_name" placeholder="Наименование...">
    </div>
  </div>
  <div class="row">
    <div class="col-12">
      <label>Описание:</label>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <textarea name="task_descr" class="form-control" rows="5" placeholder="Описание..."></textarea>
    </div>
  </div>
  <div class="row">
    <div class="col-12">
      <label>Крайний срок:</label>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <input type="date" class="form-control" name="task_dd">
    </div>
  </div>
  <button class="btn btn-primary btn-sm mt-5">+ Добавить задание</button>
</form>