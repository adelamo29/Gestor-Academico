package gestoracademico;

public class Asignatura{

    //INFO ASIGNATURA RELACION USUARIO
    private int id;
    private String nombre;
    private String curso;
    private int cuatrimestre;
    private String tipo;
    private String nota;
    private String participacion;
    private int asistencia;
    private String fecha;
    private int creditos;
    private int matriculado;


    //INFO GLOBAL DE LA ASIGNATURA
    private Double nota_media;
    private Double participacion_media;
    private Double asistencia_media;

    //VARIABLE PARA SABER LA TITULACION EN LA QUE IMPARTE UN PROFESOR LA ASIGNATURA
    private String titulacion;

    public Asignatura(){

    }

    public void setId(int id){
        this.id=id;
    } 

    public int getId(){
        return this.id;
    } 

    public void setNombre(String nombre){
        this.nombre=nombre;
    } 

    public String getNombre(){
        return this.nombre;
    } 
    
    public void setCuatrimestre(int cuatrimestre){
        this.cuatrimestre=cuatrimestre;
    } 

    public int getCuatrimestre(){
        return this.cuatrimestre;
    } 

    public void setCurso(String curso){
        this.curso=curso;
    } 

    public String getCurso(){
        return this.curso;
    } 

    public void setTipo(String tipo){
        this.tipo=tipo;
    } 
    
    public String getTipo(){
        return this.tipo;
    } 

    public void setNota(String nota){
        this.nota=nota;
    } 

    public String getNota(){
        return this.nota;
    }

    public void setParticipacion(String participacion){
        this.participacion=participacion;
    } 

    public String getParticipacion(){
        return this.participacion;
    }

    public void setAsistencia(int asistencia){
        this.asistencia=asistencia;
    } 

    public int getAsistencia(){
        return this.asistencia;
    }

    public void setFecha(String fecha){
        this.fecha=fecha;
    } 

    public String getFecha(){
        return this.fecha;
    } 

    public void setCreditos(int creditos){
        this.creditos=creditos;
    } 

    public int getCreditos(){
        return this.creditos;
    }

    public void setMatriculado(int matriculado){
        this.matriculado=matriculado;
    } 

    public int getMatriculado(){
        return this.matriculado;
    }

    /*---------------------------------------------------------------*/

    public void setNotaMedia(Double nota_media){
        this.nota_media=nota_media;
    } 

    public Double getNotaMedia(){
        return this.nota_media;
    }

    public void setParticipacionMedia(Double participacion_media){
        this.participacion_media=participacion_media;
    } 

    public Double getParticipacionMedia(){
        return this.participacion_media;
    }

    public void setAsistenciaMedia(Double asistencia_media){
        this.asistencia_media=asistencia_media;
    } 

    public Double getAsistenciaMedia(){
        return this.asistencia_media;
    }

    /*---------------------------------------------------------------*/

    public void setTitulacion(String titulacion){
        this.titulacion=titulacion;
    } 

    public String getTitulacion(){
        return this.titulacion;
    } 
    
} 