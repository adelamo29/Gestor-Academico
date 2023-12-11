<%@ page language='java' contentType='text/html;charset=utf-8'%>
<%@ page import='java.util.List'%>

<%@ page import='gestoracademico.Usuario' %>
<%@ page import='gestoracademico.Asignatura' %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title> AMIUP: Gestor </title>
        <link href="<%= request.getContextPath() %>/VISUAL/inicio.css" rel="stylesheet" type="text/css">
        <link href="<%= request.getContextPath() %>/VISUAL/barraSuperior.css" rel="stylesheet" type="text/css">
       
    </head>
    <body>

        <% Usuario usuario = new Usuario();
        usuario= (Usuario)session.getAttribute("Usuario"); %>

        

        <div><%@include file = "barraSuperiorProf.jsp" %> </div>

        <div class="padre">
            <div class="hijo">
              <div class="opciones">
                <a href="<%= request.getContextPath() %>/profesor">
                    <h2>Asignaturas</h2>
                </a>
              </div>
              <div class="opciones">
                <a href="<%= request.getContextPath() %>/titulaciones">
                    <h2>Titulaciones</h2>
                </a>
              </div>
            </div>
        </div>
        
    </body>

    <style>
       .padre {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .hijo {
            display: flex;
        }

        .opciones {
            width: 400px;
            height: 200px;
            background-color:  #f9f9f9;
            margin-right: 20px; 
        }

        .opciones a{
            margin: 14%;
            padding: 5%;
        }

        
    </style>
   
</html>