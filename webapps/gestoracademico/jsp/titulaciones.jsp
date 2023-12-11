<%@ page language='java' contentType='text/html;charset=utf-8'%>
<%@ page import='java.util.List'%>

<%@ page import='gestoracademico.Usuario' %>
<%@ page import='gestoracademico.Asignatura' %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title> AMIUP: Asignaturas </title>
        <link href="<%= request.getContextPath() %>/VISUAL/inicio.css" rel="stylesheet" type="text/css">
        <link href="<%= request.getContextPath() %>/VISUAL/barraSuperior.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/VISUAL/profesor.css">
    </head>
    <body>

        <% Usuario usuario = new Usuario();
        usuario= (Usuario)session.getAttribute("Usuario"); %>

        <% List<Asignatura> titulaciones = (List<Asignatura>) request.getAttribute("TITULACIONES"); %>

        <div><%@include file = "barraSuperiorProf.jsp" %> </div>
        
        
        <div class="principalTitulaciones">
            <% int asignaturaCount = 0; %>
            <% for (Asignatura titulacion : titulaciones) { %>
                <div class="asignatura-div">
                    <a href="<%= request.getContextPath() %>/infoTitulacion?id=<%=titulacion.getId()%>&nombre=<%=titulacion.getNombre()%>">
                        <h2><%= titulacion.getNombre() %></h2>
                    </a>
                </div>
                <% asignaturaCount++; %>
                <% if (asignaturaCount % 3 == 0) { %>
                    <br> 
                <% } %>
            <% } %>
        </div>


            
        
    </body>
    <style>
        .container {
            text-align: center;
            padding: 20px;
        }

        .asignaturas-container {
            text-align: center;
        }

        .asignatura-div {
            display: inline-block;
            text-align: center;
            margin: 10px;
            padding: 10px;
            padding-top: 20px;
            border: 1px solid #ccc;
            width: 22%; 
            height: 150px;
            background-color: #f9f9f9;
            color: #333;
        }

        .principalTitulaciones{       
            width: 100%;
            margin-left: 16%;
            margin-top: 5%;
        } 
    </style>
</html>