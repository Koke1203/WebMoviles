<%-- 
    Document   : asientos.jsp
    Created on : 13/04/2021, 10:19:54 AM
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <div class="m-0 vh-100 row justify-content-center align-items-center">
            <div class="row justify-content-center align-items-center minh-100">
                <div class="col-lg-4 ">
                    
                    
                    <div class="btn-group">
                        <%
                            int matriz1[][] = new int[4][4];
                            for (int x = 0; x < matriz1.length; x++) {
                        %>
                        <button type="button" class="btn btn-default">A</button>
                        <%        for (int y = 0; y < matriz1[x].length; y++) {%>
                        
                        <%}%>
                        <%}%>
                    </div>
                      <br>
                    <div class="btn-group">
                        <%
                            int matriz[][] = new int[4][4];
                            for (int x = 0; x < matriz.length; x++) {
                        %>
                        
                        <%        for (int y = 0; y < matriz[x].length; y++) {%>
                        <button type="button" class="btn btn-default">1</button>
                    
                        <%}%>
                        <br>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
