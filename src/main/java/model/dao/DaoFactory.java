package model.dao;

import model.db.DB;

public class DaoFactory {

    public static UserDAO createUserDAO() {
        return new UserDAO(DB.getConnection());
    }

    public static PostDAO createPostDAO(){
        return new PostDAO(DB.getConnection());
    }

    public static CommentDAO createCommentDAO(){
        return new CommentDAO(DB.getConnection());
    }

}
