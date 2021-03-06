<%-- 
    Document   : registro
    Created on : 07/04/2021, 09:47:58 PM
    Author     : groya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro cliente</title>
        <%@ include file="/Presentacion/head.jsp" %>
    </head>
    <body>

        <!--NAVBAR-->
        <%@ include file="/Presentacion/header.jsp" %>
        <!-- FIN NAVBAR -->
        <!-- REGISTRO CLIENTE-->
        <div class="m-0 vh-100 row justify-content-center align-items-center" >
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-4 ">
                    <p class="h1">Registro Cliente</p><br><br>
                    <form name="form_registro" id="form_registro" onsubmit="return validarRegistroCliente();" action="ControladorWLogin" >
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtIdentificacion" placeholder="Identificacion" id="identificacion">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtNombre" placeholder="Nombre" id="nombre">
                            </div> 
                            <div class="col">
                                <input class="form-control" type="text" name="txtPrimerApellido" placeholder="Primer Apellido" id="primerApellido">
                            </div>
                            <div class="col">
                                <input class="form-control" type="text" name="txtSegundoApellido" placeholder="Segundo Apellido" id="segundoApellido">
                            </div> 
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="date" name="dateFechaNacimiento"  id="fechaNacimiento">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="email" name="emailCorreo"  placeholder="Correo electr??nico" id="correo">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtDireccion" placeholder="Direcci??n" id="direccion">
                            </div> 
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="tel" name="telTelefono" placeholder="Tel??fono" id="telefono" pattern="2[0-9]{7}">
                            </div>
                            <div class="col">
                                <input class="form-control" type="tel" name="telCelular" placeholder="Celular" id="celular" pattern="[5678][0-9]{7}">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="password" name="passConstrasenia" placeholder="Contrase??a" id="contrasenia">
                            </div>
                        </div>
                        <br>
                        <input class="btn btn-outline-success" type="submit" name="accion" value="Registrar">
                    </form>
                </div>
            </div>
        </div>
        <!-- FIN REGISTRO CLIENTE-->
    </body>
    <script>
        var today = new Date();
        var dd = today.getDate() - 1;
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();
        if(dd < 10) dd = "0" + dd;
        if(mm < 10) mm = "0" + mm;

        today = yyyy + '-' + mm + '-' + dd;
        var datePicker = document.getElementById("fechaNacimiento");
        datePicker.setAttribute("max", today);

    </script>
</html>
