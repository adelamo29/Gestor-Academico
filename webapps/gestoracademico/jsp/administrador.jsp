<%@ page language='java' contentType='text/html;charset=utf-8'%>
<%@ page import='java.util.List'%>

<%@ page import='gestoracademico.Usuario' %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title> AMIUP: Inicio de Sesion </title>
        <link href="<%= request.getContextPath() %>/VISUAL/inicio.css" rel="stylesheet" type="text/css">
        <link href="<%= request.getContextPath() %>/VISUAL/barraSuperior.css" rel="stylesheet" type="text/css">
    </head>
    <body>

        <% Usuario usuario = new Usuario();
        usuario= (Usuario)session.getAttribute("Usuario"); %>

        <div><%@include file = "barraSuperiorEst.jsp" %> </div>

        
    </body>
</html>