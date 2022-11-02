package controllers;

import model.dao.DaoFactory;
import model.entities.User;

import java.util.List;

public class UserController {

    public static List<User> getAllUsers(){
        return DaoFactory.createUserDAO().findAll();
    }

    public static User getUserById(Integer id){
       return DaoFactory.createUserDAO().findById(id);
    }


}
