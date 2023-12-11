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

@WebServlet("/infoTitulacion")

public class InfoTitulacion extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        HttpSession session = request.getSession();
        
        //Cogemos los parametros que se envia a traves de la URL
        String id = request.getParameter("id");
        int id_titulacion = Integer.parseInt(id);


        try(DBManager db = new DBManager()){ 

            //Sacamos la informacion historica de la asignatura para mostrarla en graficos (nota, asistencia y participacion)

            List<Asignatura> top5Notas = db.top5mejoreNotas(id_titulacion);
            request.setAttribute("TOP 5 MEJORES NOTAS", top5Notas);
            List<Asignatura> top5Asis = db.top5mejoreAsis(id_titulacion);
            request.setAttribute("TOP 5 MEJORES ASISTENCIA", top5Asis);
            List<Asignatura> top5Par = db.top5mejorePar(id_titulacion);
            request.setAttribute("TOP 5 MEJORES PARTICIPACION", top5Par);

            List<Asignatura> topPeorNotas = db.top5peoresNotas(id_titulacion);
            request.setAttribute("TOP 5 PEORES NOTAS", topPeorNotas);
            List<Asignatura> topPeorAsis = db.top5peoresAsis(id_titulacion);
            request.setAttribute("TOP 5 PEORES ASISTENCIA", topPeorAsis);
            List<Asignatura> topPeorPar = db.top5peoresPar(id_titulacion);
            request.setAttribute("TOP 5 PEORES PARTICIPACION", topPeorPar);

            List<Asignatura> notasHist = db.notasHistTitulacion(id_titulacion);
            request.setAttribute("NOTAS HISTORICAS", notasHist);
            List<Asignatura> asistenciaHist = db.asistenciaHistTitulacion(id_titulacion);
            request.setAttribute("ASISTENCIA HISTORICA", asistenciaHist);
            List<Asignatura> participarHist = db.participarHistTitulacion(id_titulacion);
            request.setAttribute("PARTICIPACION HISTORICA", participarHist);
            
            request.getRequestDispatcher("/jsp/infoTitulacion.jsp").forward(request, response);
        }catch (SQLException| NamingException e ){
            response.sendError(500);
        }
    } 

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

        HttpSession session = request.getSession();
        
    } 
}
