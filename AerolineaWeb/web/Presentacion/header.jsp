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
    <%if(usuario == null){%>  
    <li class="nav-item active">
      <a class="nav-link" href="ControladorWLogin?accion=ConsultarVuelos">Consulta Vuelos</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="Presentacion/Login/login.jsp">Login</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="Presentacion/Registro/registro.jsp">Registrarse</a>
    </li>
    
    <%}else{%>
    <li class="nav-item">
        <%if(usuario.getTipo() == 0){%>
            <a class="nav-link" href="#" tabindex="-1" aria-disabled="true"><%=usuario.getIdUsuario()%></a>
        <%}else if(usuario.getTipo() == 1){%>
            <a class="nav-link" href="ControladorWCliente?accion=MostrarPerfil" tabindex="-1" aria-disabled="true"><%=cliente.getNombre() +" "+ cliente.getPrimerApellido()%></a>
        <%}%>
    </li>
        <li class="nav-item">
      <a class="nav-link" href="ControladorWLogin?accion=Cerrar Sesión">Cerrar Sesión</a>
    </li>
    <%}%>
  </ul>
</nav>
