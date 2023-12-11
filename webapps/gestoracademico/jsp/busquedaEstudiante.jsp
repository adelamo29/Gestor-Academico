<%@ page language='java' contentType='text/html;charset=utf-8'%>
<%@ page import='java.util.List'%>

<%@ page import='gestoracademico.Usuario' %>
<%@ page import='gestoracademico.Asignatura' %>



<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title> AMIUP: Busqueda Estudiante </title>
        <link href="<%= request.getContextPath() %>/VISUAL/inicio.css" rel="stylesheet" type="text/css">
        <link href="<%= request.getContextPath() %>/VISUAL/barraSuperior.css" rel="stylesheet" type="text/css">
        <link href="<%= request.getContextPath() %>/VISUAL/estudiante.css" rel="stylesheet" type="text/css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    </head>
    <body>

        <% Usuario usuario = new Usuario();
        usuario= (Usuario)session.getAttribute("Usuario"); 
        
        String nomEstudiante = (String) request.getAttribute("nomEstudiante");
        %>

        <div><%@include file = "barraSuperiorProf.jsp" %> </div>

        <% List<Asignatura> asignaturasUsuario11 = (List<Asignatura>) request.getAttribute("Asignaturas Matriculadas 11"); %>
        <% List<Asignatura> asignaturasUsuario12 = (List<Asignatura>) request.getAttribute("Asignaturas Matriculadas 12"); %>
        <% List<Asignatura> asignaturasUsuario21 = (List<Asignatura>) request.getAttribute("Asignaturas Matriculadas 21"); %>
        <% List<Asignatura> asignaturasUsuario22 = (List<Asignatura>) request.getAttribute("Asignaturas Matriculadas 22"); %>
        <% List<Asignatura> asignaturasUsuario31 = (List<Asignatura>) request.getAttribute("Asignaturas Matriculadas 31"); %>
        <% List<Asignatura> asignaturasUsuario32 = (List<Asignatura>) request.getAttribute("Asignaturas Matriculadas 32"); %>
        <% List<Asignatura> asignaturasUsuario41 = (List<Asignatura>) request.getAttribute("Asignaturas Matriculadas 41"); %>
        <% List<Asignatura> asignaturasUsuario42 = (List<Asignatura>) request.getAttribute("Asignaturas Matriculadas 42"); %>

        <div class="principal">
            <div class="padre">
                <h2> Primer Curso </h2>
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario11) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>&nomEst=<%=nomEstudiante%>" class="asignatura" style="background-color: rgb(65, 179, 228)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>"> 
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                                
                            </a>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>&nomEst=<%=nomEstudiante%>" class="asignatura" style="background-color: rgb(74, 91, 224)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>&nomEst=<%=nomEstudiante%>" class="asignatura" style="background-color: rgb(224, 164, 74)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else{%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>&nomEst=<%=nomEstudiante%>" class="asignatura" style="background-color: rgb(135, 60, 30)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%} %>  
                    <% } %> 
                </div>
                
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario12) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>&nomEst=<%=nomEstudiante%>" class="asignatura" style="background-color: rgb(65, 179, 228)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>&nomEst=<%=nomEstudiante%>" class="asignatura" style="background-color: rgb(74, 91, 224)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>&nomEst=<%=nomEstudiante%>" class="asignatura" style="background-color: rgb(224, 164, 74)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else{%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>&nomEst=<%=nomEstudiante%>" class="asignatura" style="background-color: rgb(135, 60, 30)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            
                            </a>
                        <%} %> 
                    <% } %> 
                </div>
                
            </div>
            <div class="padre">
                <h2> Segundo Curso </h2>
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario21) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(65, 179, 228)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(74, 91, 224)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(224, 164, 74)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else{%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(135, 60, 30)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%} %> 
                    <% } %> 
                </div>
                
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario22) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(65, 179, 228)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(74, 91, 224)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(224, 164, 74)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else{%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(135, 60, 30)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%} %> 
                    <% } %> 
                </div>
                
            </div>
            <div class="padre">
                <h2> Tercer Curso </h2>
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario31) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(65, 179, 228)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(74, 91, 224)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(224, 164, 74)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else{%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(135, 60, 30)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%} %> 
                    <% } %> 
                </div>
                
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario32) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(65, 179, 228)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(74, 91, 224)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(224, 164, 74)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else{%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(135, 60, 30)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%} %> 
                    <% } %> 
                </div>
                
            </div>
            <div class="padre">
                <h2> Cuarto Curso </h2>
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario41) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(65, 179, 228)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(74, 91, 224)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(224, 164, 74)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else{%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(135, 60, 30)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%} %> 
                    <% } %> 
                </div>
                
                <div class="hijo">
                    <% for (Asignatura asignatura: asignaturasUsuario42) { %>
                        <%if(asignatura.getTipo().equals("Formacion Basica")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(65, 179, 228)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Obligatoria")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(74, 91, 224)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else if(asignatura.getTipo().equals("Optativa")){%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(224, 164, 74)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}else{%>
                            <a href="<%= request.getContextPath() %>/recomendadorProfesor?asignaturaEst=<%=asignatura.getNombre()%>&idEst=<%=asignatura.getId()%>" class="asignatura" style="background-color: rgb(135, 60, 30)" 
                                data-nombre="<%= asignatura.getNombre() %>" data-participacion="<%= asignatura.getParticipacion() %>" data-nota="<%= asignatura.getNota() %>" 
                                data-asistencia="<%= asignatura.getAsistencia() %>" data-notamedia="<%= asignatura.getNotaMedia() %>" data-participacionmedia="<%= asignatura.getParticipacionMedia() %>"
                                data-asistenciamedia="<%= asignatura.getAsistenciaMedia() %>">
                                <h3><%= asignatura.getNombre() %></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="nota" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="nota" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="nota" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="nota" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%} %> 
                    <% } %> 
                </div>
                
            </div>
        </div>

        
        <script>
            $(document).ready(function() {
                $(".asignatura").on("mouseenter",function() {
                    var nombre = $(this).data("nombre");
                    var nota = $(this).data("nota");
                    var asistencia = $(this).data("asistencia");
                    var participacion = $(this).data("participacion");
                    var notaMedia = $(this).data("notamedia");
                    var participacionMedia = $(this).data("participacionmedia");
                    var asistenciaMedia = $(this).data("asistenciamedia");
                    

                    var miniVentana = $("<div class='miniVentana'></div>");
                    miniVentana.append("<h2> "+nombre+"</h2>");
                    miniVentana.append("<p> Nota (sobre 10):"+nota+"</p>");
                    miniVentana.append("<p> Participacion (sobre 10): "+participacion+"</p>");
                    miniVentana.append("<p> Ha asistido a "+asistencia+" sesiones de x posibles.</p>");
                    miniVentana.append("<h2> Informacion sobre "+nombre+" en su titulacion.</h2>");
                    miniVentana.append("<p> Nota media (sobre 10): "+notaMedia+".</p>");
                    miniVentana.append("<p> Participacion media (sobre 10): "+participacionMedia+".</p>");
                    miniVentana.append("<p> Asistencia media de "+asistenciaMedia+" sobre x sesiones.</p>");

                    $("body").append(miniVentana);
                } )
            } )

            $(".asignatura").on("mouseleave",function(){
                $(".miniVentana").remove();
            } )



            $(document).ready(function() {
                $(".asignatura").on("click",function() {
                    var nombre = $(this).data("nombre");
                    

                } )
            } )
        </script>
    </body>
    
</html>