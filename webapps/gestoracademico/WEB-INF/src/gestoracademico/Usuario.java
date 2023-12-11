package gestoracademico;

public class Usuario{

    private int id;
    private String nombre;
    private String clave;
    private String tipo;
    private String titulacion;
    private String[] asignaturas;

    public Usuario(){

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
    
    public void setClave(String clave){
        this.clave=clave;
    } 

    public String getClave(){
        return this.clave;
    } 
    
    public void setTipo(String tipo){
        this.tipo=tipo;
    } 

    public String getTipo(){
        return this.tipo;
    }

     public void setTitulacion(String titulacion){
        this.titulacion=titulacion;
    } 

    public String getTitulacion(){
        return this.titulacion;
    }  

    public String[] getAsignaturas() {
		return asignaturas;
	}

	public void setAsignaturas(String[] asignaturas) {
		this.asignaturas = asignaturas;
	}
    
    
} 