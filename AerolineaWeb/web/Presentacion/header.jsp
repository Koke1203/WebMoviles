<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.Usuario"%>
<%
    Usuario usuario = null;
    if (session.getAttribute("usuario") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
    }
    Cliente cliente = null;
    if(session.getAttribute("cliente") != null){
        cliente = (Cliente) session.getAttribute("cliente");
    }
%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <ul class="navbar-nav">
        <%if (usuario == null) {%>  
        <li class="nav-item active">
            <a class="nav-link" href="ControladorWLogin?accion=ConsultarVuelos">Consulta Vuelos</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="Presentacion/Registro/registro.jsp">Registrarse</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="Presentacion/Login/login.jsp">Login</a>
        </li>

        <%} else {%>
        <%if (usuario.getTipo() == 0) {%>
        <li class="nav-item">
            <a class="nav-link" href="ControladorRuta?accion=list" tabindex="-1" aria-disabled="true">Gestión Rutas</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="ControladorAvion?accion=list" tabindex="-1" aria-disabled="true">Gestión Aviones</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="ControladorWAdministrador?accion=listarVuelos" tabindex="-1" aria-disabled="true">Gestión Vuelos</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="ControladorWAdministrador?accion=GestionarAdministradores" tabindex="-1" aria-disabled="true">Gestión Administradores</a>
        </li>
        <li class="nav-item">
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"><%=usuario.getIdUsuario()%></a>
        </li>
        <%} else if (usuario.getTipo() == 1) {%>
        <li class="nav-item active">
            <a class="nav-link" href="ControladorWCliente?accion=HistoricoCompras">Historico Compras</a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="ControladorWLogin?accion=ConsultarVuelos">Compra Vuelos</a>
        </li>
        <li class="nav-item">    
            <a class="nav-link" href="ControladorWCliente?accion=MostrarPerfil" tabindex="-1" aria-disabled="true"><%=cliente.getNombre() + " " + cliente.getPrimerApellido()%></a>
        </li>
        <%}%>
        <li class="nav-item">
            <a class="nav-link" href="ControladorWLogin?accion=Cerrar Sesión">Cerrar Sesión</a>
        </li>
        <%}%>

    </ul>
</nav>
    


