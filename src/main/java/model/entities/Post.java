package model.entities;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

public class Post {

    private List<Comment> comments = new ArrayList<Comment>();

    private Integer id;

    private String title;

    private String content;

    private User user;

    private Date moment;

    public Post() {
    }

    public Post(Integer id, User user, String title, String content, Date moment) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.user = user;
        this.moment = moment;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public List<Comment> getComments() {
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Post post = (Post) o;
        return Objects.equals(id, post.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
