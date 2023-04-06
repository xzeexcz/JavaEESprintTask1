package kz.sprinttask.db;

public class Tasks {
    private Long id;
    private String name;
    private String description;
    private String deadLineDate;
    private String status;

    public Tasks(Long id, String name, String description, String deadLineDate, String status) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.deadLineDate = deadLineDate;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Tasks() {
    }

    public Tasks(Long id, String name, String description, String deadLineDate) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.deadLineDate = deadLineDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDeadLineDate() {
        return deadLineDate;
    }

    public void setDeadLineDate(String deadLineDate) {
        this.deadLineDate = deadLineDate;
    }
}
