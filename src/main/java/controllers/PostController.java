package controllers;

import model.dao.DaoFactory;
import model.entities.Post;

import java.util.List;

public class PostController {

    public static List<Post> findAllPosts(){
       return DaoFactory.createPostDAO().findAll();
    }
}
