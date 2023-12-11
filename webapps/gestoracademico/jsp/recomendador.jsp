<%@ page language='java' contentType='text/html;charset=utf-8'%>
<%@ page import='java.util.List'%>
<%@ page import='java.lang.Math'%>
<%@ page import="com.google.gson.Gson" %>

<%@ page import='gestoracademico.Usuario' %>
<%@ page import='gestoracademico.Asignatura' %>
<%@ page import='gestoracademico.DBManager' %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title> AMIUP: Recomendador </title>
        <link href="<%= request.getContextPath() %>/VISUAL/inicio.css" rel="stylesheet" type="text/css">
        <link href="<%= request.getContextPath() %>/VISUAL/barraSuperior.css" rel="stylesheet" type="text/css">
        <link href="<%= request.getContextPath() %>/VISUAL/estudiante.css" rel="stylesheet" type="text/css">
        <script src="https://d3js.org/d3.v6.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>

        <% Usuario usuario = new Usuario();
        usuario= (Usuario)session.getAttribute("Usuario"); %>

        <% Double suma_nota_pre = 0.00;%>

        <% Double nota_media_pre = 0.00;%>

        <%boolean suspenso = false; %>

        <% String nombre_asignatura = request.getParameter("asignatura");
        
        Gson gson = new Gson();
        %>


        <% List<Asignatura> preRequisitos = (List<Asignatura>) request.getAttribute("Prerrequisitos"); 
            
            
        String jsonPreRrequisitos = gson.toJson(preRequisitos);    
        %>
        <% List<Asignatura> postRequisitos = (List<Asignatura>) request.getAttribute("PostRequisitos"); %>

        <% List<Asignatura> notaHistTitulacion = (List<Asignatura>) request.getAttribute("NOTA MEDIA POR ANIO TITULACION");  
        
        String jsonNotaHistTitulacion = gson.toJson(notaHistTitulacion);
        %>
        
        <% List<Asignatura> participacionHistTitulacion = (List<Asignatura>) request.getAttribute("PARTICIPACION MEDIA POR ANIO TITULACION");
        
        String jsonParticipacionHistTitulacion = gson.toJson(participacionHistTitulacion);    
                    
        %>
        <% List<Asignatura> asistenciaHistTitulacion = (List<Asignatura>) request.getAttribute("ASISTENCIA MEDIA POR ANIO TITULACION"); 
                    
        String jsonAsistenciaHistTitulacion = gson.toJson(asistenciaHistTitulacion); 
                    
        %>

        <% Asignatura asignaturaClick = new Asignatura();
        asignaturaClick = (Asignatura)request.getAttribute("Asignatura click");

        String jsonAsignaturaClick = gson.toJson(asignaturaClick);
        %>

        <% Asignatura infoAsigAnio = new Asignatura();
        infoAsigAnio = (Asignatura)request.getAttribute("Info Asignatura Fecha"); 
        
        String jsoninfoAsigAnio = gson.toJson(infoAsigAnio);
        %>

        <div><%@include file = "barraSuperiorEst.jsp" %> </div>
        
        <div class="principalPrueba">
            <div class="padrePrueba">
                <h2>Prerrequisitos</h2>
                <div class="hijoPrueba">
                    <%if(!preRequisitos.isEmpty()){%> 
                        <%for(Asignatura asignatura: preRequisitos){%>
                            <div class="asignaturaPrueba">
                                <h3><%=asignatura.getNombre()%></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="notaPrueba" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="notaPrueba" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="notaPrueba" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="notaPrueba" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </div>
                            <%if(asignatura.getNota() != null){
                                suma_nota_pre = suma_nota_pre + Double.parseDouble(asignatura.getNota());
                            } %>

                            <%if((Double.parseDouble(asignatura.getNota())) < 5){
                                suspenso = true;
                            } %>
                        <%}%> 

                        <%nota_media_pre = suma_nota_pre/preRequisitos.size();%>

                        <%if(asignaturaClick.getNota() != null){ %>
                            <%if((Double.parseDouble(asignaturaClick.getNota())) < 5 && suspenso == true){ %>
                                <p class="info">Para cursar de manera segura <%=asignaturaClick.getNombre()%>, antes deberia aprobar los prerrequisitos.%></p>
                            <%}else if((Double.parseDouble(asignaturaClick.getNota())) >= 5 && suspenso == true){ %> 
                                <p class="info"> <b>Ha aprobado <%= asignaturaClick.getNombre()%> sin haber superado todos los prerrequisitos.</b></p>
                            <%} else if((Double.parseDouble(asignaturaClick.getNota())) < 5 && suspenso == false){ %>
                                <p class="info"><b>Ha superado todos los prerrequisitos. Es momento de volver a cursar <%=asignaturaClick.getNombre()%>.</b></p>
                            <%} else{ %> 
                                <p class="info"><b> Todos los prerrequisitos aprobados.</b></p>
                            <%}%>
                        <% }else{ %>
                            <%if(suspenso == true){%> 
                                <p class="info"><b>No es recomendable cursar <%=nombre_asignatura%>. Antes de ello se le recominda aprobar todos los prerrequisitos.</b></p>
                            <%} else{ %> 
                                <p class="info">Segun las notas en los distintos prerrequisitos, se ha llegado a la siguiente conclusion: </p>
                                <p class="info"><b>Nota media (sobre 10) -> </b><%=nota_media_pre%>.</p>
                                
                                <% if(nota_media_pre >= 7){%>
                                    <p class="info"><b>Muy recomendable cursar <%=nombre_asignatura%>.</b></p>
                                <%}else if(nota_media_pre < 7 && nota_media_pre >= 6){%>
                                    <p class="info"><b>Es recomendable cursar <%=nombre_asignatura%>.</b></p>
                                <%}else if(nota_media_pre >= 5 && nota_media_pre < 6){%>
                                    <p class="info"><b>Poco recomendable cursar <%=nombre_asignatura%>.</b></p>
                                <%}%>
                            <%}%>    
                        <% } %>
                    <% }else{   %>
                        <p class="info"> Esta asignatura no tiene prerrequisitos. Puede cursarla en cualquier momento.</p>
                    <%}%> 

                    <div class="hijoPrueba">
                        <canvas id="pre"></canvas>
                    </div>
                </div>
            </div>
            <div class="padrePrueba" id="centro">
                <h2 id="tituloCentro"><%=nombre_asignatura%>(<%=asignaturaClick.getNota()%>)(<%=asignaturaClick.getAsistencia()%>)(<%=asignaturaClick.getParticipacion()%>)</h2>
                
                <div class="hijoPrueba">
                    <canvas id="notasComp"></canvas>
                </div>
                
                <div class="hijoPrueba">
                    <canvas id="notas"></canvas>
                </div>

                <div class="hijoPrueba">
                    <canvas id="asistencia"></canvas>
                </div>

                <div class="hijoPrueba">
                    <canvas id="participacion"></canvas>
                </div>
            </div>
            <div class="padrePrueba" >
                <h2>Postrequisitos</h2>
                <div class="hijoPrueba">
                    <%if(!postRequisitos.isEmpty()){ %> 
                        <%for(Asignatura asignatura: postRequisitos){%>
                            <a href="<%= request.getContextPath() %>/recomendador?asignatura=<%=asignatura.getNombre()%>&id=<%=asignatura.getId()%>" class="asignaturaPrueba">
                                <h3><%=asignatura.getNombre()%></h3>
                                <%if((Double.parseDouble(asignatura.getNota())) >= 9){ %>
                                    <div class="notaPrueba" style="background-color: green;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 7 && (Double.parseDouble(asignatura.getNota())) < 9){ %>
                                    <div class="notaPrueba" style="background-color: yellow;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) >= 5 && (Double.parseDouble(asignatura.getNota())) < 7){ %>
                                    <div class="notaPrueba" style="background-color: orange;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}else if((Double.parseDouble(asignatura.getNota())) < 5){ %>
                                    <div class="notaPrueba" style="background-color: red;"><%= (Double.parseDouble(asignatura.getNota())) %></div>
                                <%}%>
                            </a>
                        <%}%>
                        <%if(asignaturaClick.getNota() != null){%>
                            <% if((Double.parseDouble(asignaturaClick.getNota())) >= 5 ){%>
                                <p class="info">Cumple uno de los requisitos para cursar los distintos postrequisitos.<br>
                                    Para mas informacion pulse sobre la asignatura.
                                </p>
                            
                            <%}else{%>
                                <p class="info">Antes deberia cursar <%=asignaturaClick.getNombre()%> para matricular estas asignaturas.</p>
                            <%} %>
                        <%} else { %>  
                            <p> No hay nota existente de <%=asignaturaClick.getNombre()%>. Para cursar los postrequisitos deberia superar esta asignatura.</p>       
                        <%} %>
                    <%}else{ %>
                        <p class="info">Esta asignatura no tiene postrequisitos.</p>
                    <%} %>    
                </div>
            </div>
        </div>
        
        <script>
            

            //GRAFICO DE BARRAS DOBLE QUE MUESTRA UNA COMPARACION DEL ALUMNO CON LA TITULACION
            document.addEventListener("DOMContentLoaded", function () {
                var jsonInfoAsigAnio = '<%=jsoninfoAsigAnio%>';
                var infoAsigAnio = JSON.parse(jsonInfoAsigAnio);
              
                var jsonAsignaturaClick = '<%=jsonAsignaturaClick%>';
                var asignaturaClick = JSON.parse(jsonAsignaturaClick);
                
                var data = {
                    labels: ['Nota', 'Asistencia', 'Participacion'],
                    datasets: [
                        {
                            label: 'Alumno',
                            backgroundColor: 'rgba(54, 162, 235, 0.6)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1,
                            data: [asignaturaClick.nota, asignaturaClick.asistencia,asignaturaClick.participacion],
                        },
                        {
                            label: 'Clase',
                            backgroundColor: 'rgba(255, 99, 132, 0.6)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1,
                            data: [infoAsigAnio.nota_media, infoAsigAnio.asistencia_media,infoAsigAnio.participacion_media],
                        }
                    ]
                };

                var options = {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                };

                var ctx = document.getElementById('notasComp').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: data,
                    options: options
                });
            });

            //GRAFICO DE TARTA PARA MOSTRAR PRERREQUISITOS
            document.addEventListener("DOMContentLoaded", function () {
                var jsonPreRrequisitos = '<%=jsonPreRrequisitos%>';
                var preRrequisitos = JSON.parse(jsonPreRrequisitos);
                
                console.log(preRrequisitos);
                var notas = [];
                var total = 10*preRrequisitos.length;
                var total_creditos = 0;
                
                var suma_nota = 0;

                for (var i = 0; i < preRrequisitos.length; i++) {
                    var creditos = preRrequisitos[i].creditos;
                    total_creditos = parseInt(total_creditos)+parseInt(creditos);
                }

                console.log(total_creditos);
                for (var i = 0; i < preRrequisitos.length; i++) {
                    var nota = preRrequisitos[i].nota;
                    suma_nota = parseFloat(suma_nota)+parseFloat(nota);
                    notas.push(nota);
                }
                
                total = total - suma_nota;

                notas.push(total);
                
                var data = {
                    labels: ['Progreso Prerrequisitos'],
                    datasets: [
                        {
                            label: 'Alumno',
                            backgroundColor: ['rgba(54, 162, 235, 0.6)','rgba(124, 162, 235, 0.6)','rgba(255, 255, 255, 0.6)'],
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1,
                            data: notas,
                        }
                    ]
                };

                var options = {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                };

                var ctx = document.getElementById('pre').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'pie',
                    data: data,
                    options: options
                });
            });

            //GRAFICO DE BARRAS QUE MUESTRA LA NOTA MEDIA A LO LARGO DE LOS AÑOS
            document.addEventListener("DOMContentLoaded", function () {
                var notaHistTitulacion = '<%= jsonNotaHistTitulacion %>';

                var datosNotas = JSON.parse(notaHistTitulacion);
                var anios = [];
                var notas = []; 
                
                for (var i = 0; i < datosNotas.length; i++) {
                    var fecha = datosNotas[i].fecha;
                    anios.push(fecha);
                }

                for (var i = 0; i < datosNotas.length; i++) {
                    var nota = datosNotas[i].nota_media;
                    notas.push(nota);
                }
                
                var data = {
                    labels: anios,
                    datasets: [{
                        label: 'Nota media por año',
                        backgroundColor: 'rgba(54, 162, 235, 0.6)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1,
                        data: notas,
                    }]
                };

                var options = {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                };

                var ctx = document.getElementById('notas').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: data,
                    options: options
                });
            });

            //GRAFICO DE BARRAS QUE MUESTRA LA ASISTENCIA MEDIA A LO LARGO DE LOS AÑOS
            document.addEventListener("DOMContentLoaded", function () {
                var asistenciaHistTitulacion = '<%= jsonAsistenciaHistTitulacion %>';

                var datosAsistencia = JSON.parse(asistenciaHistTitulacion);
                var anios = [];
                var asistencia = [];
                
                for (var i = 0; i < datosAsistencia.length; i++) {
                    var fecha = datosAsistencia[i].fecha;
                    anios.push(fecha);
                }

                for (var i = 0; i < datosAsistencia.length; i++) {
                    var asistenciaNota = datosAsistencia[i].asistencia_media;
                    asistencia.push(asistenciaNota);
                }

                var data = {
                    labels: anios,
                    datasets: [{
                        label: 'Asitencia media por año',
                        backgroundColor: 'rgba(54, 162, 235, 0.6)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1,
                        data: asistencia,
                    }]
                };

                var options = {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                };

                var ctx = document.getElementById('asistencia').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: data,
                    options: options
                });
            });
            
            //GRAFICO DE BARRAS QUE MUESTRA LA PARTICIPACION MEDIA A LO LARGO DE LOS AÑOS
            document.addEventListener("DOMContentLoaded", function () {
                var participacionHistTitulacion = '<%= jsonParticipacionHistTitulacion %>';

                var datosParticipacion = JSON.parse(participacionHistTitulacion);
                var anios = [];
                var participacion = [];
                
                
                for (var i = 0; i < datosParticipacion.length; i++) {
                    var fecha = datosParticipacion[i].fecha;
                    anios.push(fecha);
                }

                for (var i = 0; i < datosParticipacion.length; i++) {
                    var participacionNota = datosParticipacion[i].participacion_media;
                    participacion.push(participacionNota);
                }
              
                var data = {
                    labels: anios,
                    datasets: [{
                        label: 'Participacion media por año',
                        backgroundColor: 'rgba(54, 162, 235, 0.6)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1,
                        data: participacion,
                    }]
                };

                var options = {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                };

                var ctx = document.getElementById('participacion').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: data,
                    options: options
                });
            });
        </script>
        
    </body>
</html>

<style>

    .principalPrueba{
        display: flex;
        flex-direction: row;       
        width: 80%;
        position: absolute;
        margin-left: 10%;
        margin-top: 100px;
    }
    .padrePrueba{
        position: relative;
        display: flex;
        width: 30%;
        flex-direction: column;
        row-gap: 10px;
        border: 5px solid black;
        background-color: rgb(100, 180, 153);
    } 

    .hijoPrueba{
        display: flex;
        flex-direction: column;
        row-gap: 10px;
        width: 100%;
        margin-top:50px;
        text-align: center;
        justify-content: center;
    } 

    .asignaturaPrueba{
        background-color: rgb(133, 234, 148);
        border-radius: 20px;
        padding: 10px;
        width: 65%;
        height: 120px;
        justify-content: center;
        text-align: center;
        margin-left: 15%;
    } 

    .principalPrueba .padrePrueba h2{
        position: absolute;
        text-align: center;
        margin-top: 10px;
        margin-left: 35%;
        color: #333;
    } 

    .principalPrueba .padrePrueba .hijoPrueba .asignaturaPrueba .notaPrueba{
        position:static;
        border-radius: 20px;
        background-color: red;
        margin-top: 13px;
        width: 100%;
    }

    .asignaturaPrueba h3 {
        padding-top: 20px;
        color: #333;
    }

    .info{
        padding: 15px 20px;
        text-align: center;
        background-color: rgb(133, 234, 148);
        color: #333;
        border-radius: 20px;
    }   


    #graficoNota_Anio{
        background-color: white;
    } 
    #centro{
        position: relative;
        display: flex;
        width: 40%;
        flex-direction: column;
        row-gap: 10px;
        border: 5px solid black;
    }  

    #tituloCentro{
        position: relative;
        text-align: center;
        margin-top: 10px;
        margin-left: 18%;
        color: #333;
    } 
</style>