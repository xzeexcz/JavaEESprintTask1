package kz.sprinttask.db;

import java.util.ArrayList;
import java.util.Iterator;

public class DBManager {
    private static Long id = 6L;
    private static ArrayList<Tasks> tasks = new ArrayList<>();

    static {
    tasks.add(new Tasks(    1L,
                         "Создать Веб приложение на JAVA EE",
                     "Посмотреть видеоролики и выполнить практику закрепив тему выполнением Sprint Task'a."  ,
                   "23-10-2021",
                         "Да"));
    tasks.add(new Tasks(2L,
            "Убраться дома и закупить продукты",
            "Надо сделать, а то выселят из хаты)))"  ,
            "25-10-2021",
            "Да"));
    tasks.add(new Tasks(3L,
            "Выполнить все домашние задания",
            "Конечно, не все. Но, главное битлабовскую сделать, остальные не в приоритете))"  ,
            "28-10-2021",
            "Нет"));
    tasks.add(new Tasks(4L,
            "Записаться на качку",
            "Емаё, я же дрыщ. Внатуре надо, иначе как я буду клеить девушек? Хотя.. на какие деньги записаться.. Заработать надо сперва. "  ,
            "12-12-2021",
            "Нет"));
    tasks.add(new Tasks(5L,
            "Учить испанский",
            "Это маст хев, чтобы знать все кричалки Барселоны. FORCA BARCA, Ильяс агай. В Мадриде -12. Хотя, последнее классико 4:0 на Ноу Камп - позор. Не было у нас Дембеле, Педри, Кристенсена. Алонсо мешок"  ,
            "01-05-2021" ,
            "Нет"));
    }
    public static void addTask(Tasks task) {
        task.setId(id);
        tasks.add(task);
        id++;
    }
    public static Tasks getTask(Long id) {
        for(Tasks tas : tasks) {
            if(tas.getId() == id) {
                return tas;
            }
        }
        return null;
    }
    public static ArrayList<Tasks> getTasks() {
        return tasks;
    }
//    public static void deleteTask(Long id) {
//                tasks.remove(id);
//    }
//    public static void deleteTask_v2(Long id) {
//        for(Iterator<Tasks> iterator = tasks.iterator(); iterator.hasNext();) {
//            Tasks task = iterator.next();
//            if(task.getId().equals(id)){
//                iterator.remove();
//                break;
//            }
//        }
//    }
    public static void editTask(Tasks task) {
        for(int i = 0; i < tasks.size(); i++) {
            if(tasks.get(i).getId() == task.getId()) {
                tasks.set(i, task);
                break;
            }
        }
    }
    public static void deleteTask(Long id) {
        for(int i = 0; i < tasks.size(); i++) {
            if(tasks.get(i).getId() == id) {
                tasks.remove(i);
                break;
            }
        }
    }
}
