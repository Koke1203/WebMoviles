<%-- 
    Document   : list
    Created on : 10/04/2021, 03:11:21 PM
    Author     : groya
--%>


<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Modelo.DetalleVuelo"%>
<%@page import="Modelo.Cliente"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de vuelos</title>
        <%@ include file="/Presentacion/head.jsp" %>
    </head>
    <body>
        <!--NAVBAR-->
        <%@ include file="/Presentacion/header.jsp" %>
        <!-- FIN NAVBAR -->
        
        <%
            ArrayList<DetalleVuelo> detalleVuelos = new ArrayList<>();
            if(session.getAttribute("detalleVuelos") != null){
                detalleVuelos = (ArrayList<DetalleVuelo>) session.getAttribute("detalleVuelos");
            }
            
        %>
        
        <div class="container">
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-">
                    <h1>Vuelos</h1>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">ID Vuelo</th>
                                <th scope="col">Origen</th>
                                <th scope="col">Destino</th>
                                <th scope="col">Salida</th>
                                <th scope="col">Regreso</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Hora</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                 DetalleVuelo detVuel = null;
                                 Iterator<DetalleVuelo> iterador = detalleVuelos.iterator();
                                     while (iterador.hasNext()) {
                                         detVuel = iterador.next();
                                         
                                         SimpleDateFormat formaterInput = new SimpleDateFormat("yyyy-MM-dd");
                                         Date fecha;
                                         fecha = formaterInput.parse(detVuel.getFechaSalida());
                                         String salida = formaterInput.format(fecha);
                                         fecha = formaterInput.parse(detVuel.getFechaRegreso());
                                         String regreso = formaterInput.format(fecha);
                            %>
                            <tr>
                                <td><%= detVuel.getIdVuelo()%></td>
                                <td><%= detVuel.getOrigen()%></td>
                                <td><%= detVuel.getDestino()%></td>
                                <td><%= salida%></td>
                                <td><%= regreso%></td>
                                <td><%= detVuel.getPrecio()%></td>
                                <td><%= detVuel.getHora()%></td>
                                <%if(session.getAttribute("cliente") != null){%>
                                <td><a class="btn btn-outline-success" href="ControladorWCliente?accion=Comprar&idVuelo=<%= detVuel.getIdVuelo()%>">Comprar</a> </td>
                                <%}%>
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
