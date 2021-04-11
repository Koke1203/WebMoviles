<%-- 
    Document   : add
    Created on : 08/04/2021, 09:12:21 AM
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
        <div class="m-0 vh-100 row justify-content-center align-items-center" >
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-4 ">
                    <p class="h1">Registro Avion</p><br><br>
                    <form name="form_registro" id="form_registro" action="ControladorAvion" >
                        <div class="row">
                            <div class="col">
                              <input class="form-control" type="text" name="txtIdAviones" placeholder="ID Avion" onkeypress="return solonumeros(event)" >
                            </div>
                            <div class="col">
                              <input class="form-control" type="text" name="txtMarca" placeholder="Marca" id="nombre" onkeypress="return sololetras(event)">
                            </div> 
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtModelo" placeholder="Modelo" id="nombre" onkeypress="return sololetras(event)">
                            </div>
                            <div class="col">
                              <input class="form-control" type="text" name="txtYear" placeholder="Year" id="year" onkeypress="return sololetras(event)">
                            </div> 
                        </div>
                         <br>
                         <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtAsientos" placeholder="#Asientos" onkeypress="return sololetras(event)">
                            </div>
                            <div class="col">
                              <input class="form-control" type="text" name="txtFilas" placeholder="#Filas" id="year" onkeypress="return sololetras(event)">
                            </div> 
                        </div>
                        <br>
                         <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtPasajeros" placeholder="#Pasajeros" onkeypress="return sololetras(event)">
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
