/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Containers.User;
import Controler.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

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
            out.println("<title>Servlet RegistroServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroServlet at " + request.getContextPath() + "</h1>");
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

         String usu=request.getParameter("nombres");
         String usu2 = request.getParameter("apellidos");
         out.println(usu);
          out.println("<br>");
         out.println(usu2);
         out.println("<br>");
            
         String cla=request.getParameter("correo");
         out.println(cla);
          out.println("<br>");
         String cla2=request.getParameter("contrasena");
         out.println(cla2);
          out.println("<br>");
         String cla3=request.getParameter("contrasena2");
         out.println(cla3);
          out.println("<br>");
         String cla4=request.getParameter("capital");
         out.println(cla4);
          out.println("<br>");
         String cla5=request.getParameter("ingreso");
         out.println(cla5);
          out.println("<br>");
         String cla6=request.getParameter("gasto");
         out.println(cla6);
         out.println("</body>");
         out.println("</html>");   
         
        String nombre = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        String capital = request.getParameter("capital");
        String ingreso = request.getParameter("ingreso");
        String gasto = request.getParameter("gasto");
     
        User user = new User();
        user.setCorreo(correo);
        user.setNombre(nombre);
        user.setApellidos(apellidos);
        user.setContrasena(contrasena);
        user.setCapital(capital);
        user.setIngreso(ingreso);
        user.setGasto(gasto);

        String url = "";
        out.print(user.toString());
 
        try {
            if (UserDB.emailExists(user.getCorreo())) {
                url = "/join_email_list.html";
            } else {
                UserDB.insert(user);
                //url = "/display_email_entry.jsp";
                // store the user in the session
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
            }
        } catch (Exception ex) {
            Logger.getLogger(RegistroServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        //dispatcher.forward(request, response);
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