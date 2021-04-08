<%-- 
    Document   : list
    Created on : 08/04/2021, 11:51:28 AM
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="/presentacion/head.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-">
                    <h1>Aviones</h1>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">ID Avion</th>
                                <th scope="col">Marca</th>
                                <th scope="col">Modelo</th>
                                <th scope="col">Year</th>
                            </tr>
                        </thead>
                       <!--%
                            CuentasFavoritasDAO dao = new CuentasFavoritasDAO();
                            List<CuentasFavoritas> list = dao.listar();
                            Iterator<CuentasFavoritas> iter = list.iterator();
                            CuentasFavoritas fav = null;
                            while (iter.hasNext()) {
                                fav = iter.next();
                                if(fav.getUsuario_Cedula() == usuario.getCedula()){
                        %--> 
                        <tbody>
                            <tr>
                                <td><!--%= fav.getUsuario_Cedula()%--></td>
                                <td><!--%= fav.getCuentas_NumCuentas()%--></td>
                                <td><!--%= fav.getCuentas_NumCuentas()%--></td>
                                <td><!--%= fav.getCuentas_NumCuentas()%--></td>
                                <td>
                                    <a href="ControladorAvion?accion=eliminar&id=<!--%=fav.getUsuario_Cedula()%-->">Eliminar</a>
                                    <a href="ControladorAvion?accion=modificar&id=<!--%=fav.getCuentas_NumCuentas()%-->">Modificar</a>
                                </td>
                            </tr>
                          <!--  <%}}%>-->
                        </tbody>
                    </table>
                    <a class="btn btn-outline-danger"  href="ControladorAvion?accion=add">Agregar Nuevo</a>
                </div>
            </div>
        </div>
    </body>
</html>
