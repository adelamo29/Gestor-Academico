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
import java.util.List;

import javax.servlet.*;

import gestoracademico.*;

@WebServlet("/profesor")
public class Profesor extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        HttpSession session = request.getSession();

        //Recogemos el atributo usuario guardado en la sesion
        Usuario profesor = (Usuario)session.getAttribute("Usuario");

        try(DBManager db = new DBManager()){
            List<Asignatura> asignaturasImpartidas = db.buscarAsignaturasImpartidas(profesor.getId());

            request.setAttribute("ASIGNATURAS IMPARTIDAS", asignaturasImpartidas);
        }catch (SQLException| NamingException e ){
            response.sendError(500);
        } 

        request.getRequestDispatcher("/jsp/profesor.jsp").forward(request, response);
    } 

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

        HttpSession session = request.getSession();
        
    } 
} 