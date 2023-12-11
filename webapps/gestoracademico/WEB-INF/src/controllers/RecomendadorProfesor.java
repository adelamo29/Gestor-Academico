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

@WebServlet("/recomendadorProfesor")

public class RecomendadorProfesor extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        HttpSession session = request.getSession();

        Usuario estudiante = new Usuario();

        String nomEstudiante = (String)session.getAttribute("nomEstudiante");
        

        //Cogemos los parametros que se envia a traves de la URL
        String nombre_asignatura = request.getParameter("asignaturaEst");
        String id = request.getParameter("idEst");
        int id_asignatura = Integer.parseInt(id);

        try(DBManager db = new DBManager()){ 

            //Buscamos en la base de datos la info, en especial el ID
            estudiante = db.buscarEstudiante(nomEstudiante);
            System.out.println(estudiante.getId());
            //Buscamos la titulacion
            estudiante.setTitulacion(db.buscarTitulacion(estudiante.getId()));
            System.out.println(estudiante.getTitulacion());

            //Buscamos los requisitos (pre y post) de la asignatura pinchada
            List<Asignatura> requisitos = db.buscarRequisitos(estudiante.getId(), id_asignatura);
            
            List<Asignatura> preRequisitos = new ArrayList<Asignatura>();
            List<Asignatura> postRequisitos = new ArrayList<Asignatura>();
            
            for (Asignatura asignatura: requisitos){

                if(asignatura.getTipo().equals("PRE")){
                    preRequisitos.add(asignatura);
                }else if(asignatura.getTipo().equals("POST")){
                    postRequisitos.add(asignatura);
                } 
            } 

            request.setAttribute("PrerrequisitosProf", preRequisitos);
            request.setAttribute("PostRequisitosProf", postRequisitos);
            //Sacamos la informacion historica de la asignatura para mostrarla en graficos (nota, asistencia y participacion)
            

            //Buscamos la informacion acerca de la asignatura pinchada en relacion al usuario
            Asignatura asignaturaClick = db.buscarAsignatura(estudiante.getId(),nombre_asignatura);
            request.setAttribute("AsignaturaclickProf", asignaturaClick);
            List<Asignatura> notaHistTitulacion = db.notaAsigTitulacion(estudiante.getTitulacion(), nombre_asignatura);
            request.setAttribute("NOTAMEDIAPORANIOTITULACIONProf", notaHistTitulacion);
            List<Asignatura> participacionHistTitulacion = db.participacionAsigTitulacion(estudiante.getTitulacion(), nombre_asignatura);
            request.setAttribute("PARTICIPACIONMEDIAPORANIOTITULACIONProf", participacionHistTitulacion);
            List<Asignatura> asistenciaHistTitulacion = db.asistenciaAsigTitulacion(estudiante.getTitulacion(), nombre_asignatura);
            request.setAttribute("ASISTENCIAMEDIAPORANIOTITULACIONProf", asistenciaHistTitulacion);

            //Buscamos informacion en el año en el que el alumno curso o esta cursando la asisgnatura 
            Asignatura infoAsigAnio = db.datosAnioAsignatura(estudiante.getTitulacion(),id_asignatura, asignaturaClick.getFecha());
            request.setAttribute("InfoAsignaturaFechaProf", infoAsigAnio); 
            

            request.getRequestDispatcher("/jsp/recomendadorProfesor.jsp").forward(request, response);
        }catch (SQLException| NamingException e ){
            response.sendError(500);
        }
    } 

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

        HttpSession session = request.getSession();
        
    } 
} 