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

        <% String nombre_titulacion = request.getParameter("nombre");
        
        Gson gson = new Gson();
        %>

        <% List<Asignatura> top5Notas = (List<Asignatura>) request.getAttribute("TOP 5 MEJORES NOTAS");
        %>
        
        <% List<Asignatura> top5Asistencia = (List<Asignatura>) request.getAttribute("TOP 5 MEJORES ASISTENCIA");
        %>

        <% List<Asignatura> top5Participacion = (List<Asignatura>) request.getAttribute("TOP 5 MEJORES PARTICIPACION");
        %>

        <% List<Asignatura> topPeoresNotas = (List<Asignatura>) request.getAttribute("TOP 5 PEORES NOTAS");
        %>
            
        <% List<Asignatura> topPeoresAsistencia = (List<Asignatura>) request.getAttribute("TOP 5 PEORES ASISTENCIA");
        %>
    
        <% List<Asignatura> topPeoresParticipacion = (List<Asignatura>) request.getAttribute("TOP 5 PEORES PARTICIPACION");
        %>

        <% List<Asignatura> NotasHistoricas = (List<Asignatura>) request.getAttribute("NOTAS HISTORICAS");
        String jsonNotasHistorica = gson.toJson(NotasHistoricas); 
        %>
                
        <% List<Asignatura> AsistenciaHistorica = (List<Asignatura>) request.getAttribute("ASISTENCIA HISTORICA");
        String jsonAsistenciaHistorica = gson.toJson(AsistenciaHistorica);
        %>
        
        <% List<Asignatura> ParticipacionHistorica = (List<Asignatura>) request.getAttribute("PARTICIPACION HISTORICA");
        String jsonParticipacionHistorica = gson.toJson(ParticipacionHistorica);
        %>

        <div><%@include file = "barraSuperiorProf.jsp" %> </div>
        
        <div class="principalPrueba">
            <div class="padrePrueba">
                <h2>Mejores Asignaturas</h2>
                <h3> Según Nota Media:</h3>
                
                <div class="hijoPrueba">
                    <% for (Asignatura asignatura : top5Notas){%>
                        <p><%=asignatura.getNombre()%> (<%=asignatura.getNotaMedia()%>)</p>
                    <%}%>
                </div>
                <h3 id="medio">Según Asistencia Media:</h3>
                <div class="hijoPrueba">
                    <% for (Asignatura asignatura : top5Asistencia){%>
                        <p><%=asignatura.getNombre()%> (<%=asignatura.getNotaMedia()%>)</p>
                    <%}%>
                </div>
                <h3 id="abajo">Según Participacion Media:</h3>
                <div class="hijoPrueba">
                    <% for (Asignatura asignatura : top5Participacion){%>
                        <p><%=asignatura.getNombre()%> (<%=asignatura.getNotaMedia()%>)</p>
                    <%}%>
                </div>
            </div>
            <div class="padrePrueba" id="centro">
                <h2 id="tituloCentro"><%=nombre_titulacion%></h2>
                
                <div class="hijoPruebaCentro">
                    <canvas id="notas"></canvas>
                </div>

                <div class="hijoPruebaCentro">
                    <canvas id="asistencia"></canvas>
                </div>

                <div class="hijoPruebaCentro">
                    <canvas id="participacion"></canvas>
                </div>
            </div>
            <div class="padrePrueba" >
                <h2>Asignaturas a mejorar</h2>
                <h3> Según Nota Media:</h3>
                
                <div class="hijoPrueba">
                    <% for (Asignatura asignatura : topPeoresNotas){%>
                        <p><%=asignatura.getNombre()%> (<%=asignatura.getNotaMedia()%>)</p>
                    <%}%>
                </div>
                <h3 id="medio">Según Asistencia Media:</h3>
                <div class="hijoPrueba">
                    <% for (Asignatura asignatura : topPeoresAsistencia){%>
                        <p><%=asignatura.getNombre()%> (<%=asignatura.getNotaMedia()%>)</p>
                    <%}%>
                </div>
                <h3 id="abajo">Según Participacion Media:</h3>
                <div class="hijoPrueba">
                    <% for (Asignatura asignatura : topPeoresParticipacion){%>
                        <p><%=asignatura.getNombre()%> (<%=asignatura.getNotaMedia()%>)</p>
                    <%}%>
                </div>
            </div>
        </div>
        
        <script>
            //GRAFICO DE BARRAS QUE MUESTRA LA NOTA MEDIA A LO LARGO DE LOS AÑOS
            document.addEventListener("DOMContentLoaded", function () {
                var notaHistTitulacion = '<%= jsonNotasHistorica %>';

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
                var asistenciaHistTitulacion = '<%= jsonAsistenciaHistorica %>';
                console.log(asistenciaHistTitulacion)
                var datosAsistencia = JSON.parse(asistenciaHistTitulacion);
                var anios = [];
                var asistencia = [];
                
                for (var i = 0; i < datosAsistencia.length; i++) {
                    var fecha = datosAsistencia[i].fecha;
                    anios.push(fecha);
                }

                for (var i = 0; i < datosAsistencia.length; i++) {
                    var asistenciaNota = datosAsistencia[i].nota_media;
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
                var participacionHistTitulacion = '<%= jsonParticipacionHistorica %>';
                console.log(participacionHistTitulacion)
                var datosParticipacion = JSON.parse(participacionHistTitulacion);
                var anios = [];
                var participacion = [];
                
                
                for (var i = 0; i < datosParticipacion.length; i++) {
                    var fecha = datosParticipacion[i].fecha;
                    anios.push(fecha);
                }

                for (var i = 0; i < datosParticipacion.length; i++) {
                    var participacionNota = datosParticipacion[i].nota_media;
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
        width: 80%;
        margin-top:25%;
        margin-left: 9%;
        text-align: center;
        justify-content: center;
        height: 30%;
        border: 5px solid black;
    } 

    .hijoPruebaCentro{
        display: flex;
        flex-direction: column;
        row-gap: 10px;
        width: 80%;
        margin-top:10%;
        margin-left: 9%;
        text-align: center;
        justify-content: center;
        height: 30%;
        border: 5px solid black;
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
        margin-left: 15%;
        color: #333;
    }
    
    .principalPrueba .padrePrueba h3{
        position: absolute;
        text-align: center;
        margin-top: 50px;
        margin-left: 28%;
        color: white;
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
        margin-left: 0%;
        color: #333;
    } 

    #medio{
        margin-top: 125%;
        margin-left: 22%;
    }

    #abajo{
        margin-top: 242%;
        margin-left:19%;
    }
</style>