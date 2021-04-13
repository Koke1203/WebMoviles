<%-- 
    Document   : add
    Created on : 11/04/2021, 08:43:03 PM
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="/Presentacion/head.jsp" %>
    </head>
    <body>
        <div class="m-0 vh-100 row justify-content-center align-items-center">
        <div class="row justify-content-center align-items-center minh-100">
            <div class="col-lg-4 ">
                <p class="h1">Registrar Ruta</p><br><br>
                <form name="form_ruta" id="form_ruta" onsubmit="return validaDatosRuta();" action="ControladorRuta">
                    <div class="row">
                        <div class="col">
                            <input class="form-control" type="text" name="txtNumRuta" placeholder="# Ruta">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col">
                            <input class="form-control" type="text" name="txtOrigen" placeholder="Origen">
                        </div>
                        <div class="col">
                            <input class="form-control" type="text" name="txtDestino" placeholder="Destino">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col">
                            <input class="form-control" type="text" name="txtDuraHoras" placeholder="Horas">
                        </div>
                        <div class="col">
                            <input class="form-control" type="text" name="txtDuraMin" placeholder="Minutos">
                        </div>
                        <div class="col">
                            <input class="form-control" type="text" name="txtDia" placeholder="Dia Semana">
                        </div>
                    </div>
                     <br>
                    <div class="row">
                        <div class="col">
                            <input class="form-control" type="text" name="txtHoraSalida" placeholder="Horas Salida">
                        </div>
                        <div class="col">
                            <input class="form-control" type="text" name="txtMinSalida" placeholder="Minutos Salida">
                        </div>
                    </div>
                    <br>
                    <input class="btn btn-outline-success" type="submit" name="accion" value="Agregar">
                </form>
            </div>
        </div>
    </div>
    </body>
</html>
