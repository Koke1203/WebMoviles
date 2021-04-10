<%-- 
    Document   : editProfile
    Created on : 10/04/2021, 11:19:19 AM
    Author     : groya
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar perfil</title>
        <%@ include file="/Presentacion/head.jsp" %>
    </head>
    <body>

        
        <!--NAVBAR-->
        <%@ include file="/Presentacion/header.jsp" %>
        <!-- FIN NAVBAR -->
        <!-- PERFIL CLIENTE-->
        <%
            String nacimiento = "";
            if (cliente != null) {
                SimpleDateFormat formaterInput = new SimpleDateFormat("yyyy-MM-dd");
                Date fechaNacimiento;
                fechaNacimiento = formaterInput.parse(cliente.getFechaNacimiento());
                nacimiento = formaterInput.format(fechaNacimiento);
            }
            
        %>
        
        <div class="m-0 vh-100 row justify-content-center align-items-center" >
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-4 ">
                    <p class="h1">Perfil Cliente</p><br><br>
                    <form name="form_registro" id="form_registro" onsubmit="return validaDatos()" action="ControladorWCliente" >
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtIdentificacion" placeholder="Identificacion" id="identificacion" value="<%= cliente.getIdCliente()%>" onkeypress="return solonumeros(event)" readonly>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtNombre" placeholder="Nombre" id="nombre" value="<%=cliente.getNombre()%>"  onkeypress="return sololetras(event)" required>
                            </div> 
                            <div class="col">
                                <input class="form-control" type="text" name="txtPrimerApellido" placeholder="Primer Apellido" id="primerApellido" value="<%=cliente.getPrimerApellido()%>" onkeypress="return solonumeros(event)" required>
                            </div>
                            <div class="col">
                                <input class="form-control" type="text" name="txtSegundoApellido" placeholder="Segundo Apellido" id="segundoApellido" value="<%=cliente.getSegundoApellido()%>" onkeypress="return sololetras(event)" required>
                            </div> 
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="date" name="dateFechaNacimiento"  id="fechaNacimiento" value="<%= nacimiento%>" required>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="email" name="emailCorreo"  placeholder="Correo electrónico" id="correo" value="<%=cliente.getCorreo()%>" required>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtDireccion" placeholder="Dirección" id="direccion" value="<%=cliente.getDireccion()%>" onkeypress="return sololetras(event)" required>
                            </div> 
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="tel" name="telTelefono" placeholder="Teléfono" id="telefono" value="<%=cliente.getTelefono()%>"  onkeypress="return solonumeros(event)" required>
                            </div>
                            <div class="col">
                                <input class="form-control" type="tel" name="telCelular" placeholder="Celular" id="celular" value="<%=cliente.getCelular()%>" onkeypress="return solonumeros(event)" required>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="password" name="passConstrasenia" id="contrasenia" value="<%=cliente.getContrasenia()%>" required>
                            </div>
                        </div>
                        <br>
                        <input class="btn btn-outline-success" type="submit" name="accion" value="Editar Perfil">
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
