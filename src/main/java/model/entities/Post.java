package model.entities;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Post {

    private static List<Comment> comments = new ArrayList<Comment>();

    private Long id;

    private String title;

    private String content;

    private User user;

    private Date moment;

    public Post() {
    }

    public Post(Long id, User user, String title, String content, Date moment) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.user = user;
        this.moment = moment;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getMoment() {
        return moment;
    }

    public void setMoment(Date moment) {
        this.moment = moment;
    }

    public static List<Comment> getComments() {
        return new ArrayList<Comment>(comments);
    }

    public void addComment(Comment comment){
        comments.add(comment);
    }

    public void removeComment(Comment comment){
        comments.remove(comment);
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", user=" + user +
                ", moment=" + moment +
                "}";
    }
}
