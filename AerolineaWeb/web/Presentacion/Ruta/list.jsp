<%-- 
    Document   : list
    Created on : 11/04/2021, 08:43:18 PM
    Author     : jorge
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Ruta"%>
<%@page import="Modelo.Ruta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Modelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="/Presentacion/head.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-">
                    <h1>Rutas</h1>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">#Ruta</th>
                                <th scope="col">Origen</th>
                                <th scope="col">Destino</th>
                                <th scope="col">Duracion Horas</th>
                                <th scope="col">Duracion Minutos</th>
                                <th scope="col">Dia Semana</th>
                            </tr>
                        </thead>
                       <%   Modelo modelo = new Modelo();
                            ArrayList<Ruta> listRuta = modelo.listarRutas();
                         
                            Ruta ruta = null;
                            Iterator<Ruta> iter = listRuta.iterator();
                            while (iter.hasNext()) {
                                ruta = iter.next();
                                
                        %> 
                        <tbody>
                            <tr>
                                <td><%= ruta.getIdRuta()%></td>
                                <td><%= ruta.getOrigen()%></td>
                                <td><%= ruta.getDestino()%></td>
                                <td><%= ruta.getDuracionHoras()%></td>
                                <td><%= ruta.getDuracionMinutos()%></td>
                                <td><%= ruta.getDiaSemana()%></td>
                                <td>
                                    <a class="btn btn-outline-danger" href="ControladorRuta?accion=eliminar&id=<%=ruta.getIdRuta()%>">Eliminar</a>
                                    <a class="btn btn-outline-warning" href="ControladorRuta?accion=editar&id=<%=ruta.getIdRuta()%>">Modificar</a>
                                </td>
                            </tr>
                           <%}%>
                        </tbody>
                    </table>
                    <a class="btn btn-outline-success"  href="ControladorRuta?accion=add">Agregar Nuevo</a>
                </div>
            </div>
        </div>
    </body>
</html>
