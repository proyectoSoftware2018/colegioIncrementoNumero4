<%-- 
    Document   : registroProfesor
    Created on : 19-sep-2018, 17:21:03
    Author     : alumno
--%>

<%@page import="modelo.Curso"%>
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

Curso curso = (Curso) request.getSession().getAttribute("curso");

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
                            <form action="controladoreditarcurso.do" method="post">
                                <div class="form-row justify-content-center">

                                    <div class="card card-inverse bg-dark" >
                                        <div class="card-block">
                                            <h3 class="card-title text-center">EDICIÓN DE CURSOS:</h3><br>
                                            <label for="cod">Código Curso:</label>
                                            <input type="text" class="form-control" id="cod" name="cod" value="<%out.print(curso.getCodigo());%>" readonly="readonly"><br>
                                            <label for="nom">Nombre Actual del Curso:</label>
                                            <input type="text" class="form-control" id="nom" value="<%out.print(curso.getNombre());%>" readonly="readonly"><br>
                                            <label for="nom">Nuevo Nombre del Curso:</label>
                                            <input type="text" class="form-control" id="nom" name="nom"><br>
                                            <div style="text-align: center;">
                                                <button type="submit" id="boton" class="btn btn-success">Editar</button> <a href="administrador.jsp" class="btn btn-danger">Cancelar</a>
                                            </div>
                                        </div>
                                    </div>
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
