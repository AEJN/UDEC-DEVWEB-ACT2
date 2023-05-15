<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>CRUD JSP/JAVA</title>
    
<style type="text/css">

body {
background-color: #eaf4ff;
}

/* Estilos para el recuadro */
.recuadro {
border: 2px solid #45c9ff;
padding: 20px;
border-radius: 10px;
text-align: center;
width: 400px;
margin: 0 auto;
background-color: #ffffff;
box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
}

/* Estilos para el título */
h1 {
font-family: Arial, sans-serif;
font-size: 28px;
margin-bottom: 20px;
color: #00b9ff;
}

/* Estilos para los botones */
button {
font-family: Arial, sans-serif;
font-size: 16px;
background-color: #45c9ff;
border: 2px solid #45c9ff;
padding: 10px 20px;
border-radius: 5px;
margin-right: 10px;
color: #ffffff;
}

button:hover {
background-color: #00b9ff;
}

/* Estilos para el botón de registro */
#btn-registro {
background-color: #00b9ff;
border-color: #00b9ff;
}

#btn-registro:hover {
background-color: #45c9ff;
}

/* Estilos para el botón de inicio de sesión */
#btn-login {
background-color: #b1ddff;
border-color: #b1ddff;
}

#btn-login:hover {
background-color: #45c9ff;
}

/* Estilos para centrar el recuadro */
.container {
display: flex;
justify-content: center;
align-items: center;
height: 100vh;
}

</style>
</head>
<body>
    
<div class="container">
    
    <div class="recuadro">
<h1>Bienvenido al CRUD del ejercicio "15. Empleos" realizado por: Adrian Jadid</h1>
  <button id="btn-registro" onclick="window.location.href='${pageContext.request.contextPath}/vistas/usuarios/registrar.jsp'" >Registrarse</button>
  <button id="btn-login"  onclick="window.location.href='${pageContext.request.contextPath}/vistas/usuarios/login.jsp'" >Iniciar sesión</button>
</div>
</div>

</html>
