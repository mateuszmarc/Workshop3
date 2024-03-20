package pl.coderslab.entity;

public class Admin extends User {
    public Admin(String username, String email, String password, String createdAt, int createdBy, boolean notArchived) {
        super(username, email, password, createdAt, createdBy, notArchived);
    }

    public Admin(String username, String email, String password, String createdAt, int createdBy, String deletedAt, Integer deletedBy, Integer editedBy, String lastEdit, boolean notArchived) {
        super(username, email, password, createdAt, createdBy, deletedAt, deletedBy, editedBy, lastEdit, notArchived);
    }
}
