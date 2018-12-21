/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.RoleController;
import BIT.Project.VTAFMS.Controller.UserController;
import BIT.Project.VTAFMS.Model.Role;
import BIT.Project.VTAFMS.Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "GetUserDetais", urlPatterns = {"/GetUserDetais"})
public class GetUserDetais extends HttpServlet {

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
            try {
                String id = request.getParameter("dayVal");
                User user = (User) UserController.searchUserById(Integer.parseInt(id));
                Role role=(Role) RoleController.searchRoleById(user.getRole_id());

                out.print(user.getUser_id().toString().concat(":")+""
                        + ""+user.getUser_firstName().concat(":")+" "
                        + ""+user.getUser_lastName().concat(":")+" "
                        + ""+user.getUser_email().concat(":")+" "
                        + ""+user.getUser_status().concat(":")+" "
                        + ""+user.getUser_image().concat(":")+""
                        + " "+user.getUser_phoneNumber().concat(":")+""
                        + " "+user.getUser_gender().concat(":")+""
                        + " "+user.getUser_dob().concat(":")+ ""
                        + " "+user.getUser_nic().concat(":")+ " "
                        + ""+user.getUser_address().concat(":")+ ""+role.getRole_name().concat(":")+ " "+user.getUser_uname().concat("!"));
                //  System.out.println("sdfsf sfsf  f dfsdf fs df sdf df df sf df df dsfsd sdf df : " + listperson.get(j).getPersonId() + ":" + listperson.get(j).getPersonFirstName().concat(":") + listperson.get(j).getPersonLastName().concat(":") + listcivillians.get(k).getCivillianDurationOfResidency().concat(":") + listcivillians.get(k).getCivillianLegalStatus().concat(":") + listcivillians.get(k).getCivillianNationality().concat(":") + listcivillians.get(k).getCivillianProfession().concat(":") + listcivillians.get(k).getCivillianEmail().concat(":") + listcivillians.get(k).getCivillianPhone().concat("!") + city.getCityName() + sentorCity.concat("!"));

            } catch (Exception ex) {
                Logger.getLogger(GetUserDetais.class.getName()).log(Level.SEVERE, null, ex);
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
