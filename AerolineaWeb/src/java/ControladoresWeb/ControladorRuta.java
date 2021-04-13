/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresWeb;

import AccesoBD.RutaBD;
import Excepciones.GlobalException;
import Modelo.Modelo;
import Modelo.Ruta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jorge
 */
public class ControladorRuta extends HttpServlet {

    String listarRuta = "Presentacion/Ruta/list.jsp";
    String addRuta = "Presentacion/Ruta/add.jsp";
    String editRuta = "Presentacion/Ruta/edit.jsp";
    Ruta ruta = new Ruta();
    RutaBD rutaBD = new RutaBD();
    Modelo modelo = new Modelo();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorRuta</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorRuta at " + request.getContextPath() + "</h1>");
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
            acceso = listarRuta;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = addRuta;
        } else if (action.equalsIgnoreCase("agregar")) {

            String numRuta = request.getParameter("txtNumRuta");
            String origen = request.getParameter("txtOrigen");
            String destino = request.getParameter("txtDestino");
            String duracionHoras = request.getParameter("txtDuraHoras");
            String duracionminutos = request.getParameter("txtDuraMin");
            String dia = request.getParameter("txtDia");
            String horaSalida = request.getParameter("txtHoraSalida");
            String minutosSalida = request.getParameter("txtMinSalida");
            String horaLlegada = "" + (Integer.parseInt(horaSalida) + Integer.parseInt(duracionHoras)) + ":" + (Integer.parseInt(minutosSalida) + Integer.parseInt(duracionminutos));
            ruta.setIdRuta(numRuta);
            ruta.setOrigen(origen);
            ruta.setDestino(destino);
            ruta.setDuracionHoras(Integer.parseInt(duracionHoras));
            ruta.setDuracionMinutos(Integer.parseInt(duracionminutos));
            ruta.setDiaSemana(dia);
            ruta.setHora(Integer.parseInt(horaSalida));
            ruta.setMinutos(Integer.parseInt(minutosSalida));
            ruta.setHoraLlegada(horaLlegada);
            try {
                rutaBD.insertarRuta(ruta);
            } catch (Exception ex) {
                Logger.getLogger(ControladorAvion.class.getName()).log(Level.SEVERE, null, ex);
            }
            acceso = listarRuta;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idruta", request.getParameter("id"));
            acceso = editRuta;
        }else if (action.equalsIgnoreCase("Actualizar")) {

            String numRuta = request.getParameter("txtNumRuta");
            String origen = request.getParameter("txtOrigen");
            String destino = request.getParameter("txtDestino");
            String duracionHoras = request.getParameter("txtDuraHoras");
            String duracionminutos = request.getParameter("txtDuraMin");
            String dia = request.getParameter("txtDia");
            String horaSalida = request.getParameter("txtHoraSalida");
            String minutosSalida = request.getParameter("txtMinSalida");
            String horaLlegada = "" + (Integer.parseInt(horaSalida) + Integer.parseInt(duracionHoras)) + ":" + (Integer.parseInt(minutosSalida) + Integer.parseInt(duracionminutos));
            ruta.setIdRuta(numRuta);
            ruta.setOrigen(origen);
            ruta.setDestino(destino);
            ruta.setDuracionHoras(Integer.parseInt(duracionHoras));
            ruta.setDuracionMinutos(Integer.parseInt(duracionminutos));
            ruta.setDiaSemana(dia);
            ruta.setHora(Integer.parseInt(horaSalida));
            ruta.setMinutos(Integer.parseInt(minutosSalida));
            ruta.setHoraLlegada(horaLlegada);
            try {
                rutaBD.modificarRuta(ruta);
            } catch (Exception ex) {
                Logger.getLogger(ControladorAvion.class.getName()).log(Level.SEVERE, null, ex);
            }
            acceso = listarRuta;
        }else if (action.equalsIgnoreCase("eliminar")) {
            String idRuta = request.getParameter("id");
            ruta.setIdRuta(idRuta);
            try {
                rutaBD.eliminarRuta(idRuta);
            } catch (GlobalException ex) {
                Logger.getLogger(ControladorAvion.class.getName()).log(Level.SEVERE, null, ex);
            }
            acceso = listarRuta;
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
