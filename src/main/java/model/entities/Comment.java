package model.entities;

import model.enums.CommentStatus;

import java.util.Date;

public class Comment {

    private Long id;

    private String text;

    private User user;

    private Date moment;

    private CommentStatus commentStatus;

    public Comment() {
    }

    public Comment(Long id, String text, User user, Date moment, CommentStatus commentStatus) {
        this.id = id;
        this.text = text;
        this.user = user;
        this.moment = moment;
        this.commentStatus = commentStatus;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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
}
