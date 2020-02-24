package model;

public class UserInfo {
    private User user;
    private UserDetailed userDetailed;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserDetailed getUserDetailed() {
        return userDetailed;
    }

    public void setUserDetailed(UserDetailed userDetailed) {
        this.userDetailed = userDetailed;
    }

    public UserInfo(User user, UserDetailed userDetailed) {
        this.user = user;
        this.userDetailed = userDetailed;
    }

    public UserInfo() {
    }

    @Override
    public String toString() {
        return "UserInfo{" + "user=" + user + ", userDetailed=" + userDetailed + '}';
    }
}
