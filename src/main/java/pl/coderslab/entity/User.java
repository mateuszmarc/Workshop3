package pl.coderslab.entity;

public class User {
    private String username;
    private String email;
    private String password;
    private String createdAt= null;
    private int createdBy;
    private String deletedAt = null;
    private Integer deletedBy = null;
    private Integer editedBy = null;
    private String lastEdit = null;
    private boolean notArchived = true;

    public User(String username, String email, String password, String createdAt, int createdBy, boolean notArchived) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.createdAt = createdAt;
        this.createdBy = createdBy;
        this.notArchived = notArchived;
    }

    public User(String username, String email, String password, String createdAt, int createdBy, String deletedAt, Integer deletedBy, Integer editedBy, String lastEdit, boolean notArchived) {
        this(username, email, password, createdAt, createdBy, notArchived);
        this.deletedAt = deletedAt;
        this.deletedBy = deletedBy;
        this.editedBy = editedBy;
        this.lastEdit = lastEdit;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public String getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(String deletedAt) {
        this.deletedAt = deletedAt;
    }

    public Integer getDeletedBy() {
        return deletedBy;
    }

    public void setDeletedBy(Integer deletedBy) {
        this.deletedBy = deletedBy;
    }

    public Integer getEditedBy() {
        return editedBy;
    }

    public void setEditedBy(Integer editedBy) {
        this.editedBy = editedBy;
    }

    public String getLastEdit() {
        return lastEdit;
    }

    public void setLastEdit(String lastEdit) {
        this.lastEdit = lastEdit;
    }

    public boolean isNotArchived() {
        return notArchived;
    }

    public void setNotArchived(boolean notArchived) {
        this.notArchived = notArchived;
    }
}
