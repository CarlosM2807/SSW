/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Containers.Movimiento;
import Controler.MovimientoDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author carlo
 */
@WebServlet(urlPatterns = {"/MovimientoServlet"})
public class MovimientoServlet extends HttpServlet {

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
            out.println("<title>Servlet MovimientoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MovimientoServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
        
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
        PrintWriter out = response.getWriter();

         out.println("<html>");
         out.println("<head></head>");         
         out.println("<body>");

         String usu=request.getParameter("type");
         String usu2 = request.getParameter("concept");
         out.println(usu);
          out.println("<br>");
         out.println(usu2);
         out.println("<br>");
            
         String cla=request.getParameter("date");
         out.println(cla);
          out.println("<br>");
         String cla2=request.getParameter("amount");
         out.println(cla2);
         out.println("</body>");
         out.println("</html>");   
         
         
        
        String tipo = request.getParameter("type");
        String concepto = request.getParameter("concept");
        String fecha = request.getParameter("date");
        String cantidad = request.getParameter("amount");
        
            Movimiento dato = new Movimiento();
            dato.setTipo(tipo);
            dato.setConcepto(concepto);
            dato.setFecha(fecha);
            dato.setCantidad(cantidad);
            dato.setId_user((String)request.getSession().getAttribute("id"));
            out.print(dato.toString());
            MovimientoDB.insert(dato);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ingresaMov.jsp");
            dispatcher.forward(request, response);
        
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
