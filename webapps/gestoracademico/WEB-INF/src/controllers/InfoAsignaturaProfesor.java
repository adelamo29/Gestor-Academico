package controllers;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.naming.*;
import javax.sql.*;
import java.sql.SQLException;
import javax.servlet.*;
import java.util.ArrayList;
import java.util.List;

import gestoracademico.*;

@WebServlet("/infoAsignaturaProfesor")

public class InfoAsignaturaProfesor extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        HttpSession session = request.getSession();
        
        //Cogemos los parametros que se envia a traves de la URL
        String nombre_titulacion = request.getParameter("titulacion");
        String nombre_asignatura = request.getParameter("asignatura");
        String fecha = request.getParameter("fecha");
        String id = request.getParameter("id");
        int id_asignatura = Integer.parseInt(id);


        try(DBManager db = new DBManager()){ 

            //Sacamos la informacion historica de la asignatura para mostrarla en graficos (nota, asistencia y participacion)

            List<Asignatura> notaHistTitulacion = db.notaAsigTitulacion(nombre_titulacion, nombre_asignatura);
            request.setAttribute("NOTA MEDIA POR ANIO TITULACION", notaHistTitulacion);
            List<Asignatura> participacionHistTitulacion = db.participacionAsigTitulacion(nombre_titulacion, nombre_asignatura);
            request.setAttribute("PARTICIPACION MEDIA POR ANIO TITULACION", participacionHistTitulacion);
            List<Asignatura> asistenciaHistTitulacion = db.asistenciaAsigTitulacion(nombre_titulacion, nombre_asignatura);
            request.setAttribute("ASISTENCIA MEDIA POR ANIO TITULACION", asistenciaHistTitulacion);

            //Buscamos informacion en el año en el que el profesor imparte la asignatura
            List<String> notasAsig = db.buscarNotasAsig(nombre_titulacion, id_asignatura, fecha);
            request.setAttribute("NOTAS", notasAsig);
            List<String> asistenciaAsig = db.buscarAsistenciaAsig(nombre_titulacion, id_asignatura, fecha);
            request.setAttribute("ASISTENCIAS", asistenciaAsig);
            List<String> participacionAsig = db.buscarParticipacionAsig(nombre_titulacion, id_asignatura, fecha);
            request.setAttribute("PARTICIPACIONES", participacionAsig);
            
            //Buscar informacion historica de todas las titulaciones que tengan la asignatura impartida
            //buscamos el ID de todas las titulaciones
            List<String> titulaciones = db.buscarTitulacionesAsig(id_asignatura);
            //LISTAS PARA IR BUSCANDO NOTA MEDIA POR TITULACION
            List<Asignatura> notasTitulaciones = new ArrayList<Asignatura>();
            //LISTAS PARA IR BUSCANDO ASISTENCIA POR TITULACION
            List<Asignatura> asitenciaTitulaciones = new ArrayList<Asignatura>();
            //LISTAS PARA IR BUSCANDO PARTICIPACION POR TITULACION
            List<Asignatura> participacionTitulaciones = new ArrayList<Asignatura>();
            
            //BUCLE PARA BUSCAR LA NOTA EN TODAS LOS TITULACIONES
            for (String titulacion : titulaciones){
                List<Asignatura> notasTitulacion = db.notaAsigTitulacion(titulacion, nombre_asignatura);
                notasTitulaciones.addAll(notasTitulacion);
                notasTitulacion.clear();
            }

            //BUCLE PARA BUSCAR LA ASISTENCIA EN TODAS LOS TITULACIONES
            for (String titulacion : titulaciones){
                List<Asignatura> asistenciaTitulacion = db.asistenciaAsigTitulacion(titulacion, nombre_asignatura);
                asitenciaTitulaciones.addAll(asistenciaTitulacion);
                asistenciaTitulacion.clear();
            }

            //BUCLE PARA BUSCAR LA PARTICIPACION EN TODAS LOS TITULACIONES
            for (String titulacion : titulaciones){
                List<Asignatura> participacionTitulacion = db.participacionAsigTitulacion(titulacion, nombre_asignatura);
                participacionTitulaciones.addAll(participacionTitulacion);
                participacionTitulacion.clear();
            }

            request.setAttribute("notasTitulaciones", notasTitulaciones);
            request.setAttribute("asistenciaTitulaciones", asitenciaTitulaciones);
            request.setAttribute("participacionTitulaciones", participacionTitulaciones);
            
            request.getRequestDispatcher("/jsp/infoAsignaturaProfesor.jsp").forward(request, response);
        }catch (SQLException| NamingException e ){
            response.sendError(500);
        }
    } 

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

        HttpSession session = request.getSession();
        
    } 
} 
