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

@WebServlet("/recomendador")

public class Recomendador extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        HttpSession session = request.getSession();

        //Recogemos el usuario que se ha logeado anteriormente
        Usuario usuario_log = (Usuario)session.getAttribute("Usuario");
        
        //Cogemos los parametros que se envia a traves de la URL
        String nombre_asignatura = request.getParameter("asignatura");
        String id = request.getParameter("id");
        int id_asignatura = Integer.parseInt(id);

        

        try(DBManager db = new DBManager()){ 

            //Buscamos los requisitos (pre y post) de la asignatura pinchada
            List<Asignatura> requisitos = db.buscarRequisitos(usuario_log.getId(), id_asignatura);
            
            List<Asignatura> preRequisitos = new ArrayList<Asignatura>();
            List<Asignatura> postRequisitos = new ArrayList<Asignatura>();
            
            for (Asignatura asignatura: requisitos){

                if(asignatura.getTipo().equals("PRE")){
                    preRequisitos.add(asignatura);
                }else if(asignatura.getTipo().equals("POST")){
                    postRequisitos.add(asignatura);
                } 
            } 

            request.setAttribute("Prerrequisitos", preRequisitos);
            request.setAttribute("PostRequisitos", postRequisitos);
            //Sacamos la informacion historica de la asignatura para mostrarla en graficos (nota, asistencia y participacion)
            

            //Buscamos la informacion acerca de la asignatura pinchada en relacion al usuario
            Asignatura asignaturaClick = db.buscarAsignatura(usuario_log.getId(),nombre_asignatura);
            request.setAttribute("Asignatura click", asignaturaClick);
            List<Asignatura> notaHistTitulacion = db.notaAsigTitulacion(usuario_log.getTitulacion(), nombre_asignatura);
            request.setAttribute("NOTA MEDIA POR ANIO TITULACION", notaHistTitulacion);
            List<Asignatura> participacionHistTitulacion = db.participacionAsigTitulacion(usuario_log.getTitulacion(), nombre_asignatura);
            request.setAttribute("PARTICIPACION MEDIA POR ANIO TITULACION", participacionHistTitulacion);
            List<Asignatura> asistenciaHistTitulacion = db.asistenciaAsigTitulacion(usuario_log.getTitulacion(), nombre_asignatura);
            request.setAttribute("ASISTENCIA MEDIA POR ANIO TITULACION", asistenciaHistTitulacion);

            //Buscamos informacion en el año en el que el alumno curso o esta cursando la asisgnatura 
            Asignatura infoAsigAnio = db.datosAnioAsignatura(usuario_log.getTitulacion(),id_asignatura, asignaturaClick.getFecha());
            request.setAttribute("Info Asignatura Fecha", infoAsigAnio); 
            

            request.getRequestDispatcher("/jsp/recomendador.jsp").forward(request, response);
        }catch (SQLException| NamingException e ){
            response.sendError(500);
        }
    } 

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

        HttpSession session = request.getSession();
        
    } 
} 