/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresWeb;

import Excepciones.GlobalException;
import Modelo.Avion;
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
public class ControladorWAdministrador extends HttpServlet {
    
    private final String INICIO_ADMINISTRADOR = "/Presentacion/Administrador/inicio.jsp";
    private final String INICIO_VUELOS = "/Presentacion/Vuelo/list.jsp";
    private final String AGREGAR_VUELO = "/Presentacion/Vuelo/add.jsp";
    private final String MODIFICAR_VUELO = "/Presentacion/Vuelo/edit.jsp";
    private final String INICIO_RUTAS = "";
    private final String INCIO_AVIONES = "";
    private final String GESTION_ADMINISTRADORES = "/Presentacion/Administrador/inicioGestAdmin.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorWAdministrador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorWAdministrador at " + request.getContextPath() + "</h1>");
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
        if(action.equalsIgnoreCase("GestionarAdministradores")){
            
            actualizarTablaAdministradores(request, session, modelo);
            acceso = GESTION_ADMINISTRADORES;
            
        }else if(action.equalsIgnoreCase("Editar")){
            
            String identificacion = request.getParameter("txtIdentificacionAdmin");
            String contrasenia = request.getParameter("txtContraseniaAdmin");
            
            Usuario usuario = new Usuario(identificacion, "Administrador", contrasenia, 0);
            modelo.modificarUsuario(usuario);
            
            session.setAttribute("usuario",usuario);
            acceso = INICIO_ADMINISTRADOR;
        }else if(action.equalsIgnoreCase("Agregar")){
            
            String identificacion = request.getParameter("txtIdentificacion");
            String contrasenia = request.getParameter("txtContrasenia");
            
            Usuario usuario = new Usuario(identificacion, "Administrador", contrasenia, 0);
            try {
                modelo.insertarUsuario(usuario);
                actualizarTablaAdministradores(request, session, modelo);
                
            } catch (Exception ex) {
                Logger.getLogger(ControladorWAdministrador.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            request.setAttribute("txtIdentificacion", "");
            request.setAttribute("txtContrasenia", "");
            acceso = GESTION_ADMINISTRADORES;
            
        }else if(action.equalsIgnoreCase("Eliminar")){
            String identificacion = request.getParameter("idAdministrador");
            
            try {
                modelo.eliminarUsuario(identificacion);
                actualizarTablaAdministradores(request, session, modelo);
                
            } catch (GlobalException ex) {
                Logger.getLogger(ControladorWAdministrador.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            acceso = GESTION_ADMINISTRADORES;
        }else if(action.equalsIgnoreCase("listarVuelos")){
            acceso = INICIO_VUELOS;
        }else if(action.equalsIgnoreCase("addVuelo")){
            acceso = AGREGAR_VUELO;
        }else if(action.equalsIgnoreCase("Agregar Vuelo")){
            String idVuelo = request.getParameter("txtIdVuelo");
            String fechaIda = request.getParameter("txtFechaIda");
            String fechaRegreso = request.getParameter("txtFechaRegreso");
            String strPrecio = request.getParameter("txtPrecio");
            String idAvion = request.getParameter("txtIdAvion");
            String idRuta = request.getParameter("txtIdRuta");
            
            
            Avion avion = modelo.consultarAvion(idAvion);
            int cantidadPasajeros = avion.getCantFilas() * avion.getCantAsientos();

            SimpleDateFormat formaterInput = new SimpleDateFormat("yyyy-mm-dd");
            SimpleDateFormat formaterOracle = new SimpleDateFormat("dd/mm/yyyy");
            Date dateIda, dateRegreso;
            
            try {
                dateIda = formaterInput.parse(fechaIda);
                fechaIda = formaterOracle.format(dateIda);
                dateRegreso = formaterInput.parse(fechaRegreso);
                fechaRegreso = formaterOracle.format(dateRegreso);
                
                Double precio = Double.parseDouble(strPrecio);
                
                Vuelo vuelo = new Vuelo(idVuelo, fechaIda, fechaRegreso, cantidadPasajeros, precio, idAvion, idRuta);
                modelo.insertarVuelo(vuelo);
                
                
            } catch (ParseException ex) {
                Logger.getLogger(ControladorWAdministrador.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ControladorWAdministrador.class.getName()).log(Level.SEVERE, null, ex);
            }
                        
            acceso = INICIO_VUELOS;
        }else if(action.equalsIgnoreCase("eliminarVuelo")){
            String idVuelo = request.getParameter("id");
            try {
                modelo.eliminarVuelo(idVuelo);
            } catch (GlobalException ex) {
                Logger.getLogger(ControladorWAdministrador.class.getName()).log(Level.SEVERE, null, ex);
            }
            acceso = INICIO_VUELOS;
        }else if(action.equalsIgnoreCase("editarVuelo")){
           
            request.setAttribute("idVuelo", request.getParameter("id"));
            acceso = MODIFICAR_VUELO;
        }else if(action.equalsIgnoreCase("Modificar Vuelo")){
            String idVuelo = request.getParameter("txtIdVuelo");
            String fechaIda = request.getParameter("txtFechaIda");
            String fechaRegreso = request.getParameter("txtFechaRegreso");
            String strPrecio = request.getParameter("txtPrecio");
            String idAvion = request.getParameter("txtIdAvion");
            String idRuta = request.getParameter("txtIdRuta");
            
            
            Avion avion = modelo.consultarAvion(idAvion);
            int cantidadPasajeros = avion.getCantFilas() * avion.getCantAsientos();

            SimpleDateFormat formaterInput = new SimpleDateFormat("yyyy-mm-dd");
            SimpleDateFormat formaterOracle = new SimpleDateFormat("dd/mm/yyyy");
            Date dateIda, dateRegreso;
            
            try {
                dateIda = formaterInput.parse(fechaIda);
                fechaIda = formaterOracle.format(dateIda);
                dateRegreso = formaterInput.parse(fechaRegreso);
                fechaRegreso = formaterOracle.format(dateRegreso);
                
                Double precio = Double.parseDouble(strPrecio);
                
                Vuelo vuelo = new Vuelo(idVuelo, fechaIda, fechaRegreso, cantidadPasajeros, precio, idAvion, idRuta);
                modelo.modificarVuelo(vuelo);
                
                
            } catch (ParseException ex) {
                Logger.getLogger(ControladorWAdministrador.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ControladorWAdministrador.class.getName()).log(Level.SEVERE, null, ex);
            }
                        
            acceso = INICIO_VUELOS;
        }
        
        //editarVuelo
        
        
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
        
    }
    
    private void actualizarTablaAdministradores(HttpServletRequest request, HttpSession session, Modelo modelo){
            Usuario usuario = (Usuario) session.getAttribute("usuario");
        
            ArrayList<Usuario> usuarios = modelo.listarUsuarios();
            ArrayList<Usuario> administradores = new ArrayList<Usuario>();
            for(Usuario user : usuarios){
                if(user.getTipo() == 0 && !user.getIdUsuario().equals(usuario.getIdUsuario())){
                    administradores.add(user);
                }
            }
            session.setAttribute("administradores", administradores);
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
