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

        <% List<Asignatura> asignaturaImpartidas = (List<Asignatura>) request.getAttribute("ASIGNATURAS IMPARTIDAS"); %>

        <div><%@include file = "barraSuperiorProf.jsp" %> </div>
        
        
        <div class="principal">
            <% int asignaturaCount = 0; %>
            <% for (Asignatura asignatura : asignaturaImpartidas) { %>
                <div class="asignatura-div">
                    <a href="<%= request.getContextPath() %>/infoAsignaturaProfesor?titulacion=<%=asignatura.getTitulacion()%>&asignatura=<%=asignatura.getNombre()%>&fecha=<%=asignatura.getFecha()%>&id=<%=asignatura.getId()%>">
                        <h2><%= asignatura.getNombre() %></h2>
                        <p><strong>Titulacion:</strong> <%= asignatura.getTitulacion() %></p>
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

        .principal{       
            width: 100%;
            margin-left: 16%;
            margin-top: 45%;
        } 
    </style>
</html>