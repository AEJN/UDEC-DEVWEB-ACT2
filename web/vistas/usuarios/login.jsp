<%@ page import="java.sql.*" %>
<%
// Establecer conexión con la base de datos
String url = "jdbc:mysql://localhost:3306/bd crud";
String user = "root";
String password = "";
Connection conn = null;
try {
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
} catch (ClassNotFoundException e) {
out.println("Error: no se encontró el driver de MySQL.");
} catch (SQLException e) {
out.println("Error: no se pudo conectar con la base de datos.");
}

// Verificar si el formulario ha sido enviado
if (request.getMethod().equals("POST")) {
// Recibir los datos del formulario
String cc = request.getParameter("cc");
String pass = request.getParameter("pass");

// Validar que los campos no estén vacíos
if (cc.isEmpty() || pass.isEmpty()) {
    out.println("Por favor complete todos los campos.");
} else {
    // Crear consulta SQL para verificar usuario
    String sql = "SELECT * FROM Usuarios WHERE cc=? AND pass=?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, cc);
    stmt.setString(2, pass);

    // Ejecutar consulta SQL
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
        // Inicio de sesión exitoso, redirigir a EmpleoCrud.jsp
        response.sendRedirect("http://localhost:3000/co.edu.udec.act1.AdrianJadid.modelo.crud/EmpleoCrud.jsp");
        return;
    } else {
        out.println("Cédula o contraseña incorrecta.");
    }
}
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Iniciar sesión</title>
    <style>
        /* Estilos para el recuadro */
        body {
            background-color: #eaf4ff; /* Cambiar color de fondo de la página */
        }
            .login-box {
        font-family: Arial, sans-serif;
        width: 300px;
        margin: 0 auto;
        margin-top: 50vh;
        transform: translateY(-50%);
        padding: 20px;
        background-color: #ffffff; /* Cambiar color de fondo del recuadro a blanco */
        text-align: center;
        border: 1px solid #00b9ff;
        border-radius: 5px; /* Borde redondeado */
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* Sombra */
    }

    .login-box h1 {
        font-family: Arial, sans-serif;
        margin-top: 0;
        color: #00b9ff;
    }

    .login-box label {
        font-family: Arial, sans-serif;
        display: block;
        margin-bottom: 10px;
        color: #45c9ff;
    }

    .login-box input {
        font-family: Arial, sans-serif;
        width: 50%;
        padding: 10px;
        margin-bottom: 20px;
        color: #b1ddff;
        border: 1px solid #45c9ff; /* Cambiar color del borde a #45c9ff */
        border-radius: 5px;
        box-shadow: 0 0 2px rgba(0, 0, 0, 0.1);
    }

    .login-box input[type="submit"] {
       
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
        
        </style>
<div class="login-box">
    <h1>Iniciar sesión</h1>
    <form method="post" action="${pageContext.request.contextPath}/login.jsp">
        <label>CC:</label>
        <input type="text" name="cc"><br>
        <label>Contraseña:</label>
        <input type="password" name="pass"><br>
        <input type="submit" value="Iniciar sesión">
    </form>
</div>