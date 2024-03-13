package pl.coderslab.entity;

public class User {
    private int id;
    private String username;
    private String password;
    private String email;

    public User(String name, String email, String password) {
        this.id = 0;
        setUsername(name);
        setEmail(email);
        setPassword(password);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return getClass().getSimpleName() + " {Id: " + id + ", name: " + this.username + ", email: " + this.email + ", password: " + this.password + "}";
    }

}