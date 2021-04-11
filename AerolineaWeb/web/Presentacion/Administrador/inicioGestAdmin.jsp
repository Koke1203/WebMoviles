<%-- 
    Document   : inicioGestAdmin
    Created on : 11/04/2021, 09:00:44 AM
    Author     : groya
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de administradores</title>
        <%@ include file="/Presentacion/head.jsp" %>
    </head>
    <body>
        <%
        ArrayList<Usuario> Administradores = new ArrayList<>();
        if(session.getAttribute("administradores") != null){
            Administradores = (ArrayList) session.getAttribute("administradores");
        }
        %>
        <!--NAVBAR-->
        <%@ include file="/Presentacion/header.jsp" %>
        <!-- FIN NAVBAR -->
        <br><br>
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-6">
                    <p class="h2">Cambiar contraseña</p><br><br>
                    <form name="form_registro" id="form_registro" action="ControladorWAdministrador" >
                        <div class="row">
                            <div class="col">
                              <input class="form-control" type="text" name="txtIdentificacionAdmin" placeholder="Identificación" value="<%=usuario.getIdUsuario()%>" readonly>
                            </div>
                            <div class="col">
                                <input class="form-control" type="password" name="txtContraseniaAdmin" placeholder="Contraseña" value="<%=usuario.getContrasenia()%>">
                            </div>
                            <div class="col">
                                <input class="btn btn-outline-success" type="submit" name="accion" value="Editar">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <br>
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-6 ">
                    <p class="h2">Agregar administrador</p><br><br>
                    <form name="form_registro" id="form_registro" action="ControladorWAdministrador" >
                        <div class="row">
                            <div class="col">
                              <input class="form-control" type="text" name="txtIdentificacion" placeholder="Identificación">
                            </div>
                            <div class="col">
                                <input class="form-control" type="password" name="txtContrasenia" value="" placeholder="Contraseña" id="contraseniaAdmin">
                            </div> 
                            <div class="col">
                                <input class="btn btn-outline-success" type="submit" name="accion" value="Agregar">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <br>
            <div class="container">
                <div class="row justify-content-center align-items-center minh-100">
                    <div class="col-lg-">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">ID Administrador</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String idUsuario = "";
                                    Iterator<Usuario> iterador = Administradores.iterator();
                                    while (iterador.hasNext()) {
                                        idUsuario = iterador.next().getIdUsuario();

                                %>
                                <tr>
                                    <td><%= idUsuario%></td>
                                    <td><a class="btn btn-outline-danger"  href="ControladorWAdministrador?accion=Eliminar&idAdministrador=<%=idUsuario%>">Eliminar</a></td>
                                </tr>
                                <%
                                    }
                                %>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </body>
</html>
