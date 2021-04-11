<%-- 
    Document   : edit
    Created on : 08/04/2021, 11:50:48 AM
    Author     : jorge
--%>

<%@page import="Modelo.Avion"%>
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
        <div class="m-0 vh-100 row justify-content-center align-items-center" >
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-4 ">
                     <%
                      Modelo dao=new Modelo();
                      int id=Integer.parseInt((String)request.getAttribute("idavion"));
                      Avion p=(Avion)dao.consultarAvion(String.valueOf(id));
                    %>
                    <p class="h1">Editar Avion</p><br><br>
                    <form name="form_registro" id="form_registro" onsubmit="return validaDatos()" action="ControladorAvion" >
                        <div class="row">
                            <div class="col">
                              <input class="form-control" type="text" name="txtIdAviones" value="<%= p.getIdentificador()%>" onkeypress="return solonumeros(event)" >
                            </div>
                            <div class="col">
                              <input class="form-control" type="text" name="txtMarca" value="<%= p.getMarca()%>" id="nombre" onkeypress="return sololetras(event)">
                            </div> 
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtModelo" value="<%= p.getModelo()%>" id="nombre" onkeypress="return sololetras(event)">
                            </div>
                            <div class="col">
                              <input class="form-control" type="text" name="txtYear" value="<%= p.getAnio()%>" id="year" onkeypress="return sololetras(event)">
                            </div> 
                        </div>
                         <br>
                         <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtAsientos" value="<%= p.getCantAsientos()%>" onkeypress="return sololetras(event)">
                            </div>
                            <div class="col">
                              <input class="form-control" type="text" name="txtFilas" value="<%= p.getCantFilas()%>" id="year" onkeypress="return sololetras(event)">
                            </div> 
                        </div>
                        <br>
                         <div class="row">
                            <div class="col">
                                <input class="form-control" type="text" name="txtPasajeros" value="<%= p.getCantPasajeros()%>" onkeypress="return sololetras(event)">
                            </div>
                        </div>
                        <br>
                        <input class="btn btn-outline-success" type="submit" name="accion" value="Actualizar">
                        <a class="btn btn-outline-danger" href="ControladorAvion?accion=listar" >Regresar</a>
                       
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
