<%@ page import="controllers.CommentController" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.entities.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Página do moderador</title>
    <style><%@include file="../css/solicitacoes.css"%></style>
  </head>
  <body>
    <%
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    List<Comment> comments = CommentController.findAllComments();
    for(Comment comment : comments){

          out.write("<div class='comment'>");
          out.write("<p><span class='comment-user-name'>"+comment.getUser().getName() + ":</span> " + comment.getText()+"</p>");
          out.write("<p class='comment-date'>"+ sdf.format(comment.getMoment())+"</p>");
          out.write("" + comment.getCommentStatus().name());
          out.write("<div>");
          out.write("<button>Alterar Status</button>");
          out.write("<button>Excluir</button>");
          out.write("</div>");
          out.write("</div>");

    }
    %>
  </body>
</html>

