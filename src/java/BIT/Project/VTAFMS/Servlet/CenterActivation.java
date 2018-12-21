/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.CenterController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chamil
 */
@WebServlet(name = "CenterActivation", urlPatterns = {"/CenterActivation"})
public class CenterActivation extends HttpServlet {

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
            String action = request.getParameter("action");
            String centerId = request.getParameter("center_id");
            
            System.out.println("center activation : "+action);
            System.out.println("center activation d : "+centerId);

            if (action.equals("deactivate")) {
                int result;
                try {
                    result = CenterController.deactivateCenter(centerId);

                    if (result == 1) {
                        out.print("center id : has been deactivated");
                    } else {
                        out.print("center id :not has been activated");
                    }
                    response.sendRedirect("View/Center/viewCenters.jsp");
                } catch (Exception ex) {
                    Logger.getLogger(CenterActivation.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            if (action.equals("activate")) {
                int result;
                try {
                    result = CenterController.activateCenter(centerId);

                    if (result == 1) {
                        out.print("center id : has been activated");
                    } else {
                        out.print("center id :not has been deactivated");
                    }
                    response.sendRedirect("View/Center/viewCenters.jsp");
                } catch (Exception ex) {
                    Logger.getLogger(CenterActivation.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

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
