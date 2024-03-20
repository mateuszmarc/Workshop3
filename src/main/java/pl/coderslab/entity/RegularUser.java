package pl.coderslab.entity;

public class RegularUser  extends User{
    public RegularUser(String username, String email, String password, String createdAt, int createdBy, boolean notArchived) {
        super(username, email, password, createdAt, createdBy, notArchived);
    }

    public RegularUser(String username, String email, String password, String createdAt, int createdBy, String deletedAt, Integer deletedBy, Integer editedBy, String lastEdit, boolean notArchived) {
        super(username, email, password, createdAt, createdBy, deletedAt, deletedBy, editedBy, lastEdit, notArchived);
    }
}