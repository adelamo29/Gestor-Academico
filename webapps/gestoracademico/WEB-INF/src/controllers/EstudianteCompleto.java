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

@WebServlet("/estudianteCompleto")

public class EstudianteCompleto extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        HttpSession session = request.getSession();

        //Recogemos el atributo usuario guardado en la sesion
        Usuario usuario_log = (Usuario)session.getAttribute("Usuario");

        try(DBManager db = new DBManager()){
            
            //Lista para guardar todas las asignaturas de la titulacion correspondiente al usuario
            //Se llama al metodo buscar asignaturas del DBManager
            List<Asignatura> asignaturasTitulacion = db.buscarAsignaturasTitulacion(usuario_log.getId());

            //Distintas listas para filtrar asignaturas por curso y cuatrimestre
            List<Asignatura> asignaturasTitulacion11 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasTitulacion12 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasTitulacion21 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasTitulacion22 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasTitulacion31 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasTitulacion32 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasTitulacion41 = new ArrayList<Asignatura>();
            List<Asignatura> asignaturasTitulacion42 = new ArrayList<Asignatura>();
            
            for (Asignatura asignatura: asignaturasTitulacion){
                if(asignatura.getCurso().equals("1")){
                    if(asignatura.getCuatrimestre() == 1){
                        asignaturasTitulacion11.add(asignatura);
                    }else if(asignatura.getCuatrimestre() == 2){
                        asignaturasTitulacion12.add(asignatura);
                    } 
                }else if(asignatura.getCurso().equals("2")){
                    if(asignatura.getCuatrimestre() == 1){
                        asignaturasTitulacion21.add(asignatura);
                    }else if(asignatura.getCuatrimestre() == 2){
                        asignaturasTitulacion22.add(asignatura);
                    } 
                }else if(asignatura.getCurso().equals("3")){
                    if(asignatura.getCuatrimestre() == 1){
                        asignaturasTitulacion31.add(asignatura);
                    }else if(asignatura.getCuatrimestre() == 2){
                        asignaturasTitulacion32.add(asignatura);
                    } 
                }else if(asignatura.getCurso().equals("4")){
                    if(asignatura.getCuatrimestre() == 1){
                        asignaturasTitulacion41.add(asignatura);
                    }else if(asignatura.getCuatrimestre() == 2){
                        asignaturasTitulacion42.add(asignatura);
                    } 
                }
            } 

            request.setAttribute("Asignaturas Titulacion 11", asignaturasTitulacion11);
            request.setAttribute("Asignaturas Titulacion 12", asignaturasTitulacion12);
            request.setAttribute("Asignaturas Titulacion 21", asignaturasTitulacion21);
            request.setAttribute("Asignaturas Titulacion 22", asignaturasTitulacion22);
            request.setAttribute("Asignaturas Titulacion 31", asignaturasTitulacion31);
            request.setAttribute("Asignaturas Titulacion 32", asignaturasTitulacion32);
            request.setAttribute("Asignaturas Titulacion 41", asignaturasTitulacion41);
            request.setAttribute("Asignaturas Titulacion 42", asignaturasTitulacion42);

            request.getRequestDispatcher("/jsp/estudianteCompleto.jsp").forward(request, response);
        }catch (SQLException| NamingException e ){
            response.sendError(500);
        } 
        
    } 

    /*public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

        HttpSession session = request.getSession();
        
    } */
} 