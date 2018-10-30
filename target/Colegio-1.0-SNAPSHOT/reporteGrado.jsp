<%@page import="modelo.Grado"%>
<%@page import="modelo.ListaGrados"%>
<%@page import="java.util.LinkedList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : reporteAlumno
    Created on : 18-sep-2018, 15:55:24
    Author     : alumno
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

 ListaGrados ls = new ListaGrados();
 LinkedList<Grado> li= ls.select();
 
 if(li==null){
     String error = "No hay ningun dato de grado";
     request.getSession().setAttribute("error", error);
     request.getRequestDispatcher("errorAdmi").forward(request, response);
 }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include  file="WEB-INF/jspf/estilos.jspf" %>
    </head>
    <body>
        <%@include  file="WEB-INF/jspf/cabecera.jspf" %>      
        <%@include  file="WEB-INF/jspf/navAdministrador.jspf" %>
        <%@include file="WEB-INF/jspf/navAdministrador2.jspf" %>

        <div id="page-content-wrapper container">
            <div class="row bg-light">
                <div class="col-3"></div>
                <div class="col-6">
                    <section>
                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th style="text-align: center">Nombre del Grado</th>
                                    <th style="text-align: center" >Editar</th>
                                    <th style="text-align: center" >Elimnar</th>
                                </tr>
                            </thead>
                            <tbody>

                               <% 
                                  for(int i=0; i<li.size(); i++){ 
                                 %>
                           <tr>
                            <td style="text-align: center"><%out.print(li.get(i).getNombre());%> </td>
                            <td>
                                <form method="post" action="editargrado.do">
                                    <input name="grado" value="<%out.print(li.get(i).getNombre());%>" style="visibility: hidden; width: 1px; height: 1px;">
                                   <button type="submit" class="btn  btn-outline-success"><i class="fas fa-edit">&nbsp; Editar</i></button>
                                </form>   
                            </td>
                            <td>
                                <form method="post" action="eliminargrado.do">
                                    <input name="grado" value="<%out.print(li.get(i).getNombre());%>" style="visibility: hidden; width: 1px; height: 1px;">
                                    <button type="submit" class="btn btn-outline-danger"><i class="fas fa-trash-alt">&nbsp; Eliminar</i></button>
                                </form>   
                            </td>
                           </tr>
                            <%}%>

                            </tbody>
                        </table>
                    </section>
                </div>
                <div class="col-3"></div>
            </div>
            <div class="py-3 bg-light" style="text-align: center;">
                    <a href="administrador.jsp" class="btn btn-primary">ir al panel de control</a>
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
