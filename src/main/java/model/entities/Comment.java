package model.entities;

import model.enums.CommentStatus;

import java.util.Date;
import java.util.Objects;

public class Comment {

    private Integer id;

    private String text;

    private Post post;
    private User user;

    private Date moment;

    private CommentStatus commentStatus;

    public Comment() {
    }

    public Comment(Integer id, Post post, User user, String text, Date moment, CommentStatus commentStatus) {
        this.id = id;
        this.text = text;
        this.post = post;
        this.user = user;
        this.moment = moment;
        this.commentStatus = commentStatus;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
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

    public CommentStatus getCommentStatus() {
        return commentStatus;
    }

    public void setCommentStatus(CommentStatus commentStatus) {
        this.commentStatus = commentStatus;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", post=" + post +
                ", user=" + user +
                ", moment=" + moment +
                ", commentStatus=" + commentStatus +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Comment comment = (Comment) o;
        return id.equals(comment.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
