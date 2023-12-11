<%@ page language='java' contentType='text/html;charset=utf-8'%>
<%@ page import='java.util.List'%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title> AMIUP: Inicio de Sesion </title>
        <link href="<%= request.getContextPath() %>/VISUAL/inicioSesion.css" rel="stylesheet" type="text/css">
        <link href="<%= request.getContextPath() %>/VISUAL/inicio.css" rel="stylesheet" type="text/css">
        <link href="<%= request.getContextPath() %>/VISUAL/barraSuperior.css" rel="stylesheet" type="text/css">
    </head>
    <body>

        <div><%@include file = "barraSuperior.jsp" %> </div>

        <section>
            <div class="cuadroPrincipal">
                <h2>Inicio de Sesion</h2>
                <form action="inicioSesion" method="post">
                    <div class="insertDatos">
                        <input type="text" placeholder="Nombre de Usuario" name="userName" required>
                    </div>
                    <div class="insertDatos">
                        <input type="password" placeholder="Contraseña" name="clave" required>
                    </div>
                    <div class="insertDatos">
                        <input type="submit" value="Iniciar Sesion" id="btnInicioSesion">
                    </div>
                </form>
            </div>
        </section>
    </body>
</html>