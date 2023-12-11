<nav class="barraSuperior">
    <ul>
        <li id="login"><a href="<%= request.getContextPath() %>/inicioSesion"><%=usuario.getNombre()%></a></li>
        <li><a href="<%= request.getContextPath() %>/estudiante">Ver asignaturas matriculadas</a></li>
        <li><a href="<%= request.getContextPath() %>/estudianteCompleto">Inicio</a></li>
        <li class="izq"> AMIUP </li>
    </ul>
</nav>