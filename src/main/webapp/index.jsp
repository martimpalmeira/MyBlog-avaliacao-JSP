<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="controllers.PostController" %>
<%@ page import="model.entities.Post" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style><%@include file="./css/styles.css"%></style>
</head>
<body>

    <header>
        <nav>
            <a href=""><h1>MyBlog</h1></a>
            <a href="#" class="login-btn">Fazer Login</a>
        </nav>   
    </header>

    <main>
        <section>
            <h2>Posts mais recentes</h2>
            <div class="posts-container">
                <%
                   List<Post> posts = PostController.findAllPosts();
                   for(Post post : posts){
                        out.write("<div class='post'>");
                        out.write("<h3>" + post.getTitle() + "</h3>");
                        String contentSubStr = post.getContent().substring(0,16);
                        out.write("<p>" + contentSubStr+"..." + "</p>");
                        out.write("<button class='btn-show-post'>Ver Post completo</button>");
                        out.write("</div>");
                   }
                %>
            </div>
        </section>
    </main>
    





</body>
</html>
