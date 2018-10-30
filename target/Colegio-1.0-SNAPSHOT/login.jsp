<%-- 
    Document   : login
    Created on : 12/09/2018, 07:24:18 PM
    Author     : ALUMNO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-control", "must-revalidate");
    response.addHeader("Cache-control", "no-cache");
    response.addHeader("Cache-control", "no-store");
    response.setDateHeader("Expires", 0);
    //este login es solo un formulario como de java
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/estilos.jspf" %>

    </head>
    <body>
        <div class="conteiner-fluid">
            <%@include file="WEB-INF/jspf/cabecera.jspf" %>
            <%@include file="WEB-INF/jspf/nav.jspf" %>
            <section>

                <div class="row">

                    <div class="col-12 col-md-4 col-lg-4 col-xl-4 col-xs-4 col-sm-4"></div>
                    <div class="col-12 col-md-4 col-lg-4 col-xl-4 col-xs-4 col-sm-4">

                        <form action="controladorlogin.do" method="post">
                            <!-- 
                            ya como te decial jajaj aqui es un formulario normal que tiene cajas de texto
                            como java textField pero aqui se llama input
                            y tambien comboBox pero aqui se llama select
                            esos son los item y esos son los values
                            -->
                            <div class="form-group">
                                <label for="codigo">Usuario:</label>
                                <input type="text" class="form-control" id="codigo" name="txtCodigo" aria-describedby="emailHelp" placeholder="Usuario">
                                <small id="emailHelp" class="form-text text-muted">Usuario Necesario para ingresar.</small>
                            </div>
                            <div class="form-group">
                                <label for="contra">Contraseña</label>
                                <input type="password" class="form-control" id="contra" name="txtContra" placeholder="Contraseña">
                            </div>
                            <div class="form-group">
                                <label for="tipo">Tipo Usuario:</label>
                                <select name="tipo" id="tipo" class="form-control" >
                                    
                                    <option value="1">Administrador</option>
                                    <option value="2">Profesor</option>
                                    <option value="3">Padre</option>
                                </select>
                                <br>
                                <div class="text-center">
                                    <!-- con este boton envio esa informacion de este formulario al servlet
                                    que es como una clase java pero que te permite recibir estos datos observa
                                    -->
                                   <button type="submit" class="btn btn-primary btn-responsive ">Ingresar</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>

            </section>

            <footer style="position: fixed;">
                <small>&COPY; GRUPO DE DESARROLLO DE SOFTWARE</small>
            </footer>

            <%@include file="WEB-INF/jspf/jsfooter.jspf" %>
        </div>
    </body>
</html>
