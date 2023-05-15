<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="co.edu.udec.devweb.activdad2.adrianjadid.modelo.BD" %>

<%
// Verificar si el formulario ha sido enviado
if ("POST".equals(request.getMethod())) {
    // Recibir los datos del formulario
    String cc = request.getParameter("cc");
    String pass = request.getParameter("pass");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String genero = request.getParameter("genero");
    String email = request.getParameter("email");

    // Validar que los campos no estén vacíos
    if (cc.isEmpty() || pass.isEmpty() || nombre.isEmpty() || apellido.isEmpty() || genero.isEmpty() || email.isEmpty()) {
        out.println("Por favor complete todos los campos.");
    } else {
        // Crear conexión a la base de datos
        BD bd = new BD();
        Connection conn = bd.conectar();

        if (conn != null) {
            // Crear consulta SQL para insertar nuevo usuario
            String sql = "INSERT INTO Usuarios (cc, pass, nombre, apellido, genero, email) VALUES (?, ?, ?, ?, ?, ?)";

            try {
                // Preparar y ejecutar consulta SQL
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, cc);
                stmt.setString(2, pass);
                stmt.setString(3, nombre);
                stmt.setString(4, apellido);
                stmt.setString(5, genero);
                stmt.setString(6, email);
                stmt.executeUpdate();

                out.println("Usuario registrado exitosamente.");
            } catch (SQLException e) {
                out.println("Error: " + e.getMessage());
            } finally {
                // Cerrar conexión a la base de datos
                bd.cerrarConexion(conn);
            }
        } else {
            out.println("Error: No se pudo conectar a la base de datos.");
        }
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Registro de usuario</title>
    <style>
        /* Estilos para centrar el formulario */
        body {
            font-family: Arial, sans-serif;
            background-color: #eaf4ff; /* Cambiar color de fondo de la página a #eaf4ff */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            font-family: Arial, sans-serif;
            background-color: #ffffff; /* Cambiar color de fondo del formulario a #ffffff */
            padding: 20px;
            text-align: center;
            border: 1px solid #00b9ff;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        .form-container h1 {
            font-family: Arial, sans-serif;
            margin-top: 0;
            color: #00b9ff;
        }

        .form-container label {
            font-family: Arial, sans-serif;
            display: block;
            margin-bottom: 10px;
            color: #45c9ff;
        }

        .form-container input, .form-container select {
            font-family: Arial, sans-serif;
            width: 100%;
            padding: 5px;
            margin-bottom: 20px;
            color: #b1ddff;
            border: 1px solid #45c9ff;
            border-radius: 5px;
            box-shadow: 0 0 2px rgba(0, 0, 0, 0.1);
        }

        .form-container input[type="submit"] {
            font-family: Arial, sans-serif;
            width: auto;
            color: #eaf4ff;
            background-color: #00b9ff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            box-shadow: 0 0 2px rgba(0, 0, 0, 0.1);
        }

        .form-container a {
            font-family: Arial, sans-serif;
            color: #00b9ff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Registro de usuario</h1>
        <form method="post" action="${pageContext.request.contextPath}/registro">
          <label class="color2">CC:</label>
            <input type="text" name="cc"><br>
            <label class="color2">Contraseña:</label>
            <input type="password" name="pass"><br>
            <label class="color2">Nombre:</label>
            <input type="text" name="nombre"><br>
            <label class="color2">Apellido:</label>
            <input type="text" name="apellido"><br>
            <label class="color2">Género:</label>
            <select name="genero">
                <option value="M" class="color3">Masculino</option>
                <option value="F" class="color3">Femenino</option>
            </select><br> 
            <label class="color2">Email:</label>
            <input type="email" name="email"><br>
            <input type="submit" value="Registrar" class="color5">
        </form>
        <a href="${pageContext.request.contextPath}/vistas/usuarios/login.jsp" class="color1">¿Ya tienes una cuenta? Inicia sesión aquí</a>
    </div>

</body>
</html>
