/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresWeb;

import Excepciones.GlobalException;
import Modelo.Modelo;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
    private final String INICIO_VUELOS = "";
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
        }
        
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
