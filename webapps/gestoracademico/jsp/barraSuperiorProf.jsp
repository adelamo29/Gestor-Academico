<nav class="barraSuperior">
    <ul>
        <%--<li id="login"><a><%=usuario.getNombre()%></a></li>--%>
        <li>
            <div class="dropdown">
                <p><%=usuario.getNombre()%></p>
                <div class="dropdown-content">
                    <a href="<%= request.getContextPath() %>/profesor">Pedir Tutoria</a><br>
                    <a href="<%= request.getContextPath() %>/profesor">Mis asignaturas</a><br>
                    <a href="<%= request.getContextPath() %>/profesor">Introducir Notas</a>

                </div>
            </div>
        </li>
        <li><a href="<%= request.getContextPath() %>/profesor">Inicio</a></li>
        <li class="izq"> AMIUP </li>
        <li>
            <form class="buscar" action="busquedaEstudiante" method="get">
                <input id="idEst" type="text" placeholder="Nombre alumno" name="nombreEst">
                <input id="btnBuscar" type="submit" value="Buscar">
            </form>
        </li>
    </ul>
</nav>