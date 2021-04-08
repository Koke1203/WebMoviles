<%-- 
    Document   : index
    Created on : 07/04/2021, 10:49:06 AM
    Author     : groya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema Aerolínea</title>
        <%@ include file="/Presentacion/head.jsp" %>
        <link rel="stylesheet" href="CSS/Carousel.css"> 
    </head>
    <body>
        
        <!--NAVBAR-->
        <%@ include file="/Presentacion/header.jsp" %>
        <!-- FIN NAVBAR -->
        
        <!-- CARROUSEL -->
        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="10000">
                    <img src="Imagenes/imgBannerSlider3v2.jpg" class="d-block w-100" alt="First slide">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="Imagenes/imgBannerSlider2v2.jpg" class="d-block w-100" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img src="Imagenes/imgBannerSlider1v2.jpg" class="d-block w-100" alt="Third slide">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!-- FIN CARROUSEL -->
        <!-- BUSQUEDA VUELOS -->
        <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
            <div class="col-md-5 p-lg-2 mx-auto my-0">
                <h2 class="display-5 fw-normal">Sistema de Boletos Aéreos</h2>
                <div class="row g-2">
                    <div class="col-md">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="txtBusquedaOrigen">
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="txtBusquedaDestino">
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="input-group mb-3">
                            <input type="date" class="form-control" id="date_fechaIda">
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="input-group mb-3">                           
                            <input type="date" class="form-control" id="date_fechaRegreso">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- FIN BUSQUEDA VUELOS -->
    </body>
</html>
