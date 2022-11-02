package model.dao;

import model.db.DB;
import model.db.DbException;
import model.entities.Post;
import model.entities.User;
import model.enums.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {

    private Connection con;

    public PostDAO(Connection con){
        this.con = con;
    }

    public List<Post> findAll() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Post> posts = new ArrayList<Post>();
        try {
            ps = con.prepareStatement("SELECT * FROM tb_posts ORDER BY moment DESC LIMIT 10;");
            rs = ps.executeQuery();
            while (rs.next()) {
                posts.add(new Post(rs.getLong(1), DaoFactory.createUserDAO().
                        findById((rs.getInt(2))), rs.getString(3),
                        rs.getString(4), rs.getDate(5)));
            }
            return posts;
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(ps);
            DB.closeResultSet(rs);
        }
    }
}
