/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.80
 * Generated at: 2023-10-12 14:39:53 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import gestoracademico.Usuario;
import gestoracademico.Asignatura;

public final class estudianteCompleto_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/jsp/barraSuperiorEstComp.jsp", Long.valueOf(1696956840429L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("gestoracademico.Asignatura");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("gestoracademico.Usuario");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <title> AMIUP: Inicio de Sesion </title>\r\n");
      out.write("        <link href=\"");
      out.print( request.getContextPath() );
      out.write("/VISUAL/inicio.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("        <link href=\"");
      out.print( request.getContextPath() );
      out.write("/VISUAL/barraSuperior.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("       \r\n");
      out.write("    \r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("        ");
 Usuario usuario = new Usuario();
        usuario= (Usuario)session.getAttribute("Usuario");  
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div>");
      out.write("<nav class=\"barraSuperior\">\r\n");
      out.write("    <ul>\r\n");
      out.write("        <li id=\"login\"><a href=\"");
      out.print( request.getContextPath() );
      out.write("/inicioSesion\">");
      out.print(usuario.getNombre());
      out.write("</a></li>\r\n");
      out.write("        <li><a href=\"");
      out.print( request.getContextPath() );
      out.write("/estudiante\">Ver asignaturas matriculadas</a></li>\r\n");
      out.write("        <li><a href=\"");
      out.print( request.getContextPath() );
      out.write("/estudianteCompleto\">Inicio</a></li>\r\n");
      out.write("        <li class=\"izq\"> AMIUP </li>\r\n");
      out.write("    </ul>\r\n");
      out.write("</nav>");
      out.write(" </div>\r\n");
      out.write("\r\n");
      out.write("        ");
 List<Asignatura> asignaturasUsuario11 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 11"); 
      out.write("\r\n");
      out.write("        ");
 List<Asignatura> asignaturasUsuario12 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 12"); 
      out.write("\r\n");
      out.write("        ");
 List<Asignatura> asignaturasUsuario21 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 21"); 
      out.write("\r\n");
      out.write("        ");
 List<Asignatura> asignaturasUsuario22 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 22"); 
      out.write("\r\n");
      out.write("        ");
 List<Asignatura> asignaturasUsuario31 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 31"); 
      out.write("\r\n");
      out.write("        ");
 List<Asignatura> asignaturasUsuario32 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 32"); 
      out.write("\r\n");
      out.write("        ");
 List<Asignatura> asignaturasUsuario41 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 41"); 
      out.write("\r\n");
      out.write("        ");
 List<Asignatura> asignaturasUsuario42 = (List<Asignatura>) request.getAttribute("Asignaturas Titulacion 42"); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div class=\"principal\">\r\n");
      out.write("            <div class=\"padre\">\r\n");
      out.write("                <h2> Primer Curso </h2>\r\n");
      out.write("                <div class=\"hijo\">\r\n");
      out.write("                    ");
 for (Asignatura asignatura: asignaturasUsuario11) { 
      out.write("\r\n");
      out.write("                        ");
if(asignatura.getTipo().equals("Formacion Basica")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(65, 179, 228)\">\r\n");
      out.write("                                ");
      out.print( asignatura.getNombre() );
      out.write("<br>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Obligatoria")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(74, 91, 224)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Optativa")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(224, 164, 74)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else{
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(135, 60, 30)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
} 
      out.write("  \r\n");
      out.write("                    ");
 } 
      out.write(" \r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"hijo\">\r\n");
      out.write("                    ");
 for (Asignatura asignatura: asignaturasUsuario12) { 
      out.write("\r\n");
      out.write("                        ");
if(asignatura.getTipo().equals("Formacion Basica")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(65, 179, 228)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Obligatoria")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(74, 91, 224)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Optativa")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(224, 164, 74)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else{
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(135, 60, 30)\">\r\n");
      out.write("                                ");
      out.print( asignatura.getNombre() );
      out.write("<br>\r\n");
      out.write("                                <div class=\"nota\">Hola soy dueño </div>\r\n");
      out.write("                            \r\n");
      out.write("                            </div>\r\n");
      out.write("                        ");
} 
      out.write(" \r\n");
      out.write("                    ");
 } 
      out.write(" \r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"padre\">\r\n");
      out.write("                <h2> Segundo Curso </h2>\r\n");
      out.write("                <div class=\"hijo\">\r\n");
      out.write("                    ");
 for (Asignatura asignatura: asignaturasUsuario21) { 
      out.write("\r\n");
      out.write("                        ");
if(asignatura.getTipo().equals("Formacion Basica")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(65, 179, 228)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Obligatoria")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(74, 91, 224)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Optativa")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(224, 164, 74)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else{
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(135, 60, 30)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
} 
      out.write(" \r\n");
      out.write("                    ");
 } 
      out.write(" \r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"hijo\">\r\n");
      out.write("                    ");
 for (Asignatura asignatura: asignaturasUsuario22) { 
      out.write("\r\n");
      out.write("                        ");
if(asignatura.getTipo().equals("Formacion Basica")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(65, 179, 228)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Obligatoria")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(74, 91, 224)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Optativa")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(224, 164, 74)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else{
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(135, 60, 30)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
} 
      out.write(" \r\n");
      out.write("                    ");
 } 
      out.write(" \r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"padre\">\r\n");
      out.write("                <h2> Tercer Curso </h2>\r\n");
      out.write("                <div class=\"hijo\">\r\n");
      out.write("                    ");
 for (Asignatura asignatura: asignaturasUsuario31) { 
      out.write("\r\n");
      out.write("                        ");
if(asignatura.getTipo().equals("Formacion Basica")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(65, 179, 228)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Obligatoria")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(74, 91, 224)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Optativa")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(224, 164, 74)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else{
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(135, 60, 30)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
} 
      out.write(" \r\n");
      out.write("                    ");
 } 
      out.write(" \r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"hijo\">\r\n");
      out.write("                    ");
 for (Asignatura asignatura: asignaturasUsuario32) { 
      out.write("\r\n");
      out.write("                        ");
if(asignatura.getTipo().equals("Formacion Basica")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(65, 179, 228)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Obligatoria")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(74, 91, 224)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Optativa")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(224, 164, 74)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else{
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(135, 60, 30)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
} 
      out.write(" \r\n");
      out.write("                    ");
 } 
      out.write(" \r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"padre\">\r\n");
      out.write("                <h2> Cuarto Curso </h2>\r\n");
      out.write("                <div class=\"hijo\">\r\n");
      out.write("                    ");
 for (Asignatura asignatura: asignaturasUsuario41) { 
      out.write("\r\n");
      out.write("                        ");
if(asignatura.getTipo().equals("Formacion Basica")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(65, 179, 228)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Obligatoria")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(74, 91, 224)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Optativa")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(224, 164, 74)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else{
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(135, 60, 30)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
} 
      out.write(" \r\n");
      out.write("                    ");
 } 
      out.write(" \r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"hijo\">\r\n");
      out.write("                    ");
 for (Asignatura asignatura: asignaturasUsuario42) { 
      out.write("\r\n");
      out.write("                        ");
if(asignatura.getTipo().equals("Formacion Basica")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(65, 179, 228)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Obligatoria")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(74, 91, 224)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else if(asignatura.getTipo().equals("Optativa")){
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(224, 164, 74)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
}else{
      out.write("\r\n");
      out.write("                            <div class=\"asignatura\" style=\"background-color: rgb(135, 60, 30)\">");
      out.print( asignatura.getNombre() );
      out.write("<br></div>\r\n");
      out.write("                        ");
} 
      out.write(" \r\n");
      out.write("                    ");
 } 
      out.write(" \r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("    \r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("    .principal{\r\n");
      out.write("        display: flex;\r\n");
      out.write("        flex-direction: row;       \r\n");
      out.write("        width: 100%;\r\n");
      out.write("        margin-left: 10px;\r\n");
      out.write("    } \r\n");
      out.write("    .padre{\r\n");
      out.write("        position: relative;\r\n");
      out.write("        display: flex;\r\n");
      out.write("        margin-top:60px;\r\n");
      out.write("        width: 25%;\r\n");
      out.write("    } \r\n");
      out.write("\r\n");
      out.write("    .principal .padre h2{\r\n");
      out.write("        position: absolute;\r\n");
      out.write("        text-align: center;\r\n");
      out.write("        margin-top: 10px;\r\n");
      out.write("        margin-left: 190px;\r\n");
      out.write("        color: white;\r\n");
      out.write("    } \r\n");
      out.write("       \r\n");
      out.write("    .hijo{\r\n");
      out.write("        display: flex;\r\n");
      out.write("        flex-direction: column;\r\n");
      out.write("        row-gap: 10px;\r\n");
      out.write("        width: 50%;\r\n");
      out.write("        margin-top:50px;\r\n");
      out.write("        text-align: center;\r\n");
      out.write("    } \r\n");
      out.write("\r\n");
      out.write("    .asignatura{\r\n");
      out.write("        background-color: rgb(133, 234, 148);\r\n");
      out.write("        border-radius: 20px;\r\n");
      out.write("        padding: 10px;\r\n");
      out.write("        width: 85%;\r\n");
      out.write("        height: 90px;\r\n");
      out.write("    } \r\n");
      out.write("\r\n");
      out.write("    .asignatura .nota{\r\n");
      out.write("        position:static;\r\n");
      out.write("        border-radius: 20px;\r\n");
      out.write("        bottom: 0;\r\n");
      out.write("        background-color: red;\r\n");
      out.write("        width: 100%;\r\n");
      out.write("    } \r\n");
      out.write("</style>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
