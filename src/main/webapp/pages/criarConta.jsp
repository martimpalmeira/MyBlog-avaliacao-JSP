<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <style>
      <%@include file="../css/login.css"%>
    </style>
  </head>
  <body>
    <div class="form-container">
      <div class="img-container">
        <img
          src="https://img.freepik.com/free-vector/sign-up-concept-illustration_114360-7885.jpg?w=360"
          alt=""
        />
      </div>
      <form action="criarConta.jsp" method="post">
        <h1>Criar conta</h1>
        <input id="nome" name="nome" type="text" placeholder="Nome" />
        <input id="email" name="email" type="text" placeholder="Email" />
        <input id="senha" name="senha" type="password" placeholder="Senha" />
        <button class="login-btn">Criar conta</button>
      </form>
      

    </div>
  </body>
  <script>
    const loginBtn = document.querySelector(".login-btn");

    loginBtn.addEventListener("click", goToHome);

    function goToHome(event) {

      <%
      String usuario = request.getParameter("nome");
      String email = request.getParameter("email");
      String senha = request.getParameter("senha");
       if((usuario != null) && (senha != null) && !(usuario.isEmpty())
                         && !(senha.isEmpty()) ){
                   //crie a seção
                   session.setAttribute("usuario", usuario);
                   response.sendRedirect("./login.jsp");

                 }
      %>


    }
  </script>
</html>
