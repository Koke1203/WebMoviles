/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresWeb;

import AccesoBD.ClienteBD;
import AccesoBD.UsuarioBD;
import Modelo.Cliente;
import Modelo.DetalleHistoricoCompra;
import Modelo.DetalleVuelo;
import Modelo.Modelo;
import Modelo.Usuario;
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
public class ControladorWLogin extends HttpServlet {

    private final String INICIO = "index.jsp";
    private final String INICIO_ADMINISTRADOR = "/Presentacion/Administrador/inicio.jsp";
    private final String INICIO_CLIENTE = "/Presentacion/Cliente/inicio.jsp";
    private final String CONSULTA_VUELOS = "/Presentacion/General/list.jsp";
    private final String REGISTRO_CLIENTE = "/Presentacion/Registro/registro.jsp";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorWInicio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorWInicio at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Se obtiene la sesión, si no existe se crea
        HttpSession session = request.getSession(true);
        Modelo modelo = new Modelo();
        
        String acceso = "";
        String action = request.getParameter("accion");
        
        if(action.equalsIgnoreCase("Inciar Sesión")){
            //Datos del formulario
            String identificacion = request.getParameter("txtIdentificacion");
            String contrasenia = request.getParameter("passContrasenia");
            //Se realiz la consulta mediante el modelo
            
            Usuario usuario = modelo.consultarUsuario(identificacion);
            
            if(usuario != null){
                if(usuario.getContrasenia().equals(contrasenia)){
                    session.setAttribute("usuario", usuario);
                    switch (usuario.getTipo()) {
                        case 0:
                            //Administrador
                            acceso = INICIO_ADMINISTRADOR;
                            break;
                        case 1:                    
                            //Cliente
                            Cliente cliente = modelo.consultarCliente(identificacion);
                            session.setAttribute("cliente", cliente);
                            
                            if(cliente != null){
                                ArrayList<DetalleHistoricoCompra> historicoCompras = modelo.listarDetalleHistoricoComprasCliente(identificacion);
                                session.setAttribute("historicoCompras", historicoCompras);
                                acceso = INICIO_CLIENTE;
                            }
                            break;
                    //Tipo de usuario desconocido
                        default:
                            break;
                    }
                }else{//Contraseña inválida
                
                }
            }          
            //System.out.printf("Identificacion %s contrasenia %s \n", identificacion, contrasenia);
        }else if(action.equalsIgnoreCase("Cerrar Sesión")){
            session.removeAttribute("usuario");
            session.invalidate();
            acceso = INICIO;
        }else if(action.equalsIgnoreCase("Registrar")){

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
                
                Cliente cliente = new Cliente(identificacion, nombre, primerApellido, segundoApellido, nacimiento, correo, direccion, telefono, celular, contrasenia);
                Usuario usuario = new Usuario(identificacion, "Cliente", contrasenia, 1);
                try {
                    modelo.insertarUsuario(usuario);
                    modelo.insertarCliente(cliente);
                } catch (Exception ex) {
                    Logger.getLogger(ControladorWLogin.class.getName()).log(Level.SEVERE, null, ex);
                }
                acceso = INICIO;
            } catch (ParseException ex) {
                Logger.getLogger(ControladorWLogin.class.getName()).log(Level.SEVERE, null, ex);
            }   
        }else if(action.equalsIgnoreCase("ConsultarVuelos")){
            
            ArrayList<DetalleVuelo> detalleVuelos = modelo.listarDetalleVuelos();
            session.setAttribute("detalleVuelos",detalleVuelos);
            
            acceso = CONSULTA_VUELOS;
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
    }// </editor-fold>

}
