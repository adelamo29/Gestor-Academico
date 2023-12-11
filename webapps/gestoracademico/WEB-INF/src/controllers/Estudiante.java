package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
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

@WebServlet("/estudiante")

public class Estudiante extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        HttpSession session = request.getSession();

        //Recogemos el atributo usuario guardado en la sesion
        Usuario usuario_log = (Usuario)session.getAttribute("Usuario");

        try(DBManager db = new DBManager()){ 

            //Lista para guardar todas las asignaturas matriculadas o cursadas por el usuario
            //Se llama al metodo buscar asignaturas del DBManager
            List<Asignatura> asignaturasMatriculadas = db.buscarAsignaturasMatriculadas(usuario_log.getId());

            //Distintas listas para filtrar asignaturas por curso y cuatrimestre
            List<Asignatura> asignaturasMatriculadas11 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasMatriculadas12 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasMatriculadas21 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasMatriculadas22 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasMatriculadas31 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasMatriculadas32 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasMatriculadas41 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasMatriculadas42 = new ArrayList<Asignatura>();
            
            Double nota_media = 0.00;
            Double participacion_media = 0.00;
            Double asistencia_media = 0.00;

            for (Asignatura asignatura: asignaturasMatriculadas){

                nota_media = db.notaMediaAsignatura(asignatura.getNombre(), usuario_log.getTitulacion());
                asignatura.setNotaMedia(nota_media);

                participacion_media = db.participacionMediaAsignatura(asignatura.getNombre(), usuario_log.getTitulacion());
                asignatura.setParticipacionMedia(participacion_media);

                asistencia_media = db.asistenciaMediaAsignatura(asignatura.getNombre(), usuario_log.getTitulacion());
                asignatura.setAsistenciaMedia(asistencia_media);

                if(asignatura.getCurso().equals("1")){
                    if(asignatura.getCuatrimestre() == 1){
                        asignaturasMatriculadas11.add(asignatura);
                    }else if(asignatura.getCuatrimestre() == 2){
                        asignaturasMatriculadas12.add(asignatura);
                    } 
                }else if(asignatura.getCurso().equals("2")){
                    if(asignatura.getCuatrimestre() == 1){
                        asignaturasMatriculadas21.add(asignatura);
                    }else if(asignatura.getCuatrimestre() == 2){
                        asignaturasMatriculadas22.add(asignatura);
                    } 
                }else if(asignatura.getCurso().equals("3")){
                    if(asignatura.getCuatrimestre() == 1){
                        asignaturasMatriculadas31.add(asignatura);
                    }else if(asignatura.getCuatrimestre() == 2){
                        asignaturasMatriculadas32.add(asignatura);
                    } 
                }else if(asignatura.getCurso().equals("4")){
                    if(asignatura.getCuatrimestre() == 1){
                        asignaturasMatriculadas41.add(asignatura);
                    }else if(asignatura.getCuatrimestre() == 2){
                        asignaturasMatriculadas42.add(asignatura);
                    } 
                }
            } 

            request.setAttribute("Asignaturas Matriculadas 11", asignaturasMatriculadas11);
            request.setAttribute("Asignaturas Matriculadas 12", asignaturasMatriculadas12);
            request.setAttribute("Asignaturas Matriculadas 21", asignaturasMatriculadas21);
            request.setAttribute("Asignaturas Matriculadas 22", asignaturasMatriculadas22);
            request.setAttribute("Asignaturas Matriculadas 31", asignaturasMatriculadas31);
            request.setAttribute("Asignaturas Matriculadas 32", asignaturasMatriculadas32);
            request.setAttribute("Asignaturas Matriculadas 41", asignaturasMatriculadas41);
            request.setAttribute("Asignaturas Matriculadas 42", asignaturasMatriculadas42);

            request.getRequestDispatcher("/jsp/estudiante.jsp").forward(request, response);
        }catch (SQLException| NamingException e ){
            response.sendError(500);
        } 
        
    } 

    /*public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

        HttpSession session = request.getSession();
        
    } */
} 