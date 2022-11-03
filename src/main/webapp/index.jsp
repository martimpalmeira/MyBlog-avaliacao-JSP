<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="controllers.PostController" %>
<%@ page import="controllers.CommentController" %>
<%@ page import="model.entities.Post" %>
<%@ page import="model.entities.Comment" %>
<%@ page import="model.entities.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

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

            <div>
                <a href="./pages/solicitacoes.jsp">Solicitações ao moderador</a>
                <a href="./pages/login.jsp" class="login-btn">Fazer Login</a>
            </div>
            
            
        </nav>   
    </header>

    <main>
        <section>
            <h2>Posts mais recentes</h2>
            <div class="posts-container">
                <%

                   List<Post> posts = PostController.findAllPosts();
                   List<Comment> comments = CommentController.findAllComments();
                   SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                   User user = new User();
                   

                   for(Post post : posts){
                        out.write("<div class='post'>");
                            out.write("<h3>" + post.getTitle() + "</h3>");
                            out.write("<p class='post-content'>" + post.getContent() +"..." + "</p>");
                            out.write("<button class='btn-show-post'>Ver mais</button>");
                            out.write("<div class='comentarios-container'>Comentários:");
                             for(Comment comment : comments){
                                if(comment.getPost().equals(post)  && comment.getCommentStatus().name().equals("APPROVED")){
                                 out.write("<div class='comment'>");
                                    out.write("<p><span class='comment-user-name'>"+comment.getUser().getName() + ":</span> " + comment.getText()+"</p>");
                                    out.write("<p class='comment-date'>"+ sdf.format(comment.getMoment())+"</p>");
                                 out.write("</div>");
                                }
                             }
                            out.write("</div>");
                            out.write("<form class='form-comentar' action='index.jsp' method='post' >");
                            out.write("<input class='input-comentar' id='text' name='content' type='text' placeholder='Seu comentário'>");
                            out.write("<button class='btn-send-comment'>Enviar comentário</button>");
                            out.write("</form>");
                        out.write("</div>");
                   }
                %>
            </div>
        </section>
    </main>
    

    
    <script>

        

        const showPostBtns = document.querySelectorAll('.btn-show-post');
        const postTexts = document.querySelectorAll('.post-content');
        const allPosts = document.querySelectorAll('.post');
        const formComentar = document.querySelectorAll('.form-comentar');
        const btnSendComments = document.querySelectorAll('.btn-send-comment');


        let arrayPostTexts = [];
        
        postTexts.forEach(postText =>{
            arrayPostTexts.push(postText.textContent);
            postText.innerText = postText.innerText.substring(0,15) + "..."

        })

        btnSendComments.forEach(btn =>{
            btn.addEventListener('click', handleBtnSendComment)
        })

        function handleBtnSendComment(event){
            event.preventDefault();
            <%




            %>

        }
        
    
        showPostBtns.forEach( btn =>{
            
            btn.addEventListener('click',()=>{
                const postDiv = btn.parentNode;
                const indexPost = Array.prototype.indexOf.call(allPosts, postDiv); 

                if(!postDiv.classList.contains('show-total-text')){            
                    postDiv.childNodes[1].innerText = arrayPostTexts[indexPost]
                    postDiv.childNodes[2].innerText = "Ver menos";
                    postDiv.childNodes[3].classList.add('show-comentarios-container')
                    postDiv.childNodes[4].classList.add('show-form-comentar')
                    postDiv.classList.add('show-total-text');
                    
                }else{
                    postDiv.childNodes[1].innerText = arrayPostTexts[indexPost].substring(0,15) + "...";
                    postDiv.classList.remove('show-total-text');
                    postDiv.childNodes[2].innerText = "Ver mais";
                    postDiv.childNodes[3].classList.remove('show-comentarios-container')
                    postDiv.childNodes[4].classList.remove('show-form-comentar')
                    
                    
                }

                
            })
        }
        )

        
    </script>


</body>
</html>
