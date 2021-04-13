<%-- 
    Document   : asientos.jsp
    Created on : 13/04/2021, 10:19:54 AM
    Author     : jorge
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.DetalleAsiento"%>
<%@page import="Modelo.Avion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selección de asientos</title>
        <%@ include file="/Presentacion/head.jsp" %>
    </head>
    <body>

        <!--NAVBAR-->
        <%@ include file="/Presentacion/header.jsp" %>
        <!-- FIN NAVBAR -->
        <%
            Avion avion = null;
            int cantFilas = 0, cantColumnas = 0;
            int i = 0, j = 0;
            String[] columnas = DetalleAsiento.abecedario;
            boolean[][] estaReservado = null;
            ArrayList<DetalleAsiento> asientosReservados = new ArrayList<>();
            if (session.getAttribute("avionSeleccionado") != null) {
                avion = (Avion) session.getAttribute("avionSeleccionado");
                cantFilas = avion.getCantFilas();
                cantColumnas = avion.getCantAsientos();
                asientosReservados = (ArrayList) session.getAttribute("detalleAsientos");
                estaReservado = DetalleAsiento.matrizAsientosReservados(cantFilas, cantColumnas, asientosReservados);
            }

        %>

        <div class="justify-content-center text-center minh-100" >
            <p class="h1">Selección del asiento</p><br><br>
        </div>
        
        <div class="container">
            <%  for (i = 0; i < cantFilas; i++) {
            %>
            <div class="row justify-content-center m-3 p-sm-1">
                <div class="text-center col-md-auto">

                    <button type="button" class="btn btn-light" disabled><%=columnas[i]%></button>
                    <%
                        for (j = 0; j < cantColumnas; j++) {
                    %>

                    <%
                        if (!estaReservado[i][j]) {
                    %>
                    <a class="btn btn-light" href="ControladorWCliente?accion=AsientoReservado&asientoSeleccionado=<%=columnas[i] + (j + 1)%>"><%=columnas[i] + (j + 1)%></a>
                    <%} else {%>
                    <button type="button" class="btn btn-danger" disabled><%=columnas[i] + (j + 1)%></button>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <%}%>
        </div>
    </body>
</html>
