<%-- 
    Document   : list
    Created on : 18-abr-2021, 9:35:37
    Author     : groya
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Vuelo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Modelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Vuelos</title>
        <%@ include file="/Presentacion/head.jsp" %>
    </head>
    <body>
         <!--NAVBAR-->
        <%@ include file="/Presentacion/header.jsp" %>
        <!-- FIN NAVBAR -->
        <div class="container">
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-">
                    <h1>Listado de Vuelos</h1>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">ID Vuelo</th>
                                <th scope="col">Fecha ida</th>
                                <th scope="col">Fecha regreso</th>
                                <th scope="col">Precio</th>
                                <th scope="col">ID Avión</th>
                                <th scope="col">ID Ruta</th>
                            </tr>
                        </thead>
                       <%   Modelo modelo = new Modelo();
                            ArrayList<Vuelo> listVuelos = modelo.listarVuelos();
                         
                            Vuelo vuelo = null;
                            Iterator<Vuelo> iter = listVuelos.iterator();
                            while (iter.hasNext()) {
                                vuelo = iter.next();
                                
                        %> 
                        <tbody>
                            <tr>
                                <td><%= vuelo.getIdVuelo()%></td>
                                <td><%= vuelo.getFechaIda()%></td>
                                <td><%= vuelo.getFechaRegreso()%></td>
                                <td><%= vuelo.getPrecio()%></td>
                                <td><%= vuelo.getAvion()%></td>
                                <td><%= vuelo.getRuta()%></td>
                                <td>
                                    <a class="btn btn-outline-danger" href="ControladorWAdministrador?accion=eliminarVuelo&id=<%= vuelo.getIdVuelo()%>">Eliminar</a>
                                    <a class="btn btn-outline-warning" href="ControladorWAdministrador?accion=editarVuelo&id=<%= vuelo.getIdVuelo()%>">Modificar</a>
                                </td>
                            </tr>
                           <%}%>
                        </tbody>
                    </table>
                    <a class="btn btn-outline-success"  href="ControladorWAdministrador?accion=addVuelo">Agregar Nuevo</a>
                </div>
            </div>
        </div>
    </body>
</html>
