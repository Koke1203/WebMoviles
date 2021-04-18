<%-- 
    Document   : add
    Created on : 18-abr-2021, 9:36:32
    Author     : groya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Vuelo</title>
        <%@ include file="/Presentacion/head.jsp" %>
    </head>
    <body>
         <!--NAVBAR-->
        <%@ include file="/Presentacion/header.jsp" %>
        <!-- FIN NAVBAR -->
        <div class="m-0 vh-100 row justify-content-center align-items-center" >
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-4 ">
                    <p class="h1">Registro Vuelo</p><br><br>
                    <form name="form_vuelo" id="form_vuelo" onsubmit="return validaDatosVuelo();" action="ControladorWAdministrador" >
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtIdVuelo" placeholder="ID Vuelo"  >
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="date" name="txtFechaIda" placeholder="Fecha ida">
                            </div>
                            <div class="col">
                                <input class="form-control" type="date" name="txtFechaRegreso" placeholder="Fecha regreso">
                            </div> 
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtPrecio" placeholder="Precio" >
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtIdAvion" placeholder="ID Avion" >
                            </div>
                            <div class="col">
                                <input class="form-control" type="text" name="txtIdRuta" placeholder="ID Ruta" id="year" >
                            </div> 
                        </div>
                        <br>
                        <input class="btn btn-outline-success" type="submit" name="accion" value="Agregar Vuelo">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
