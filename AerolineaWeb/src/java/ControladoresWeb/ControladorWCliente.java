/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresWeb;

import Modelo.Avion;
import Modelo.Cliente;
import Modelo.DetalleAsiento;
import Modelo.DetalleHistoricoCompra;
import Modelo.HistoricoCompra;
import Modelo.Modelo;
import Modelo.Usuario;
import Modelo.Vuelo;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author groya
 */
public class ControladorWCliente extends HttpServlet {
    
    private final String MOSTRAR_PERFIL = "/Presentacion/Cliente/editProfile.jsp";
    private final String INICIO_CLIENTE = "/Presentacion/Cliente/inicio.jsp";
    private final String LOGIN = "/Presentacion/Login/login.jsp";
    private final String SELECCION_ASIENTO = "/Presentacion/Asientos/asientos.jsp";
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorWCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorWCliente at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Modelo modelo = new Modelo();

        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("HistoricoCompras")) {
            acceso = INICIO_CLIENTE;
        } else if (action.equalsIgnoreCase("MostrarPerfil")) {
            acceso = MOSTRAR_PERFIL;
        } else if (action.equalsIgnoreCase("Editar Perfil")) {

            String identificacion = request.getParameter("txtIdentificacion");
            String nombre = request.getParameter("txtNombre");
            String primerApellido = request.getParameter("txtPrimerApellido");
            String segundoApellido = request.getParameter("txtSegundoApellido");
            String fechaNacimiento = request.getParameter("dateFechaNacimiento");
            String correo = request.getParameter("emailCorreo");
            String direccion = request.getParameter("txtDireccion");
            String telefono = request.getParameter("telTelefono");
            String celular = request.getParameter("telCelular");
            String contrasenia = request.getParameter("passConstrasenia");

            SimpleDateFormat formaterInput = new SimpleDateFormat("yyyy-mm-dd");
            SimpleDateFormat formaterOracle = new SimpleDateFormat("dd/mm/yyyy");
            Date dateOfBirth;
            try {
                dateOfBirth = formaterInput.parse(fechaNacimiento);
                String nacimiento = formaterOracle.format(dateOfBirth);

                Cliente cliente = new Cliente(identificacion, nombre, primerApellido, segundoApellido, fechaNacimiento, correo, direccion, telefono, celular, contrasenia);
                Usuario usuario = new Usuario(identificacion, "Cliente", contrasenia, 1);

                modelo.modificarUsuario(usuario);
                modelo.modificarCliente(cliente);
                session.setAttribute("usuario", usuario);
                session.setAttribute("cliente", cliente);

                acceso = INICIO_CLIENTE;

            } catch (ParseException ex) {
                Logger.getLogger(ControladorWCliente.class.getName()).log(Level.SEVERE, null, ex);
                acceso = MOSTRAR_PERFIL;
            }
        } else if (action.equalsIgnoreCase("Comprar")) {
            if (session.getAttribute("cliente") != null) {
                String idVuelo = "";
                if (request.getParameter("idVuelo") != null) {
                    idVuelo = request.getParameter("idVuelo");

                    
                    try {
                        //modelo.insertarHistoricoCompra(historico);
                        Vuelo vuelo = modelo.consultarVuelo(idVuelo);
                        Avion avion = modelo.consultarAvion(vuelo.getAvion());
                        //ArrayList<DetalleHistoricoCompra> historicoCompras = modelo.listarDetalleHistoricoComprasCliente(cliente.getIdCliente());
                        ArrayList<DetalleAsiento> detalleAsientos = modelo.listarDetalleAsientosVuelo(idVuelo);
                        //session.setAttribute("historicoCompras", historicoCompras);
                        session.setAttribute("vueloSeleccionado", vuelo);
                        session.setAttribute("avionSeleccionado", avion);
                        session.setAttribute("detalleAsientos", detalleAsientos);
                        
                    } catch (Exception ex) {
                        Logger.getLogger(ControladorWCliente.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                acceso = SELECCION_ASIENTO ;
            } else {//Caso de seleccionar comprar y no estar registrado
                acceso = LOGIN;
            }
        } else if (action.equalsIgnoreCase("AsientoReservado")) {
            
            Vuelo vuelo = (Vuelo) session.getAttribute("vueloSeleccionado");
            Avion avion = (Avion) session.getAttribute("avionSeleccionado");
            Cliente cliente = (Cliente) session.getAttribute("cliente");
            HistoricoCompra historico = new HistoricoCompra(vuelo.getIdVuelo(), cliente.getIdCliente());
            
            avion.setCantPasajeros(avion.getCantPasajeros() - 1);
            modelo.modificarAvion(avion);
            String asientoSeleccionado = request.getParameter("asientoSeleccionado");
            DetalleAsiento detalle = new DetalleAsiento(vuelo.getIdVuelo(),asientoSeleccionado);
            
            try {
                modelo.insertarHistoricoCompra(historico);
                modelo.insertarDetalleAsiento(detalle);
                ArrayList<DetalleHistoricoCompra> historicoCompras = modelo.listarDetalleHistoricoComprasCliente(cliente.getIdCliente());
                session.setAttribute("historicoCompras", historicoCompras);
                
            } catch (Exception ex) {
                Logger.getLogger(ControladorWCliente.class.getName()).log(Level.SEVERE, null, ex);
            }
            acceso = INICIO_CLIENTE;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
