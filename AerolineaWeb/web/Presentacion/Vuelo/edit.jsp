<%-- 
    Document   : edit
    Created on : 18-abr-2021, 9:36:41
    Author     : groya
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Modelo.Vuelo"%>
<%@page import="Modelo.Modelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Vuelo</title>
        <%@ include file="/Presentacion/head.jsp" %>
    </head>
    <body>
         <!--NAVBAR-->
        <%@ include file="/Presentacion/header.jsp" %>
        <!-- FIN NAVBAR -->
        <div class="m-0 vh-100 row justify-content-center align-items-center" >
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-4 ">
                     <%
                      Modelo dao=new Modelo();
                      int id = Integer.parseInt((String)request.getAttribute("idVuelo"));
                      Vuelo  vuelo =(Vuelo)dao.consultarVuelo(String.valueOf(id));
                      
        
                String strFechaIda = "";
                String strFechaRegreso = "";
                SimpleDateFormat formaterInput = new SimpleDateFormat("yyyy-MM-dd");
                Date fechaIda, fechaRegreso;
                    fechaIda = formaterInput.parse(vuelo.getFechaIda());
                    fechaRegreso = formaterInput.parse(vuelo.getFechaRegreso());
                    strFechaIda = formaterInput.format(fechaIda);
                    strFechaRegreso = formaterInput.format(fechaRegreso);
            
      


                    %>
                    <p class="h1">Editar Vuelo</p><br><br>
                    <form name="form_vuelo" id="form_vuelo" onsubmit="return validaDatosVuelo();" action="ControladorWAdministrador" >
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtIdVuelo" placeholder="ID Vuelo" value="<%=vuelo.getIdVuelo()%>"  >
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="date" name="txtFechaIda" placeholder="Fecha ida" value="<%=strFechaIda%>" >
                            </div>
                            <div class="col">
                                <input class="form-control" type="date" name="txtFechaRegreso" placeholder="Fecha regreso" value="<%=strFechaRegreso%>">
                            </div> 
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtPrecio" placeholder="Precio" value="<%=vuelo.getPrecio()%>" >
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtIdAvion" placeholder="ID Avion" value="<%=vuelo.getAvion()%>" >
                            </div>
                            <div class="col">
                                <input class="form-control" type="text" name="txtIdRuta" placeholder="ID Ruta" id="year" value="<%=vuelo.getRuta()%>" >
                            </div> 
                        </div>
                        <br>
                        <input class="btn btn-outline-success" type="submit" name="accion" value="Modificar Vuelo">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
