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
                        out.write("<p class='post-content'>" + post.getContent() +"..." + "</p>");
                        out.write("<button class='btn-show-post'>Ver mais</button>");
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

        let arrayPostTexts = [];
        
        postTexts.forEach(postText =>{
            arrayPostTexts.push(postText.textContent);
            postText.innerText = postText.innerText.substring(0,15) + "..."
        })
        
    
        showPostBtns.forEach( btn =>{
            
            btn.addEventListener('click',()=>{
                const postDiv = btn.parentNode;
                const indexPost = Array.prototype.indexOf.call(allPosts, postDiv); 

                if(!postDiv.classList.contains('show-total-text')){            
                postDiv.childNodes[1].innerText = arrayPostTexts[indexPost]
                postDiv.childNodes[2].innerText = "Ver menos";
                postDiv.classList.add('show-total-text');
                }else{
                    postDiv.childNodes[1].innerText = arrayPostTexts[indexPost].substring(0,15) + "...";
                    postDiv.classList.remove('show-total-text');
                    postDiv.childNodes[2].innerText = "Ver mais";
                }

                
            })
        }
        )

        
    </script>


</body>
</html>
