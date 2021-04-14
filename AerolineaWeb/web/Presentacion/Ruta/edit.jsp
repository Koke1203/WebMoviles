<%-- 
    Document   : edit
    Created on : 11/04/2021, 08:43:11 PM
    Author     : jorge
--%>

<%@page import="Modelo.Ruta"%>
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
        <!--NAVBAR-->
        <%@ include file="/Presentacion/header.jsp" %>
        <!-- FIN NAVBAR -->
        <div class="m-0 vh-100 row justify-content-center align-items-center">
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-4 ">
                    <%
                      Modelo dao=new Modelo();
                      String id=(String)request.getAttribute("idruta");
                      Ruta p=(Ruta)dao.consultarRuta(id);
                    %>
                    <p class="h1">Registrar Ruta</p><br><br>
                    <form name="form_ruta" id="form_ruta"  action="ControladorRuta">
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtNumRuta" value="<%= p.getIdRuta()%>">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <p class="h6">Destino</p>
                                <input class="form-control" type="text" name="txtDestino" value="<%= p.getDestino()%>">
                            </div>
                            <div class="col">
                                <p class="h6">Origen</p>
                                <input class="form-control" type="text" name="txtOrigen" value="<%= p.getOrigen()%>">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <p class="h6">Horas</p>
                                <input class="form-control" type="text" name="txtDuraHoras" value="<%= p.getDuracionHoras()%>">
                            </div>
                            <div class="col">
                                <p class="h6">Minutos</p>
                                <input class="form-control" type="text" name="txtDuraMin" value="<%= p.getDuracionMinutos()%>">
                            </div>
                            <div class="col">
                                <p class="h6">Dia Semana</p>
                                <input class="form-control" type="text" name="txtDia" value="<%= p.getDiaSemana()%>">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <p class="h6">Hora Salida</p>
                                <input class="form-control" type="text" name="txtHoraSalida" value="<%= p.getHora()%>">
                            </div>
                            <div class="col">
                                <p class="h6">Minutos Salida</p>
                                <input class="form-control" type="text" name="txtMinSalida" value="<%= p.getMinutos()%>">
                            </div>
                        </div>
                        <br>
                        <input class="btn btn-outline-success" type="submit" name="accion" value="Actualizar">
                        <a class="btn btn-outline-danger" href="ControladorRuta?accion=list" >Regresar</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
