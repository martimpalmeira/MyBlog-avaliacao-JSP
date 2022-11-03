package model.dao;

import model.db.DB;
import model.db.DbException;
import model.entities.Comment;
import model.entities.Post;
import model.enums.CommentStatus;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {

    private Connection con;

    public CommentDAO(Connection con){
        this.con = con;
    }

    public List<Comment> findAll() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Comment> comments = new ArrayList<Comment>();
        try {
            ps = con.prepareStatement("SELECT * FROM tb_comments;");
            rs = ps.executeQuery();
            while (rs.next()) {
                comments.add(new Comment(rs.getInt(1), DaoFactory.createPostDAO().findById(rs.getInt(2)) ,DaoFactory.createUserDAO().
                        findById((rs.getInt(3))), rs.getString(4),
                         rs.getDate(5), CommentStatus.valueOf(rs.getString(6))));
            }
            return comments;
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(ps);
            DB.closeResultSet(rs);
        }
    }

    public void insert(Comment obj) {

        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            ps = con.prepareStatement(
                    "INSERT INTO tb_comments (post_id, user_id, content, moment, commentStatus) VALUE(?,?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, obj.getPost().getId());
            ps.setInt(2, obj.getUser().getId());
            ps.setString(3, obj.getText());
            ps.setDate(4, new java.sql.Date(obj.getMoment().getTime()));
            ps.setString(5, "PENDING");
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int id = rs.getInt(1);
                    obj.setId(id);
                }
            } else {
                throw new DbException("Error: 0 rows affected");
            }
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeResultSet(rs);
            DB.closeStatement(ps);
        }
    }
}
