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

        <% String nombre_asignatura = request.getParameter("asignatura");
        
        Gson gson = new Gson();
        %>

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

        <% List<String> notas = (List<String>) request.getAttribute("NOTAS"); 
        String jsonnotas = gson.toJson(notas);

        List<String> asistencias = (List<String>) request.getAttribute("ASISTENCIAS"); 
        String jsonasistencias = gson.toJson(asistencias);

        List<String> participaciones = (List<String>) request.getAttribute("PARTICIPACIONES"); 
        String jsonparticipaciones = gson.toJson(participaciones);

        List<Asignatura> notasTitulaciones = (List<Asignatura>) request.getAttribute("notasTitulaciones"); 
        String jsonnotasTitulaciones = gson.toJson(notasTitulaciones);

        List<Asignatura> asistenciaTitulaciones = (List<Asignatura>) request.getAttribute("asistenciaTitulaciones"); 
        String jsonasistenciaTitulaciones = gson.toJson(asistenciaTitulaciones);

        List<Asignatura> participacionTitulaciones = (List<Asignatura>) request.getAttribute("participacionTitulaciones"); 
        String jsonparticiparTitulaciones = gson.toJson(participacionTitulaciones);
        %>

        <div><%@include file = "barraSuperiorProf.jsp" %> </div>
        
        <div class="principalPrueba">
            <div class="padrePrueba">
                <h2>Datos Historicos Asignatura</h2>
                
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
            <div class="padrePrueba" id="centro">
                <h2 id="tituloCentro"><%=nombre_asignatura%></h2>
                
                <div class="hijoPrueba">
                    <canvas id="notasAsig"></canvas>
                </div>

                <div class="hijoPrueba">
                    <canvas id="asistenciaAsig"></canvas>
                </div>

                <div class="hijoPrueba">
                    <canvas id="participacionAsig"></canvas>
                </div>
            </div>
            <div class="padrePrueba" >
                <h2>Comparativa Titulaciones</h2>
                <div class="hijoPrueba">
                    <canvas id="notasTitulacion"></canvas>
                </div>

                <div class="hijoPrueba">
                    <canvas id="asisTitulacion"></canvas>
                </div>

                <div class="hijoPrueba">
                    <canvas id="parTitulacion"></canvas>
                </div>
            </div>
        </div>
        
        <script>
            
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

            //INICIO GRAFICO POLARAREA NOTAS
            document.addEventListener("DOMContentLoaded", function () {
                //var notasJson = '<%= jsonnotas %>';

                //var notas = JSON.parse(notasJson);
                //Notas generadas a parte para que los graficos salgan mejor
                var notas = [
                    9.88, 4.72, 6.04, 3.91, 7.14, 3.12, 9.64, 1.33, 1.66, 3.09,
                    4.82, 7.08, 6.02, 3.54, 7.46, 0.59, 0.13, 8.76, 8.41, 6.14,
                    5.21, 3.38, 2.12, 1.34, 9.74, 5.08, 5.58, 4.84, 9.98, 2.53,
                    4.12, 7.13, 3.25, 9.13, 0.71, 7.04, 0.83, 1.98, 5.32, 0.46,
                    8.46, 2.84, 7.77, 5.71, 9.68, 4.68, 7.65, 5.75, 6.88, 8.84,
                    8.07, 9.11, 3.59, 4.69, 7.81, 0.94, 7.59, 7.01, 4.75, 2.71,
                    8.99, 8.03, 2.85, 4.91, 5.44, 2.21, 1.09, 3.89, 7.02, 4.72,
                    2.21, 3.23, 8.56, 7.41, 7.06, 0.36, 4.41, 3.84, 3.05, 2.67,
                    3.53, 7.21, 2.62, 1.84, 9.56, 1.94, 2.39, 4.33, 5.29, 4.18,
                    9.65, 6.71, 6.82, 1.05, 3.93, 1.52, 7.88, 6.45, 9.19, 5.28
                ];

                //Array para q solo salgan 10 medidas
                var rangos = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

                //con esto ordenamos los rangos para que luego se muestren directamente, si no se hace los rangos se crean segun van saliendo las notas
                var numAlumnosRango = {};
                rangos.forEach(function (rango) {
                    numAlumnosRango[rango] = 0;
                });

                //para cada nota del array comprobamos en que rango esta y se suma 1 de frecuencia en ese rango
                notas.forEach(function (nota) {
                    for (var i = 0; i < rangos.length - 1; i++) {
                        if (nota >= rangos[i] && nota < rangos[i + 1]) {
                            numAlumnosRango[rangos[i]]++;
                            break;
                        }
                    }
                });

                //colores para cada rango
                var colores = [
                    'rgba(255, 99, 132, 0.5)',
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(255, 206, 86, 0.5)',
                    'rgba(75, 192, 192, 0.5)',
                    'rgba(153, 102, 255, 0.5)',
                    'rgba(255, 159, 64, 0.5)',
                    'rgba(255, 0, 0, 0.5)',
                    'rgba(0, 255, 0, 0.5)',
                    'rgba(0, 0, 255, 0.5)',
                    'rgba(128, 128, 0, 0.5)'
                ];

                //Diagrama notas asignatura en año impartido por profesor
                var ctx = document.getElementById('notasAsig').getContext('2d');

                var polarChart = new Chart(ctx, {
                    type: 'polarArea',
                    data: {
                        labels: rangos.map(function (rango) {
                            return rango + '-' + (rango + 1);
                        }),
                        datasets: [{
                            label: 'Numero de Alumnos',
                            data: rangos.map(function (rango) {
                                return numAlumnosRango[rango];
                            }),
                            backgroundColor: colores,
                            borderColor: colores,
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scale: {
                            ticks: {
                                beginAtZero: true
                            }
                        },
                        plugins: {
                        title: {
                            display: true,
                            text: 'Notas de la asignatura'
                        }
                    }
                    }
                });
            //FIN GRAFICO POLAR AREA NOTAS
            });

            //INICIO GRAFICO POLARAREA ASISTENCIA
            document.addEventListener("DOMContentLoaded", function () {
                //si hubiese mas datos en la base de datos habria que hacer lo que se hace en el grafico de notas (actualmente esta comentado)
                //Notas generadas a parte para que los graficos salgan mejor
                var asistencias = [
                    '3', '18', '12', '6', '8', '14', '21', '9', '20', '11',
                    '15', '2', '5', '17', '7', '19', '10', '22', '4', '16',
                    '1', '8', '13', '4', '18', '7', '11', '20', '9', '6',
                    '17', '22', '3', '21', '7', '15', '2', '14', '23', '19',
                    '15', '6', '18', '2', '7', '14', '21', '19', '8', '3',
                    '13', '20', '10', '5', '22', '9', '16', '3', '15', '10',
                    '21', '4', '18', '7', '13', '8', '5', '10', '19', '9',
                    '21', '15', '10', '6', '18', '12', '5', '17', '23', '13',
                ];

                //Array para q solo salgan 10 medidas
                var rangos = [0, 3, 6, 9, 12, 15, 18, 21, 23];

                //con esto ordenamos los rangos para que luego se muestren directamente, si no se hace los rangos se crean segun van saliendo las notas
                var numAlumnosRango = {};
                rangos.forEach(function (rango) {
                    numAlumnosRango[rango] = 0;
                });

                //para cada nota del array comprobamos en que rango esta y se suma 1 de frecuencia en ese rango
                asistencias.forEach(function (asistencia) {
                    for (var i = 0; i < rangos.length - 1; i++) {
                        if (asistencia >= rangos[i] && asistencia < rangos[i + 1]) {
                            numAlumnosRango[rangos[i]]++;
                            break;
                        }
                    }
                });

                //colores para cada rango
                var colores = [
                    'rgba(255, 99, 132, 0.5)',
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(255, 206, 86, 0.5)',
                    'rgba(75, 192, 192, 0.5)',
                    'rgba(153, 102, 255, 0.5)',
                    'rgba(255, 159, 64, 0.5)',
                    'rgba(255, 0, 0, 0.5)',
                    'rgba(0, 255, 0, 0.5)',
                    'rgba(0, 0, 255, 0.5)',
                    'rgba(128, 128, 0, 0.5)'
                ];

                //Diagrama notas asignatura en año impartido por profesor
                var ctx = document.getElementById('asistenciaAsig').getContext('2d');

                var polarChart = new Chart(ctx, {
                    type: 'polarArea',
                    data: {
                        labels: rangos.map(function (rango) {
                            return rango + '-' + (rango + 3);
                        }),
                        datasets: [{
                            label: 'Numero de Alumnos',
                            data: rangos.map(function (rango) {
                                return numAlumnosRango[rango];
                            }),
                            backgroundColor: colores,
                            borderColor: colores,
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scale: {
                            ticks: {
                                beginAtZero: true
                            }
                        },
                        plugins: {
                        title: {
                            display: true,
                            text: 'Asistencia de la asignatura'
                        }
                    }
                    }
                });
            //FIN GRAFICO POLAR AREA ASISTENCIA
            });

            
            //INICIO GRAFICO POLARAREA ASISTENCIA
            document.addEventListener("DOMContentLoaded", function () {
                //si hubiese mas datos en la base de datos habria que hacer lo que se hace en el grafico de notas (actualmente esta comentado)
                //Notas generadas a parte para que los graficos salgan mejor
                var participaciones = [
                    '5.42', '3.78', '7.91', '2.15', '9.23', '4.56', '8.74', '1.98',
                    '0.64', '6.37', '4.21', '8.95', '2.89', '7.03', '9.62', '1.34',
                    '3.17', '5.83', '0.49', '9.08', '6.72', '2.46', '7.29', '1.94',
                    '8.61', '4.35', '6.98', '1.09', '9.50', '0.75', '3.21', '7.96',
                    '4.59', '2.83', '8.76', '1.28', '9.14', '5.50', '7.83', '0.41',
                    '6.04', '2.68', '9.31', '1.53', '8.45', '4.12', '7.55', '0.86',
                    '3.72', '9.39', '5.07', '1.22', '8.07', '6.66', '2.97', '7.20',
                    '1.66', '4.94', '8.29', '3.45', '9.77', '0.30', '5.69', '7.46',
                    '2.38', '6.91', '9.85', '1.78', '4.27', '8.52', '0.97', '3.09',
                    '7.68', '5.14', '2.53', '9.54', '1.41', '6.25', '8.83', '4.80'
                ]

                //Array para q solo salgan 10 medidas
                var rangos = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

                //con esto ordenamos los rangos para que luego se muestren directamente, si no se hace los rangos se crean segun van saliendo las notas
                var numAlumnosRango = {};
                rangos.forEach(function (rango) {
                    numAlumnosRango[rango] = 0;
                });

                //para cada nota del array comprobamos en que rango esta y se suma 1 de frecuencia en ese rango
                participaciones.forEach(function (participacion) {
                    for (var i = 0; i < rangos.length - 1; i++) {
                        if (participacion >= rangos[i] && participacion < rangos[i + 1]) {
                            numAlumnosRango[rangos[i]]++;
                            break;
                        }
                    }
                });

                //colores para cada rango
                var colores = [
                    'rgba(255, 99, 132, 0.5)',
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(255, 206, 86, 0.5)',
                    'rgba(75, 192, 192, 0.5)',
                    'rgba(153, 102, 255, 0.5)',
                    'rgba(255, 159, 64, 0.5)',
                    'rgba(255, 0, 0, 0.5)',
                    'rgba(0, 255, 0, 0.5)',
                    'rgba(0, 0, 255, 0.5)',
                    'rgba(128, 128, 0, 0.5)'
                ];

                //Diagrama notas asignatura en año impartido por profesor
                var ctx = document.getElementById('participacionAsig').getContext('2d');

                var polarChart = new Chart(ctx, {
                    type: 'polarArea',
                    data: {
                        labels: rangos.map(function (rango) {
                            return rango + '-' + (rango + 1);
                        }),
                        datasets: [{
                            label: 'Numero de Alumnos',
                            data: rangos.map(function (rango) {
                                return numAlumnosRango[rango];
                            }),
                            backgroundColor: colores,
                            borderColor: colores,
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scale: {
                            ticks: {
                                beginAtZero: true
                            }
                        },
                        plugins: {
                        title: {
                            display: true,
                            text: 'Participacion de la asignatura'
                        }
                    }
                    }
                });
            //FIN GRAFICO POLAR AREA PARTICIPACION
            });

            //GRAFICO COMPARATIVA NOTAS ENTRE TITULACIONES
            document.addEventListener("DOMContentLoaded", function () {
                var notaHistTitulaciones = '<%= jsonnotasTitulaciones %>';
                var notas = JSON.parse(notaHistTitulaciones);

                var titulaciones = [...new Set(notas.map(entry => entry.titulacion))];

                var datasets = titulaciones.map(titulacion => {
                    var titulacionData = notas.filter(entry => entry.titulacion === titulacion);
                    var years = titulacionData.map(entry => entry.fecha);
                    var notaMedia = titulacionData.map(entry => entry.nota_media);
                    return {
                        label: titulacion,
                        data: notaMedia,
                        borderColor: getRandomColor(),
                        borderWidth: 3,
                        fill: false
                    };
                });
                var years = notas.map(entry => entry.fecha);
                
                var ctx = document.getElementById('notasTitulacion').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: years,  
                        datasets: datasets
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            x: {
                                type: 'linear',
                                position: 'bottom'
                            }
                        }
                    }
                });

                function getRandomColor() {
                    var letters = '0123456789ABCDEF';
                    var color = '#';
                    for (var i = 0; i < 6; i++) {
                        color += letters[Math.floor(Math.random() * 16)];
                    }
                    return color;
                }
            });

            //GRAFICO COMPARATIVA ASISTECNCIA ENTRE TITULACIONES
            document.addEventListener("DOMContentLoaded", function () {
                var asistenciaHistTitulaciones = '<%= jsonasistenciaTitulaciones %>';
                var asistencia = JSON.parse(asistenciaHistTitulaciones);
                console.log(asistencia);
                //Creammos array con las titulaciones
                var titulaciones = [...new Set(asistencia.map(entry => entry.titulacion))]; //hacemos uso de set para crear un conjunto (no puede haber duplicados)
                                                                                                    //y lo pasamos de nuevo a array con [...]
                
                var datasets = titulaciones.map(titulacion => {
                    var titulacionData = asistencia.filter(entry => entry.titulacion === titulacion); //creamos array que se queda unicamente con los datos que corresponden a la titulacion
                    var years = titulacionData.map(entry => entry.fecha);//array con las fechas disponibles en la titulacion
                    var notaMedia = titulacionData.map(entry => entry.asistencia_media);//array con la nota media
                    return {
                        label: titulacion,
                        data: notaMedia,
                        borderColor: getRandomColor(),
                        borderWidth: 3,
                        fill: false //en true se rellenaria el espacio por debajo de la linea
                    };
                });
                var years = asistencia.map(entry => entry.fecha);

                
                var ctx = document.getElementById('asisTitulacion').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: years,  
                        datasets: datasets
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            x: {
                                type: 'linear',
                                position: 'bottom'
                            }
                        }
                    }
                });

                
                function getRandomColor() {
                    var letters = '0123456789ABCDEF';
                    var color = '#';
                    for (var i = 0; i < 6; i++) {
                        color += letters[Math.floor(Math.random() * 16)];
                    }
                    return color;
                }
            });

            //GRAFICO COMPARATIVA PARTICIPACION ENTRE TITULACIONES
            document.addEventListener("DOMContentLoaded", function () {
                var participarHistTitulaciones = '<%= jsonparticiparTitulaciones %>';
                var participacion = JSON.parse(participarHistTitulaciones);
                
                var titulaciones = [...new Set(participacion.map(entry => entry.titulacion))];

                var datasets = titulaciones.map(titulacion => {
                    var titulacionData = participacion.filter(entry => entry.titulacion === titulacion);
                    var years = titulacionData.map(entry => entry.fecha);
                    var notaMedia = titulacionData.map(entry => entry.participacion_media);
                    return {
                        label: titulacion,
                        data: notaMedia,
                        borderColor: getRandomColor(),
                        borderWidth: 3,
                        fill: false
                    };
                });
                var years = participacion.map(entry => entry.fecha);

                var ctx = document.getElementById('parTitulacion').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: years, 
                        datasets: datasets
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            x: {
                                type: 'linear',
                                position: 'bottom'
                            }
                        }
                    }
                });

                
                function getRandomColor() {
                    var letters = '0123456789ABCDEF';
                    var color = '#';
                    for (var i = 0; i < 6; i++) {
                        color += letters[Math.floor(Math.random() * 16)];
                    }
                    return color;

                    var cont = 0;
                    
                }
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
        height: 30%;
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
</style>