package gestoracademico;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.*;
import javax.sql.*;
import java.lang.Math.*;

public class DBManager implements AutoCloseable{

    private Connection connection;

    
    public DBManager() throws SQLException, NamingException{    
        connect();
    }

    private void connect() throws SQLException, NamingException{    
        Context initCtx = new InitialContext();    
        Context envCtx = (Context) initCtx.lookup("java:comp/env");    
        DataSource ds = (DataSource) envCtx.lookup("jdbc/gestoracademico");    
        connection = ds.getConnection();
    }

    /**
     * Close the connection to the database if it is still open.
     *
     */
    public void close() throws SQLException {
        if (connection != null) {
            connection.close();
        }
        connection = null;
    }

    /*FUNCION PARA BUSCAR USUARIO EN LA BASE DE DATOS
    
    ARGUMENTOS DE ENTRADA
        String userName: valor introducido en el formulario de Inicio Sesion
        String clave: valor introducido en el formulario de Inicio Sesion

    ARGUMENTO DE SALIDA
        Usuario usuario: objeto de tipo Usuario rellenado con los datos sacados a traves de la query
    */
    public Usuario searchUser(String userName, String clave) throws SQLException{

        //String query = "SELECT USUARIO.ID AS \"ID\", USUARIO.NOMBRE AS \"NOMBRE\", USUARIO.CLAVE AS \"CLAVE\", USUARIO.TIPO AS \"TIPO\", TITULACION.NOMBRE AS \"NOMBRE_TITULACION\" FROM USUARIO INNER JOIN REL_USUARIO_TITULACION ON USUARIO.ID = REL_USUARIO_TITULACION.ID_USUARIO INNER JOIN TITULACION ON REL_USUARIO_TITULACION.ID_TITULACION = TITULACION.ID WHERE USUARIO.NOMBRE = ? AND CLAVE = ?";
        String query = "SELECT USUARIO.ID AS \"ID\", USUARIO.NOMBRE AS \"NOMBRE\", USUARIO.CLAVE AS \"CLAVE\", USUARIO.TIPO AS \"TIPO\" FROM USUARIO WHERE USUARIO.NOMBRE = ? AND CLAVE = ?";

        Usuario usuario = new Usuario();

        try(PreparedStatement st = connection.prepareStatement(query)){
            st.setString(1,userName);
            st.setString(2,clave);

            ResultSet rs = st.executeQuery();

            if(rs.next()){
                usuario.setId(rs.getInt("ID"));
                usuario.setNombre(rs.getString("NOMBRE"));
                usuario.setClave(rs.getString("CLAVE"));
                usuario.setTipo(rs.getString("TIPO"));
            } 
        } 

        return usuario;
    } 


    /*FUNCION PARA BUSCAR LA TITULACION CORRESPONDIENTE A UN USUARIO

    ARGUMENTOS DE ENTRADA   
        int id_usuario: id del usuario para filtrar correctamente

    ARGUMENTO DE SALIDA
        String Titulacion: nombre de la titulacion del estudiante
    */
    public String buscarTitulacion(int id_usuario) throws SQLException{

        String query = "select TITULACION.NOMBRE as \"NOMBRE\" from titulacion inner join rel_usuario_titulacion on TITULACION.ID=REL_USUARIO_TITULACION.ID_TITULACION where ID_USUARIO= ?";

        String nombre_titulacion ="";

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_usuario);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                nombre_titulacion = rs.getString("NOMBRE");
            } 
        }

        return nombre_titulacion;
    
    }

    /*FUNCION PARA BUSCAR TODAS LAS ASIGNATURAS DE UNA TITULACION SEGUN EL USUARIO

    ARGUMENTOS DE ENTRADA   
        int id_usuario: id del usuario para filtrar correctamente

    ARGUMENTO DE SALIDA
        Lista con todas las asignaturas de la titulacion
    */
    public List<Asignatura> buscarAsignaturasTitulacion(int id_usuario) throws SQLException{

        //String query = "SELECT ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\", ASIGNATURA.CURSO AS \"CURSO\", ASIGNATURA.CUATRIMESTRE AS \"CUATRIMESTRE\", ASIGNATURA.ID AS \"ID ASIGNATURA\" FROM REL_USUARIO_ASIG INNER JOIN ASIGNATURA ON ID_ASIGNATURA = ASIGNATURA.ID WHERE ID_USUARIO = ?";
        //SELECT ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\", ASIGNATURA.CURSO AS \"CURSO\", ASIGNATURA.CUATRIMESTRE AS \"CUATRIMESTRE\", ASIGNATURA.ID AS \"ID ASIGNATURA\", ASIGNATURA.TIPO AS \"TIPO ASIGNATURA\" FROM TITULACION INNER JOIN REL_TITULACION_ASIGNATURA ON ID = REL_TITULACION_ASIGNATURA.ID_TITULACION INNER JOIN ASIGNATURA ON ID_ASIGNATURA = ASIGNATURA.ID;
        String query = "SELECT ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\", ASIGNATURA.CURSO AS \"CURSO\", ASIGNATURA.CUATRIMESTRE AS \"CUATRIMESTRE\", ASIGNATURA.ID AS \"ID ASIGNATURA\", ASIGNATURA.TIPO AS \"TIPO ASIGNATURA\" FROM USUARIO INNER JOIN REL_USUARIO_TITULACION ON USUARIO.ID = REL_USUARIO_TITULACION.ID_USUARIO INNER JOIN TITULACION ON ID_TITULACION = TITULACION.ID INNER JOIN REL_TITULACION_ASIGNATURA ON TITULACION.ID = REL_TITULACION_ASIGNATURA.ID_TITULACION INNER JOIN ASIGNATURA ON ID_ASIGNATURA = ASIGNATURA.ID WHERE USUARIO.ID = ?";

        List<Asignatura> asignaturasUsuario = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_usuario);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setNombre(rs.getString("NOMBRE ASIGNATURA"));
                asignatura.setCurso(rs.getString("CURSO"));
                asignatura.setCuatrimestre(rs.getInt("CUATRIMESTRE"));
                asignatura.setId(rs.getInt("ID ASIGNATURA"));
                asignatura.setTipo(rs.getString("TIPO ASIGNATURA"));

                asignaturasUsuario.add(asignatura);
                
            } 
        } 

        return asignaturasUsuario;
    } 

    /*FUNCION PARA BUSCAR TODAS LAS ASIGNATURAS IMPARTIDAS POR UN PROFESOR

    ARGUMENTOS DE ENTRADA   
        int id_usuario: id del usuario para filtrar correctamente

    ARGUMENTO DE SALIDA
        Lista con todas las asignaturas impartidas por el profesor
    */
    public List<Asignatura> buscarAsignaturasImpartidas(int id_usuario) throws SQLException{

        String query = "select TITULACION.NOMBRE as \"NOMBRE TITULACION\", ASIGNATURA.NOMBRE as \"NOMBRE ASIGNATURA\", ASIGNATURA.ID as \"ID\", ASIGNATURA.CURSO as \"CURSO\", ASIGNATURA.CUATRIMESTRE as \"CUATRIMESTRE\", ASIGNATURA.TIPO as \"TIPO\", ASIGNATURA.CREDITOS as \"CREDITOS\", REL_PROFESOR_ASIG.FECHA as \"FECHA\" \r\n" + //
                "from asignatura\r\n" + //
                "inner join REL_PROFESOR_ASIG on ASIGNATURA.ID = REL_PROFESOR_ASIG.ID_ASIGNATURA\r\n" + //
                "inner join titulacion on REL_PROFESOR_ASIG.ID_TITULACION = TITULACION.ID \r\n" + //
                "where ID_USUARIO = ?";

        List<Asignatura> asignaturasUsuario = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_usuario);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setTitulacion(rs.getString("NOMBRE TITULACION"));
                asignatura.setNombre(rs.getString("NOMBRE ASIGNATURA"));
                asignatura.setId(rs.getInt("ID"));
                asignatura.setCurso(rs.getString("CURSO"));
                asignatura.setCuatrimestre(rs.getInt("CUATRIMESTRE"));
                asignatura.setTipo(rs.getString("TIPO"));
                asignatura.setCreditos(rs.getInt("CREDITOS"));
                asignatura.setFecha(rs.getString("FECHA"));

                asignaturasUsuario.add(asignatura);
                
            } 
        } 

        return asignaturasUsuario;
    } 

    /*FUNCION PARA BUSCAR TODAS LAS ASIGNATURAS CURSADAS O MATRICULADAS DE UN ESTUDIANTE

    ARGUMENTOS DE ENTRADA   
        int id_usuario: id del usuario para filtrar correctamente

    ARGUMENTO DE SALIDA
        Lista con todas las asignaturas cursadas/matriculadas
    */
    public List<Asignatura> buscarAsignaturasMatriculadas(int id_usuario) throws SQLException{

        String query = "SELECT ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\", ASIGNATURA.CURSO AS \"CURSO\", ASIGNATURA.CUATRIMESTRE AS \"CUATRIMESTRE\", ASIGNATURA.ID AS \"ID ASIGNATURA\", ASIGNATURA.TIPO AS \"TIPO ASIGNATURA\", REL_USUARIO_ASIG.NOTA AS \"NOTA\", REL_USUARIO_ASIG.PARTICIPAR AS \"PARTICIPACION\",REL_USUARIO_ASIG.ASISTENCIA AS \"ASISTENCIA\" FROM REL_USUARIO_ASIG INNER JOIN ASIGNATURA ON ID_ASIGNATURA = ASIGNATURA.ID WHERE ID_USUARIO = ?";
        //SELECT ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\", ASIGNATURA.CURSO AS \"CURSO\", ASIGNATURA.CUATRIMESTRE AS \"CUATRIMESTRE\", ASIGNATURA.ID AS \"ID ASIGNATURA\", ASIGNATURA.TIPO AS \"TIPO ASIGNATURA\" FROM TITULACION INNER JOIN REL_TITULACION_ASIGNATURA ON ID = REL_TITULACION_ASIGNATURA.ID_TITULACION INNER JOIN ASIGNATURA ON ID_ASIGNATURA = ASIGNATURA.ID;
        //String query = "SELECT ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\", ASIGNATURA.CURSO AS \"CURSO\", ASIGNATURA.CUATRIMESTRE AS \"CUATRIMESTRE\", ASIGNATURA.ID AS \"ID ASIGNATURA\", ASIGNATURA.TIPO AS \"TIPO ASIGNATURA\" FROM USUARIO INNER JOIN REL_USUARIO_TITULACION ON USUARIO.ID = REL_USUARIO_TITULACION.ID_USUARIO INNER JOIN TITULACION ON ID_TITULACION = TITULACION.ID INNER JOIN REL_TITULACION_ASIGNATURA ON TITULACION.ID = REL_TITULACION_ASIGNATURA.ID_TITULACION INNER JOIN ASIGNATURA ON ID_ASIGNATURA = ASIGNATURA.ID WHERE USUARIO.ID = ?";

        List<Asignatura> asignaturasUsuario = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_usuario);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setNombre(rs.getString("NOMBRE ASIGNATURA"));
                asignatura.setCurso(rs.getString("CURSO"));
                asignatura.setCuatrimestre(rs.getInt("CUATRIMESTRE"));
                asignatura.setId(rs.getInt("ID ASIGNATURA"));
                asignatura.setTipo(rs.getString("TIPO ASIGNATURA"));
                asignatura.setNota(rs.getString("NOTA"));
                asignatura.setParticipacion(rs.getString("PARTICIPACION"));
                asignatura.setAsistencia(rs.getInt("ASISTENCIA"));

                asignaturasUsuario.add(asignatura);
                
            } 
        } 

        return asignaturasUsuario;
    }

    public Double notaMediaAsignatura(String nombre_asignatura, String nombre_titulacion) throws SQLException{

        String query = "SELECT AVG(NOTA) AS \"MEDIA_NOTA\" FROM TITULACION INNER JOIN REL_TITULACION_ASIGNATURA ON TITULACION.ID = REL_TITULACION_ASIGNATURA.ID_TITULACION INNER JOIN ASIGNATURA ON REL_TITULACION_ASIGNATURA.ID_ASIGNATURA=ASIGNATURA.ID INNER JOIN REL_USUARIO_ASIG ON ASIGNATURA.ID=REL_USUARIO_ASIG.ID_ASIGNATURA WHERE TITULACION.NOMBRE =  ? AND ASIGNATURA.NOMBRE = ? GROUP BY ASIGNATURA.ID";

        Double nota_media = 0.00;

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setString(1,nombre_titulacion);
            st.setString(2,nombre_asignatura);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                nota_media = rs.getDouble("MEDIA_NOTA");
            } 
        } 

        nota_media = Math.round(nota_media*100.0)/100.0;

        return nota_media;
    
    }

    public Double participacionMediaAsignatura(String nombre_asignatura, String nombre_titulacion) throws SQLException{

        String query = "SELECT AVG(PARTICIPAR) AS \"MEDIA_PARTICIPACION\" FROM TITULACION INNER JOIN REL_TITULACION_ASIGNATURA ON TITULACION.ID = REL_TITULACION_ASIGNATURA.ID_TITULACION INNER JOIN ASIGNATURA ON REL_TITULACION_ASIGNATURA.ID_ASIGNATURA=ASIGNATURA.ID INNER JOIN REL_USUARIO_ASIG ON ASIGNATURA.ID=REL_USUARIO_ASIG.ID_ASIGNATURA WHERE TITULACION.NOMBRE =  ? AND ASIGNATURA.NOMBRE = ? GROUP BY ASIGNATURA.ID";

        Double participacion_media = 0.00;

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setString(1,nombre_titulacion);
            st.setString(2,nombre_asignatura);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                participacion_media = rs.getDouble("MEDIA_PARTICIPACION");
            } 
        }

        participacion_media = Math.round(participacion_media*100.0)/100.0; 

        return participacion_media;
    
    }

    public Double asistenciaMediaAsignatura(String nombre_asignatura, String nombre_titulacion) throws SQLException{

        String query = "SELECT AVG(ASISTENCIA) AS \"MEDIA_ASISTENCIA\" FROM TITULACION INNER JOIN REL_TITULACION_ASIGNATURA ON TITULACION.ID = REL_TITULACION_ASIGNATURA.ID_TITULACION INNER JOIN ASIGNATURA ON REL_TITULACION_ASIGNATURA.ID_ASIGNATURA=ASIGNATURA.ID INNER JOIN REL_USUARIO_ASIG ON ASIGNATURA.ID=REL_USUARIO_ASIG.ID_ASIGNATURA WHERE TITULACION.NOMBRE =  ? AND ASIGNATURA.NOMBRE = ? GROUP BY ASIGNATURA.ID";

        Double asistencia_media = 0.00;

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setString(1,nombre_titulacion);
            st.setString(2,nombre_asignatura);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                asistencia_media = rs.getDouble("MEDIA_ASISTENCIA");
            } 
        } 

        asistencia_media = Math.round(asistencia_media*100.0)/100.0; 

        return asistencia_media;
    
    }

    public List<Asignatura> buscarRequisitos(int id_usuario, int id_asignatura) throws SQLException{

        String query = "SELECT ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\", ASIGNATURA.ID AS \"ID\", REL_USUARIO_ASIG.NOTA AS \"NOTA\", REL_USUARIO_ASIG.PARTICIPAR AS \"PARTICIPACION\", REL_USUARIO_ASIG.ASISTENCIA AS \"ASISTENCIA\", REL_ASIGNATURAS.TIPO AS \"TIPO\", ASIGNATURA.CREDITOS AS \"CREDITOS\" FROM REL_ASIGNATURAS INNER JOIN ASIGNATURA ON ID_ASIGNATURA_RELACIONADA =ASIGNATURA.ID INNER JOIN REL_USUARIO_ASIG ON ID_ASIGNATURA_RELACIONADA = REL_USUARIO_ASIG.ID_ASIGNATURA WHERE ID_USUARIO=? AND REL_ASIGNATURAS.ID_ASIGNATURA =?";

        List<Asignatura> requisitos = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_usuario);
            st.setInt(2,id_asignatura);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setNombre(rs.getString("NOMBRE ASIGNATURA"));
                asignatura.setId(rs.getInt("ID"));
                asignatura.setNota(rs.getString("NOTA"));
                asignatura.setParticipacion(rs.getString("PARTICIPACION"));
                asignatura.setAsistencia(rs.getInt("ASISTENCIA"));
                asignatura.setTipo(rs.getString("TIPO"));
                asignatura.setCreditos(rs.getInt("CREDITOS"));

                requisitos.add(asignatura);
                
            } 
        } 

        return requisitos;
    
    } 

    public List<Asignatura> notaAsigTitulacion(String nombre_titulacion, String nombre_asignatura) throws SQLException{

        String query = "SELECT AVG(NOTA) AS \"NOTA MEDIA\", FECHA, TITULACION.NOMBRE AS \"TITULACION\" FROM TITULACION \r\n" + //
                "INNER JOIN REL_TITULACION_ASIGNATURA ON TITULACION.ID = REL_TITULACION_ASIGNATURA.ID_TITULACION\r\n" + //
                "INNER JOIN REL_USUARIO_ASIG ON TITULACION.ID = REL_USUARIO_ASIG.ID_TITULACION \r\n" + //
                "inner join asignatura on REL_USUARIO_ASIG.ID_ASIGNATURA = ASIGNATURA.ID \r\n" + //
                "WHERE TITULACION.NOMBRE = ? AND ASIGNATURA.NOMBRE  = ?\r\n" + //
                "GROUP BY FECHA\r\n" + //
                "order by FECHA;";

        List<Asignatura> infoNotas = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setString(1,nombre_titulacion);
            st.setString(2,nombre_asignatura);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setNotaMedia(Math.round(rs.getDouble("NOTA MEDIA")*100.0)/100.0);
                asignatura.setFecha(rs.getString("FECHA"));
                asignatura.setTitulacion(rs.getString("TITULACION"));
                
                infoNotas.add(asignatura);
                
            } 
        } 

        return infoNotas;
    
    }

    public List<Asignatura> participacionAsigTitulacion(String nombre_titulacion, String nombre_asignatura) throws SQLException{

        String query = "SELECT AVG(PARTICIPAR) AS \"PARTICIPACION MEDIA\", FECHA, TITULACION.NOMBRE AS \"TITULACION\" FROM TITULACION \r\n" + //
                "INNER JOIN REL_TITULACION_ASIGNATURA ON TITULACION.ID = REL_TITULACION_ASIGNATURA.ID_TITULACION\r\n" + //
                "INNER JOIN REL_USUARIO_ASIG ON TITULACION.ID = REL_USUARIO_ASIG.ID_TITULACION \r\n" + //
                "inner join asignatura on REL_USUARIO_ASIG.ID_ASIGNATURA = ASIGNATURA.ID \r\n" + //
                "WHERE TITULACION.NOMBRE = ? AND ASIGNATURA.NOMBRE  = ?\r\n" + //
                "GROUP BY FECHA\r\n" + //
                "order by FECHA;";

        List<Asignatura> infoNotas = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setString(1,nombre_titulacion);
            st.setString(2,nombre_asignatura);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setParticipacionMedia(Math.round(rs.getDouble("PARTICIPACION MEDIA")*100.0)/100.0);
                asignatura.setFecha(rs.getString("FECHA"));
                asignatura.setTitulacion(rs.getString("TITULACION"));

                infoNotas.add(asignatura);
                
            } 
        } 

        return infoNotas;
    
    }
    

    public List<Asignatura> asistenciaAsigTitulacion(String nombre_titulacion, String nombre_asignatura) throws SQLException{

        String query = "SELECT AVG(ASISTENCIA) AS \"ASISTENCIA MEDIA\", FECHA, TITULACION.NOMBRE AS \"TITULACION\" FROM TITULACION \r\n" + //
                "INNER JOIN REL_TITULACION_ASIGNATURA ON TITULACION.ID = REL_TITULACION_ASIGNATURA.ID_TITULACION\r\n" + //
                "INNER JOIN REL_USUARIO_ASIG ON TITULACION.ID = REL_USUARIO_ASIG.ID_TITULACION \r\n" + //
                "inner join asignatura on REL_USUARIO_ASIG.ID_ASIGNATURA = ASIGNATURA.ID \r\n" + //
                "WHERE TITULACION.NOMBRE = ? AND ASIGNATURA.NOMBRE  = ?\r\n" + //
                "GROUP BY FECHA\r\n" + //
                "order by FECHA;";

        List<Asignatura> infoNotas = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setString(1,nombre_titulacion);
            st.setString(2,nombre_asignatura);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setAsistenciaMedia(Math.round(rs.getDouble("ASISTENCIA MEDIA")*100.0)/100.0);
                asignatura.setFecha(rs.getString("FECHA"));
                asignatura.setTitulacion(rs.getString("TITULACION"));

                infoNotas.add(asignatura);
                
            } 
        } 

        return infoNotas;
    
    }

    //Busca todas notas de una asignatura en una titulacion especifica en un determinado año
    public List<String> buscarNotasAsig(String nombre_titulacion, int id_asignatura, String fecha) throws SQLException{

        String query = "select rel_usuario_asig.NOTA AS \"NOTA\"  from rel_profesor_asig \r\n" + //
                "inner join rel_usuario_asig on REL_PROFESOR_ASIG.ID_ASIGNATURA  = rel_usuario_asig.ID_ASIGNATURA\r\n" + //
                "inner join titulacion on REL_PROFESOR_ASIG.ID_TITULACION = TITULACION.ID\r\n" + //
                "where titulacion.nombre = ? and REL_PROFESOR_ASIG.ID_ASIGNATURA = ? and rel_usuario_asig.FECHA  = ?;";

        List<String> notas = new ArrayList<String>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setString(1,nombre_titulacion);
            st.setInt(2,id_asignatura);
            st.setString(3,fecha);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                String nota = "";

                nota = rs.getString("NOTA");
                
                notas.add(nota);
                
            } 
        } 

        return notas;
    
    }

    //Busca todas notas de una asignatura en una titulacion especifica en un determinado año
    public List<String> buscarAsistenciaAsig(String nombre_titulacion, int id_asignatura, String fecha) throws SQLException{

        String query = "select rel_usuario_asig.ASISTENCIA AS \"ASISTENCIA\"  from rel_profesor_asig \r\n" + //
                "inner join rel_usuario_asig on REL_PROFESOR_ASIG.ID_ASIGNATURA  = rel_usuario_asig.ID_ASIGNATURA\r\n" + //
                "inner join titulacion on REL_PROFESOR_ASIG.ID_TITULACION = TITULACION.ID\r\n" + //
                "where titulacion.nombre = ? and REL_PROFESOR_ASIG.ID_ASIGNATURA = ? and rel_usuario_asig.FECHA  = ?;";

        List<String> notas = new ArrayList<String>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setString(1,nombre_titulacion);
            st.setInt(2,id_asignatura);
            st.setString(3,fecha);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                String nota = "";

                nota = rs.getString("ASISTENCIA");
                
                notas.add(nota);
                
            } 
        } 

        return notas;
    
    }

    //Busca todas notas de una asignatura en una titulacion especifica en un determinado año
    public List<String> buscarParticipacionAsig(String nombre_titulacion, int id_asignatura, String fecha) throws SQLException{

        String query = "select rel_usuario_asig.PARTICIPAR AS \"PARTICIPAR\"  from rel_profesor_asig \r\n" + //
                "inner join rel_usuario_asig on REL_PROFESOR_ASIG.ID_ASIGNATURA  = rel_usuario_asig.ID_ASIGNATURA\r\n" + //
                "inner join titulacion on REL_PROFESOR_ASIG.ID_TITULACION = TITULACION.ID\r\n" + //
                "where titulacion.nombre = ? and REL_PROFESOR_ASIG.ID_ASIGNATURA = ? and rel_usuario_asig.FECHA  = ?;";

        List<String> notas = new ArrayList<String>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setString(1,nombre_titulacion);
            st.setInt(2,id_asignatura);
            st.setString(3,fecha);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                String nota = "";

                nota = rs.getString("PARTICIPAR");
                
                notas.add(nota);
                
            } 
        } 

        return notas;
    
    }

    public List<String> buscarTitulacionesAsig(int id_asignatura) throws SQLException{

        String query = "select TITULACION.NOMBRE as \"NOMBRE\" from rel_titulacion_asignatura\r\n" + //
                "inner join titulacion on rel_titulacion_asignatura.ID_TITULACION = TITULACION.ID\r\n" + //
                "where ID_ASIGNATURA = ?;";

        List<String> titulaciones = new ArrayList<String>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_asignatura);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                titulaciones.add(rs.getString("NOMBRE"));
            } 
        } 

        return titulaciones;
    
    }

    public Asignatura buscarAsignatura(int usuario_id, String nombre_asignatura) throws SQLException{

        String query = "SELECT ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\", REL_USUARIO_ASIG.NOTA AS \"NOTA\", REL_USUARIO_ASIG.PARTICIPAR AS \"PARTICIPACION\", REL_USUARIO_ASIG.ASISTENCIA AS \"ASISTENCIA\", REL_USUARIO_ASIG.FECHA AS \"FECHA\", REL_USUARIO_ASIG.MATRICULADO AS \"MATRICULADO\" FROM ASIGNATURA INNER JOIN REL_USUARIO_ASIG ON ASIGNATURA.ID = REL_USUARIO_ASIG.ID_ASIGNATURA WHERE REL_USUARIO_ASIG.ID_USUARIO = ? AND ASIGNATURA.NOMBRE = ?;";

        Asignatura asignatura = new Asignatura();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,usuario_id);
            st.setString(2,nombre_asignatura);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                asignatura.setNombre(rs.getString("NOMBRE ASIGNATURA"));
                asignatura.setNota(rs.getString("NOTA"));
                asignatura.setParticipacion(rs.getString("PARTICIPACION"));
                asignatura.setAsistencia(rs.getInt("ASISTENCIA"));
                asignatura.setFecha(rs.getString("FECHA"));
                asignatura.setMatriculado(rs.getInt("MATRICULADO"));
            } 
        } 

        return asignatura;
    
    }

    public Asignatura datosAnioAsignatura(String nombre_titulacion, int id_asignatura, String fecha) throws SQLException{

        String query = "SELECT AVG(NOTA) AS \"NOTA MEDIA\" , AVG(PARTICIPAR) AS \"PARTICIPACION MEDIA\", AVG(ASISTENCIA) AS \"ASISTENCIA MEDIA\" FROM REL_USUARIO_ASIG INNER JOIN REL_USUARIO_TITULACION ON REL_USUARIO_ASIG.ID_USUARIO = REL_USUARIO_TITULACION.ID_USUARIO INNER JOIN TITULACION ON REL_USUARIO_TITULACION.ID_TITULACION = TITULACION.ID WHERE FECHA=?  AND ID_ASIGNATURA = ? AND TITULACION.NOMBRE = ?;";

        Asignatura asignatura = new Asignatura();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setString(1,fecha);
            st.setInt(2,id_asignatura);
            st.setString(3,nombre_titulacion);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                asignatura.setNotaMedia(Math.round(rs.getDouble("NOTA MEDIA")*100.0)/100.0);
                asignatura.setParticipacionMedia(Math.round(rs.getDouble("PARTICIPACION MEDIA")*100.0)/100.0);
                asignatura.setAsistenciaMedia(Math.round(rs.getDouble("ASISTENCIA MEDIA")*100.0)/100.0);
                
            } 
        } 

        return asignatura;
    
    }

    public Usuario buscarEstudiante(String userName) throws SQLException{

        //String query = "SELECT USUARIO.ID AS \"ID\", USUARIO.NOMBRE AS \"NOMBRE\", USUARIO.CLAVE AS \"CLAVE\", USUARIO.TIPO AS \"TIPO\", TITULACION.NOMBRE AS \"NOMBRE_TITULACION\" FROM USUARIO INNER JOIN REL_USUARIO_TITULACION ON USUARIO.ID = REL_USUARIO_TITULACION.ID_USUARIO INNER JOIN TITULACION ON REL_USUARIO_TITULACION.ID_TITULACION = TITULACION.ID WHERE USUARIO.NOMBRE = ? AND CLAVE = ?";
        String query = "SELECT USUARIO.ID AS \"ID\", USUARIO.NOMBRE AS \"NOMBRE\", USUARIO.CLAVE AS \"CLAVE\", USUARIO.TIPO AS \"TIPO\" FROM USUARIO WHERE USUARIO.NOMBRE = ?";

        Usuario usuario = new Usuario();

        try(PreparedStatement st = connection.prepareStatement(query)){
            st.setString(1,userName);

            ResultSet rs = st.executeQuery();

            if(rs.next()){
                usuario.setId(rs.getInt("ID"));
                usuario.setNombre(rs.getString("NOMBRE"));
                usuario.setClave(rs.getString("CLAVE"));
                usuario.setTipo(rs.getString("TIPO"));
            } 
        } 

        return usuario;
    }

    public List<Asignatura> top5mejoreNotas(int id_titulacion) throws SQLException{

        String query = "select ID_ASIGNATURA AS \"ID\", AVG(NOTA) AS \"NOTA MEDIA\", ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\" from rel_usuario_asig inner join asignatura on REL_USUARIO_ASIG.ID_ASIGNATURA = ASIGNATURA.ID where REL_USUARIO_ASIG.ID_TITULACION = ? group by ID_ASIGNATURA order by AVG(NOTA) DESC limit 5";

        List<Asignatura> TOP5 = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_titulacion);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setId(rs.getInt("ID"));
                asignatura.setNotaMedia(Math.round(rs.getDouble("NOTA MEDIA")*100.0)/100.0);
                asignatura.setNombre(rs.getString("NOMBRE ASIGNATURA"));

                TOP5.add(asignatura);
                
            } 
        } 

        return TOP5;
    
    }

    public List<Asignatura> top5mejoreAsis(int id_titulacion) throws SQLException{

        String query = "select ID_ASIGNATURA AS \"ID\", AVG(ASISTENCIA) AS \"ASISTENCIA MEDIA\", ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\" from rel_usuario_asig inner join asignatura on REL_USUARIO_ASIG.ID_ASIGNATURA = ASIGNATURA.ID where REL_USUARIO_ASIG.ID_TITULACION = ? group by ID_ASIGNATURA order by AVG(ASISTENCIA) DESC limit 5";

        List<Asignatura> TOP5 = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_titulacion);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setId(rs.getInt("ID"));
                asignatura.setNotaMedia(Math.round(rs.getDouble("ASISTENCIA MEDIA")*100.0)/100.0);
                asignatura.setNombre(rs.getString("NOMBRE ASIGNATURA"));

                TOP5.add(asignatura);
                
            } 
        } 

        return TOP5;
    
    }

    public List<Asignatura> top5mejorePar(int id_titulacion) throws SQLException{

        String query = "select ID_ASIGNATURA AS \"ID\", AVG(PARTICIPAR) AS \"PARTICIPACION MEDIA\", ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\" from rel_usuario_asig inner join asignatura on REL_USUARIO_ASIG.ID_ASIGNATURA = ASIGNATURA.ID where REL_USUARIO_ASIG.ID_TITULACION = ? group by ID_ASIGNATURA order by AVG(PARTICIPAR) DESC limit 5";

        List<Asignatura> TOP5 = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_titulacion);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setId(rs.getInt("ID"));
                asignatura.setNotaMedia(Math.round(rs.getDouble("PARTICIPACION MEDIA")*100.0)/100.0);
                asignatura.setNombre(rs.getString("NOMBRE ASIGNATURA"));

                TOP5.add(asignatura);
                
            } 
        } 

        return TOP5;
    
    }

    public List<Asignatura> top5peoresNotas(int id_titulacion) throws SQLException{

        String query = "select ID_ASIGNATURA AS \"ID\", AVG(NOTA) AS \"NOTA MEDIA\", ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\" from rel_usuario_asig inner join asignatura on REL_USUARIO_ASIG.ID_ASIGNATURA = ASIGNATURA.ID where REL_USUARIO_ASIG.ID_TITULACION = ? group by ID_ASIGNATURA order by AVG(NOTA) limit 5";

        List<Asignatura> TOP5 = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_titulacion);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setId(rs.getInt("ID"));
                asignatura.setNotaMedia(Math.round(rs.getDouble("NOTA MEDIA")*100.0)/100.0);
                asignatura.setNombre(rs.getString("NOMBRE ASIGNATURA"));

                TOP5.add(asignatura);
                
            } 
        } 

        return TOP5;
    
    }

    public List<Asignatura> top5peoresAsis(int id_titulacion) throws SQLException{

        String query = "select ID_ASIGNATURA AS \"ID\", AVG(ASISTENCIA) AS \"ASISTENCIA MEDIA\", ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\" from rel_usuario_asig inner join asignatura on REL_USUARIO_ASIG.ID_ASIGNATURA = ASIGNATURA.ID where REL_USUARIO_ASIG.ID_TITULACION = ? group by ID_ASIGNATURA order by AVG(ASISTENCIA) limit 5";

        List<Asignatura> TOP5 = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_titulacion);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setId(rs.getInt("ID"));
                asignatura.setNotaMedia(Math.round(rs.getDouble("ASISTENCIA MEDIA")*100.0)/100.0);
                asignatura.setNombre(rs.getString("NOMBRE ASIGNATURA"));

                TOP5.add(asignatura);
                
            } 
        } 

        return TOP5;
    
    }

    public List<Asignatura> top5peoresPar(int id_titulacion) throws SQLException{

        String query = "select ID_ASIGNATURA AS \"ID\", AVG(PARTICIPAR) AS \"PARTICIPACION MEDIA\", ASIGNATURA.NOMBRE AS \"NOMBRE ASIGNATURA\" from rel_usuario_asig inner join asignatura on REL_USUARIO_ASIG.ID_ASIGNATURA = ASIGNATURA.ID where REL_USUARIO_ASIG.ID_TITULACION = ? group by ID_ASIGNATURA order by AVG(PARTICIPAR) limit 5";

        List<Asignatura> TOP5 = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_titulacion);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setId(rs.getInt("ID"));
                asignatura.setNotaMedia(Math.round(rs.getDouble("PARTICIPACION MEDIA")*100.0)/100.0);
                asignatura.setNombre(rs.getString("NOMBRE ASIGNATURA"));

                TOP5.add(asignatura);
                
            } 
        } 

        return TOP5;
    
    }

    public List<Asignatura> buscarTitulaciones() throws SQLException{

        String query = "select TITULACION.ID as \"ID\", TITULACION.NOMBRE as \"NOMBRE\" from titulacion ";

        List<Asignatura> titulaciones = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setId(rs.getInt("ID"));
                asignatura.setNombre(rs.getString("NOMBRE"));

                titulaciones.add(asignatura);
                
            } 
        } 

        return titulaciones;
    
    }

    public List<Asignatura> notasHistTitulacion(int id_titulacion) throws SQLException{

        String query = "SELECT AVG(NOTA) AS \"NOTA MEDIA\", FECHA, TITULACION.NOMBRE AS \"TITULACION\" FROM TITULACION \r\n" + //
                "INNER JOIN REL_TITULACION_ASIGNATURA ON TITULACION.ID = REL_TITULACION_ASIGNATURA.ID_TITULACION\r\n" + //
                "INNER JOIN REL_USUARIO_ASIG ON TITULACION.ID = REL_USUARIO_ASIG.ID_TITULACION \r\n" + //
                "inner join asignatura on REL_USUARIO_ASIG.ID_ASIGNATURA = ASIGNATURA.ID \r\n" + //
                "WHERE TITULACION.ID = ?\r\n" + //
                "GROUP BY FECHA\r\n" + //
                "order by FECHA;";

        List<Asignatura> infoNotas = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_titulacion);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setNotaMedia(Math.round(rs.getDouble("NOTA MEDIA")*100.0)/100.0);
                asignatura.setFecha(rs.getString("FECHA"));
                asignatura.setTitulacion(rs.getString("TITULACION"));
                
                infoNotas.add(asignatura);
                
            } 
        } 

        return infoNotas;
    
    }

    public List<Asignatura> asistenciaHistTitulacion(int id_titulacion) throws SQLException{

        String query = "SELECT AVG(ASISTENCIA) AS \"ASISTENCIA MEDIA\", FECHA, TITULACION.NOMBRE AS \"TITULACION\" FROM TITULACION \r\n" + //
                "INNER JOIN REL_TITULACION_ASIGNATURA ON TITULACION.ID = REL_TITULACION_ASIGNATURA.ID_TITULACION\r\n" + //
                "INNER JOIN REL_USUARIO_ASIG ON TITULACION.ID = REL_USUARIO_ASIG.ID_TITULACION \r\n" + //
                "inner join asignatura on REL_USUARIO_ASIG.ID_ASIGNATURA = ASIGNATURA.ID \r\n" + //
                "WHERE TITULACION.ID = ?\r\n" + //
                "GROUP BY FECHA\r\n" + //
                "order by FECHA;";

        List<Asignatura> infoNotas = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_titulacion);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setNotaMedia(Math.round(rs.getDouble("ASISTENCIA MEDIA")*100.0)/100.0);
                asignatura.setFecha(rs.getString("FECHA"));
                asignatura.setTitulacion(rs.getString("TITULACION"));
                
                infoNotas.add(asignatura);
                
            } 
        } 

        return infoNotas;
    
    }

    public List<Asignatura> participarHistTitulacion(int id_titulacion) throws SQLException{

        String query = "SELECT AVG(PARTICIPAR) AS \"PARTICIPACION MEDIA\", FECHA, TITULACION.NOMBRE AS \"TITULACION\" FROM TITULACION \r\n" + //
                "INNER JOIN REL_TITULACION_ASIGNATURA ON TITULACION.ID = REL_TITULACION_ASIGNATURA.ID_TITULACION\r\n" + //
                "INNER JOIN REL_USUARIO_ASIG ON TITULACION.ID = REL_USUARIO_ASIG.ID_TITULACION \r\n" + //
                "inner join asignatura on REL_USUARIO_ASIG.ID_ASIGNATURA = ASIGNATURA.ID \r\n" + //
                "WHERE TITULACION.ID = ?\r\n" + //
                "GROUP BY FECHA\r\n" + //
                "order by FECHA;";

        List<Asignatura> infoNotas = new ArrayList<Asignatura>();

        try(PreparedStatement st = connection.prepareStatement(query)){

            st.setInt(1,id_titulacion);

            ResultSet rs = st.executeQuery();

            while(rs.next()){
                Asignatura asignatura = new Asignatura();

                asignatura.setNotaMedia(Math.round(rs.getDouble("PARTICIPACION MEDIA")*100.0)/100.0);
                asignatura.setFecha(rs.getString("FECHA"));
                asignatura.setTitulacion(rs.getString("TITULACION"));
                
                infoNotas.add(asignatura);
                
            } 
        } 

        return infoNotas;
    
    }
} 
