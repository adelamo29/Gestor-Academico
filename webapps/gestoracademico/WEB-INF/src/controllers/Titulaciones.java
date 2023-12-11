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

@WebServlet("/titulaciones")
public class Titulaciones extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        HttpSession session = request.getSession();

        

        try(DBManager db = new DBManager()){
           
            List<Asignatura> titulaciones = db.buscarTitulaciones();
            request.setAttribute("TITULACIONES", titulaciones);
            
        }catch (SQLException| NamingException e ){
            response.sendError(500);
        } 

        request.getRequestDispatcher("/jsp/titulaciones.jsp").forward(request, response);
    } 

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

        HttpSession session = request.getSession();
        
    } 
} 
