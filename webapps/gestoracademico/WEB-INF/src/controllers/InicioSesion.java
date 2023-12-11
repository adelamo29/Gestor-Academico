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

import gestoracademico.*;

@WebServlet("/inicioSesion")

public class InicioSesion extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        RequestDispatcher rd = request.getRequestDispatcher("/jsp/inicioSesion.jsp");
        rd.forward(request,response);
    } 

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

        HttpSession session = request.getSession();

        //Cogemos parametros introducidos en el formulario de Inicio Sesion
        String userName = request.getParameter("userName");
        String clave = request.getParameter("clave");

        //Creamos nuevo usuario donde se guardara la info de la query
        Usuario usuario = new Usuario();

        try(DBManager db = new DBManager()){
            //Buscamos en la base de datos el Usuario(id, nombre, clave, tipo) a traves del nombre y clave
            usuario = db.searchUser(userName,clave);

            //Segun el tipo de usuario mandara a una vista u otra
            if(usuario.getTipo().equals("Estudiante")){

                usuario.setTitulacion(db.buscarTitulacion(usuario.getId()));

                session.setAttribute("Usuario",usuario);
                
                response.sendRedirect("estudiante");
            
            }else if(usuario.getTipo().equals("Profesor")){
                
                session.setAttribute("Usuario",usuario);

                response.sendRedirect("profesor");

            }else if(usuario.getTipo().equals("Gestor")){
                
                session.setAttribute("Usuario",usuario);

                response.sendRedirect("gestor");

            }else if(usuario.getTipo().equals("Administrador")){
                
                session.setAttribute("Usuario",usuario);

                response.sendRedirect("administrador");

            }else{

            } 
        }catch (SQLException| NamingException e) {
            response.sendError(500);
        } 
    } 
} 

