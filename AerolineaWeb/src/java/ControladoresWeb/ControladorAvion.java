package ControladoresWeb;

import AccesoBD.AvionBD;
import Excepciones.GlobalException;
import Modelo.Avion;
import Modelo.Modelo;
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
 * @author jorge
 */
public class ControladorAvion extends HttpServlet {

    String listarAvion = "/Presentacion/Avion/list.jsp";
    String addAvion = "Presentacion/Avion/add.jsp";
    String editAvion = "Presentacion/Avion/edit.jsp";
    Avion avion = new Avion();
    AvionBD avionBD = new AvionBD();
    Modelo modelo = new Modelo();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorAvion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorAvion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        
        if (action.equalsIgnoreCase("list")) {
            acceso = listarAvion;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = addAvion;
        } else if (action.equalsIgnoreCase("agregar")) {

            String idAvion = request.getParameter("txtIdAviones");
            String marca = request.getParameter("txtMarca");
            String modelo = request.getParameter("txtModelo");
            String year = request.getParameter("txtYear");
            String numAsientos = request.getParameter("txtAsientos");
            String numFilas = request.getParameter("txtFilas");
            String numPasajeros = request.getParameter("txtPasajeros");
            avion.setIdentificador(idAvion);
            avion.setMarca(marca);
            avion.setModelo(modelo);
            avion.setAnio(Integer.parseInt(year));
            avion.setCantAsientos(Integer.parseInt(numAsientos));
            avion.setCantFilas(Integer.parseInt(numFilas));
            avion.setCantPasajeros(Integer.parseInt(numPasajeros));
            try {
                avionBD.insertarAvion(avion);
            } catch (Exception ex) {
                Logger.getLogger(ControladorAvion.class.getName()).log(Level.SEVERE, null, ex);
            }
            acceso = listarAvion;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idavion", request.getParameter("id"));
            acceso = editAvion;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            String idAvion = request.getParameter("txtIdAviones");
            String marca = request.getParameter("txtMarca");
            String modelo = request.getParameter("txtModelo");
            String year = request.getParameter("txtYear");
            String numAsientos = request.getParameter("txtAsientos");
            String numFilas = request.getParameter("txtFilas");
            String numPasajeros = request.getParameter("txtPasajeros");
            avion.setIdentificador(idAvion);
            avion.setMarca(marca);
            avion.setModelo(modelo);
            avion.setAnio(Integer.parseInt(year));
            avion.setCantAsientos(Integer.parseInt(numAsientos));
            avion.setCantFilas(Integer.parseInt(numFilas));
            avion.setCantPasajeros(Integer.parseInt(numPasajeros));
            try {
                avionBD.modificarAvion(avion);
            } catch (Exception e) {
                Logger.getLogger(ControladorAvion.class.getName()).log(Level.SEVERE, null, e);
            }
            acceso = listarAvion;
        } else if (action.equalsIgnoreCase("eliminar")) {
            String idAvion = request.getParameter("id");
            avion.setIdentificador(idAvion);
            try {
                avionBD.eliminarAvion(idAvion);
            } catch (GlobalException ex) {
                Logger.getLogger(ControladorAvion.class.getName()).log(Level.SEVERE, null, ex);
            }
            acceso = listarAvion;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
