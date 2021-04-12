<%-- 
    Document   : inicio
    Created on : 08/04/2021, 05:24:20 PM
    Author     : groya
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.DetalleHistoricoCompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incio cliente</title>
        <%@ include file="/Presentacion/head.jsp" %>
    </head>
    <body>
        <!--NAVBAR-->
        <%@ include file="/Presentacion/header.jsp" %>
        <!-- FIN NAVBAR -->
        <%ArrayList<DetalleHistoricoCompra> historicoCompras = new ArrayList<>();
            if (session.getAttribute("historicoCompras") != null) {
                historicoCompras = (ArrayList) session.getAttribute("historicoCompras");
            }%>
        <div class="container">
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-">
                    <h1>Historico Compras</h1>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">ID Vuelo</th>
                                <th scope="col">Origen</th>
                                <th scope="col">Destino</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Fecha</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                DetalleHistoricoCompra historico = null;
                                Iterator<DetalleHistoricoCompra> iterador = historicoCompras.iterator();
                                while (iterador.hasNext()) {
                                    historico = iterador.next();

                            %>
                            <tr>
                                <td><%= historico.getIdVuelo()%></td>
                                <td><%= historico.getOrigen()%></td>
                                <td><%= historico.getDestino()%></td>
                                <td><%= historico.getPrecio()%></td>
                                <td><%= historico.getFecha()%></td>
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
