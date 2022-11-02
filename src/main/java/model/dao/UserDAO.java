package model.dao;

import model.db.DB;
import model.db.DbException;
import model.entities.User;
import model.enums.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private Connection con;

    public UserDAO(Connection con){
        this.con = con;
    }

    public List<User> findAll() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<User> users = new ArrayList<User>();
        try {
            ps = con.prepareStatement("SELECT * FROM tb_users");
            rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getLong(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), Role.valueOf(rs.getString(5))));
            }
            return users;
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(ps);
            DB.closeResultSet(rs);
        }
    }

    public User findById(Integer id) {
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = con.prepareStatement("SELECT * FROM tb_users WHERE Id = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getLong(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), Role.valueOf(rs.getString(5)));
            }

            return null;

        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(ps);
            DB.closeResultSet(rs);
        }
    }
}
