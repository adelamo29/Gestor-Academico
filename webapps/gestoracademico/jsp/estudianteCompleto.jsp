<%@ page language='java' contentType='text/html;charset=utf-8'%>
<%@ page import='java.util.List'%>

<%@ page import='gestoracademico.Usuario' %>
<%@ page import='gestoracademico.Asignatura' %>

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
        usuario= (Usuario)session.getAttribute("Usuario");  %>

        <div><%@include file = "barraSuperiorEstComp.jsp" %> </div>

        <% List<Asignatura> asignaturasUsuario11 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 11"); %>
        <% List<Asignatura> asignaturasUsuario12 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 12"); %>
        <% List<Asignatura> asignaturasUsuario21 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 21"); %>
        <% List<Asignatura> asignaturasUsuario22 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 22"); %>
        <% List<Asignatura> asignaturasUsuario31 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 31"); %>
        <% List<Asignatura> asignaturasUsuario32 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 32"); %>
        <% List<Asignatura> asignaturasUsuario41 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 41"); %>
        <% List<Asignatura> asignaturasUsuario42 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 42"); %>

        <div class="principal">
            <div class="padre">
                <h2> Primer Curso </h2>
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario11) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <div class="asignatura" style="background-color: rgb(65, 179, 228)">
                                <%= asignatura.getNombre() %><br>
                            </div>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <div class="asignatura" style="background-color: rgb(74, 91, 224)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <div class="asignatura" style="background-color: rgb(224, 164, 74)"><%= asignatura.getNombre() %><br></div>
                        <%}else{%>
                            <div class="asignatura" style="background-color: rgb(135, 60, 30)"><%= asignatura.getNombre() %><br></div>
                        <%} %>  
                    <% } %> 
                </div>
                
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario12) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <div class="asignatura" style="background-color: rgb(65, 179, 228)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <div class="asignatura" style="background-color: rgb(74, 91, 224)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <div class="asignatura" style="background-color: rgb(224, 164, 74)"><%= asignatura.getNombre() %><br></div>
                        <%}else{%>
                            <div class="asignatura" style="background-color: rgb(135, 60, 30)">
                                <%= asignatura.getNombre() %><br>
                                <div class="nota">Hola soy dueño </div>
                            
                            </div>
                        <%} %> 
                    <% } %> 
                </div>
                
            </div>
            <div class="padre">
                <h2> Segundo Curso </h2>
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario21) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <div class="asignatura" style="background-color: rgb(65, 179, 228)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <div class="asignatura" style="background-color: rgb(74, 91, 224)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <div class="asignatura" style="background-color: rgb(224, 164, 74)"><%= asignatura.getNombre() %><br></div>
                        <%}else{%>
                            <div class="asignatura" style="background-color: rgb(135, 60, 30)"><%= asignatura.getNombre() %><br></div>
                        <%} %> 
                    <% } %> 
                </div>
                
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario22) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <div class="asignatura" style="background-color: rgb(65, 179, 228)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <div class="asignatura" style="background-color: rgb(74, 91, 224)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <div class="asignatura" style="background-color: rgb(224, 164, 74)"><%= asignatura.getNombre() %><br></div>
                        <%}else{%>
                            <div class="asignatura" style="background-color: rgb(135, 60, 30)"><%= asignatura.getNombre() %><br></div>
                        <%} %> 
                    <% } %> 
                </div>
                
            </div>
            <div class="padre">
                <h2> Tercer Curso </h2>
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario31) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <div class="asignatura" style="background-color: rgb(65, 179, 228)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <div class="asignatura" style="background-color: rgb(74, 91, 224)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <div class="asignatura" style="background-color: rgb(224, 164, 74)"><%= asignatura.getNombre() %><br></div>
                        <%}else{%>
                            <div class="asignatura" style="background-color: rgb(135, 60, 30)"><%= asignatura.getNombre() %><br></div>
                        <%} %> 
                    <% } %> 
                </div>
                
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario32) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <div class="asignatura" style="background-color: rgb(65, 179, 228)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <div class="asignatura" style="background-color: rgb(74, 91, 224)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <div class="asignatura" style="background-color: rgb(224, 164, 74)"><%= asignatura.getNombre() %><br></div>
                        <%}else{%>
                            <div class="asignatura" style="background-color: rgb(135, 60, 30)"><%= asignatura.getNombre() %><br></div>
                        <%} %> 
                    <% } %> 
                </div>
                
            </div>
            <div class="padre">
                <h2> Cuarto Curso </h2>
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario41) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <div class="asignatura" style="background-color: rgb(65, 179, 228)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <div class="asignatura" style="background-color: rgb(74, 91, 224)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <div class="asignatura" style="background-color: rgb(224, 164, 74)"><%= asignatura.getNombre() %><br></div>
                        <%}else{%>
                            <div class="asignatura" style="background-color: rgb(135, 60, 30)"><%= asignatura.getNombre() %><br></div>
                        <%} %> 
                    <% } %> 
                </div>
                
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario42) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <div class="asignatura" style="background-color: rgb(65, 179, 228)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <div class="asignatura" style="background-color: rgb(74, 91, 224)"><%= asignatura.getNombre() %><br></div>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <div class="asignatura" style="background-color: rgb(224, 164, 74)"><%= asignatura.getNombre() %><br></div>
                        <%}else{%>
                            <div class="asignatura" style="background-color: rgb(135, 60, 30)"><%= asignatura.getNombre() %><br></div>
                        <%} %> 
                    <% } %> 
                </div>
                
            </div>
        </div>

    </body>
    
</html>



<style>
    .principal{
        display: flex;
        flex-direction: row;       
        width: 100%;
        margin-left: 10px;
    } 
    .padre{
        position: relative;
        display: flex;
        margin-top:60px;
        width: 25%;
    } 

    .principal .padre h2{
        position: absolute;
        text-align: center;
        margin-top: 10px;
        margin-left: 190px;
        color: white;
    } 
       
    .hijo{
        display: flex;
        flex-direction: column;
        row-gap: 10px;
        width: 50%;
        margin-top:50px;
        text-align: center;
    } 

    .asignatura{
        background-color: rgb(133, 234, 148);
        border-radius: 20px;
        padding: 10px;
        width: 85%;
        height: 90px;
    } 

    .asignatura .nota{
        position:static;
        border-radius: 20px;
        bottom: 0;
        background-color: red;
        width: 100%;
    } 
</style>