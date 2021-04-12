<%-- 
    Document   : login
    Created on : 07/04/2021, 09:48:58 PM
    Author     : groya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesión</title>
        <%@ include file="/Presentacion/head.jsp" %>
    </head>
    <body>
        <!--NAVBAR-->
        <%@ include file="/Presentacion/header.jsp" %>
        <!-- FIN NAVBAR -->
        <div class="m-0 vh-100 row justify-content-center align-items-center">
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-4 ">


                    <div class="card mb-3" >
                        <div class="row g-0 justify-content-center align-items-center">
                            <div class="col-md-3">
                                <img src="Imagenes/login.png" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Inicio de Sesión</h5>
                                    <form name="form_login" id="form_login" onsubmit="return validarLogin();" action="ControladorWLogin" >
                                        <div class="row">
                                            <div class="col">
                                                <input class="form-control" type="text" name="txtIdentificacion" placeholder="Identificación" id="identificacion" value="">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col">
                                                <input class="form-control" type="password" name="passContrasenia" id="contrasenia" value="" placeholder="Contraseña">
                                            </div>
                                        </div>
                                        <br>
                                        <input class="btn btn-outline-success" type="submit" name="accion" value="Inciar Sesión">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
