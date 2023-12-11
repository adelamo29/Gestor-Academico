<nav class="barraSuperior">
    <ul>
        <li id="login"><a href="<%= request.getContextPath() %>/inicioSesion"><%=usuario.getNombre()%></a></li>
        <li><a href="<%= request.getContextPath() %>/estudianteCompleto">Ver todas las asignaturas</a></li>
        <li><a href="<%= request.getContextPath() %>/estudiante">Inicio</a></li>
        <li class="izq"> AMIUP </li>
    </ul>
</nav>