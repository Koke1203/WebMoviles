<%-- 
    Document   : list
    Created on : 08/04/2021, 11:51:28 AM
    Author     : jorge
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Modelo"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Avion"%>
<%@page import="java.util.List"%>
<%@page import="AccesoBD.AvionBD"%>
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
                    <h1>Aviones</h1>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">ID Avion</th>
                                <th scope="col">Marca</th>
                                <th scope="col">Modelo</th>
                                <th scope="col">Year</th>
                            </tr>
                        </thead>
                       <%   
                            ArrayList<Avion> avionList = new ArrayList();
                            if(session.getAttribute("listaAviones")!=null){
                                avionList = (ArrayList)session.getAttribute("listaAviones");
                            }
                            Avion avion = null;
                            Iterator<Avion> iter = avionList.iterator();
                            while (iter.hasNext()) {
                                avion = iter.next();
                                
                        %> 
                        <tbody>
                            <tr>
                                <td><%= avion.getIdentificador()%></td>
                                <td><%= avion.getMarca()%></td>
                                <td><%= avion.getModelo()%></td>
                                <td><%= avion.getAnio()%></td>
                                <td>
                                    <a href="ControladorAvion?accion=eliminar&id=<%=avion.getIdentificador()%>">Eliminar</a>
                                    <a href="ControladorAvion?accion=editar&id=<%=avion.getIdentificador()%>">Modificar</a>
                                </td>
                            </tr>
                           <%}%>
                        </tbody>
                    </table>
                    <a class="btn btn-outline-danger"  href="ControladorAvion?accion=add">Agregar Nuevo</a>
                </div>
            </div>
        </div>
    </body>
</html>
