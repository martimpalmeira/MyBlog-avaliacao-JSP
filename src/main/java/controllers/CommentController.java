package controllers;

import model.dao.DaoFactory;
import model.entities.Comment;

import java.util.List;

public class CommentController {

    public static List<Comment> findAllComments(){
        return DaoFactory.createCommentDAO().findAll();
    }

    public static void insertComment(Comment comment){
        DaoFactory.createCommentDAO().insert(comment);
    }


}
