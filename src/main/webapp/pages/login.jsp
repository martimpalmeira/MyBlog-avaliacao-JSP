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
          src="https://img.freepik.com/free-vector/tablet-login-concept-illustration_114360-7883.jpg?w=2000"
          alt=""
        />
      </div>
      <form action="" method="post">
        <h1>Login</h1>
        <input id="email" name="email" type="text" placeholder="Email" />
        <input id="senha" name="senha" type="password" placeholder="Senha" />
        <button class="login-btn">Entrar</button>
        <p>Não tem uma conta?</p><a href="criarConta.jsp">Criar conta</a>
      </form>
    </div>
  </body>

  <script>

    const loginBtn = document.querySelector('.login-btn');

    loginBtn.addEventListener('click', goToHome)

    function goToHome(event){
        event.preventDefault();
        location.href = "../index.jsp"
    }
    </script>
</html>
