<%-- 
    Document   : registroProfesor
    Created on : 19-sep-2018, 17:21:03
    Author     : alumno
--%>
<%@page import="modelo.Aula"%>
<%@page import="modelo.Profesor"%>
<%@page import="modelo.ListaProfesores"%>
<%@page import="modelo.Grado"%>
<%@page import="modelo.ListaGrados"%>
<%@page import="modelo.Seccion"%>
<%@page import="java.util.LinkedList"%>
<%@page import="modelo.ListaSecciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-control", "must-revalidate");
    response.addHeader("Cache-control", "no-cache");
    response.addHeader("Cache-control", "no-store");
    response.setDateHeader("Expires", 0);

    try {
        if (session.getAttribute("usuario") == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    } catch (Exception e) {
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    ListaSecciones ls = new ListaSecciones();
    LinkedList<Seccion> li = ls.select();
    ListaGrados ls2 = new ListaGrados();
    LinkedList<Grado> li2 = ls2.select();
    ListaProfesores ls3 = new ListaProfesores();
    LinkedList<Profesor> li3 = ls3.select();
    
    Aula au = (Aula) request.getSession().getAttribute("aula");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/estilos.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecera.jspf" %>     
        <%@include file="WEB-INF/jspf/navAdministrador.jspf" %>
        <%@include file="WEB-INF/jspf/navAdministrador2.jspf" %>

        <div id="page-content-wrapper container">

            <div class="container-fluid bg-light">

                <section>

                    <div class="row ">
                        <div class="col-12 col-md-12 col-lg-12"></div>
                        <div class="col-12 col-md-12 col-lg-12">
                            <div class="jumbotron text-white rounded bg-dark py-3">
                                <div class="col-md-12 ">
                                    <h1 class="text-center font-weight-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Edición de Aulas</font></font></h1>
                                </div>
                            </div>
                            <form action="controladoreditaraula.do" method="post">
                                <div class="form-row">
                                    
                                    <div class="form-group col-md-6 col-lg-6">
                                        <label for="inputState">Grado de estudio Primario:</label>
                                        <input type="text" name="grado" class="form-control" value="<%out.print(au.getGrado());%>" readonly="readonly">
                                    </div>
                                    <div class="form-group col-md-6 col-lg-6">
                                        <label for="inputState">Sección:</label>
                                         <input type="tex" name="sec" class="form-control" value="<%out.print(au.getSeccion());%>" readonly="readonly">
                                   
                                    </div>
                                </div>

                                <div class="form-row">
                                  <div class="form-group col-md-9 col-lg-9">
                                        <label for="inputState">Tutor:</label>
                                        <select id="inputState" class="form-control" name="comboPro">
                                            <%     if (li3.size() == 0) {
                                                    out.print("<option value=" + 0 + ">No Hay Profesores </option>");
                                                } else {
                                                    for (int i = 0; i < li3.size(); i++) {
                                            %>
                                            <option value="<%out.print(li3.get(i).getCodigo());%>"><%out.print(li3.get(i).getNombre()+" "+li3.get(i).getApellido());%></option>
                                            <%        }
                                                }

                                            %>

                                        </select>
                                    </div>  
                                    <div class="col-md-3 col-lg-3">
                                                <label for="validationCustom04">Cantidad Maxima:</label>
                                                <input type="number" name="cant" class="form-control" id="validationCustom04" value="<%out.print(au.getCantMax());%>" required>
                                    </div>
                                </div>
                                <br>
                                <div style="text-align: center;">
                                    <button type="submit" class="btn btn-success">Editar</button> <a href="administrador.jsp" class="btn btn-danger">Cancelar</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
                  <section></section>                          
            </div>
            <%@include file="WEB-INF/jspf/footer.jspf" %>
        </div>
    </div>

    <%@include file="WEB-INF/jspf/jsfooter.jspf" %> 
    <script>
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>
</body>
</html>
