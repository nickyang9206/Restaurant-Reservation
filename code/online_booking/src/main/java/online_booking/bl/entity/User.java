package online_booking.bl.entity;

public class User {
    private int id;
    private String username;
    private int identity;

    public User(int id, String username, int identity) {
        this.id = id;
        this.username = username;
        this.identity = identity;
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

    public int getIdentity() {
        return identity;
    }

    public void setIdentity(int identity) {
        this.identity = identity;
    }
}
