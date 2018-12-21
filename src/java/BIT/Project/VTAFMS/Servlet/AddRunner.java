/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.RunnerController;
import BIT.Project.VTAFMS.Model.Runner;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jboss.weld.servlet.SessionHolder;

/**
 *
 * @author Chamil
 */
@WebServlet(name = "AddRunner", urlPatterns = {"/AddRunner"})
public class AddRunner extends HttpServlet {

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
 /*declair the variable*/
            String fname, lname, nic, pnumber, hnumber, email, address, btnAdd, btnUpdate, btnDelete;

            /*get all data from runner.jsp using get parameter method and assign into variables  */
            fname = request.getParameter("fname");
            lname = request.getParameter("lname");
            nic = request.getParameter("nic");
            pnumber = request.getParameter("pnumber");
            hnumber = request.getParameter("hnumber");
            email = request.getParameter("email");
            address = request.getParameter("address");
            btnAdd = request.getParameter("Add");
            btnUpdate = request.getParameter("Update");
            btnDelete = request.getParameter("delete");
            /*end get parameter method*/

 /*check the button name from runner jsp. if not click the add button from runner jsp btnAdd name is null.*/
            if (btnAdd != null) {
                /*check the add button value*/
                if (btnAdd.equals("Add Runner")) {

                    /*Create runner Object and insert into vlues acording to object varible*/
                    Runner runner = new Runner(null, fname, lname, nic, pnumber, hnumber, email, address);
                    try {
                        /*pass runner object into Runner controller*/
                        int res_runner = RunnerController.insertRunner(runner);
                        // HttpSession session = request.getSession();

                        //re direct the runnerjsp page and pass feedback of insert result in new runner 
                        response.sendRedirect("View/Runner/Runner.jsp?runnerResult=" + res_runner);
                    } catch (Exception ex) {
                        Logger.getLogger(AddRunner.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                /*end if btnAdd value*/
            }
            /*end if btnAdd*/

 /*check the button name from runner jsp. if not click the Update button from runner jsp btnAdd name is null.*/
            if (btnUpdate != null) {

                /*check the Update button value*/
                if (btnUpdate.equals("Update Runner")) {
                    String runnerId = request.getParameter("id");
                    System.out.println(" update runner button eka :" + runnerId);
                    Runner runner = new Runner(Integer.parseInt(runnerId), fname, lname, nic, pnumber, hnumber, email, address);
                    try {
                        int res_runner = RunnerController.updateRunner(runner);
                        response.sendRedirect("View/Runner/ViewRunners.jsp?runnerResult=" + res_runner);
                    } catch (Exception ex) {
                        Logger.getLogger(AddRunner.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                //end if check button value
            }
            /*end if btnAdd*/

 /*check the button name from runner jsp. if not click the add button from runner jsp btnAdd name is null.*/
            if (btnDelete != null) {
                /*check the Update button value*/
                if (btnDelete.equals("Delete Runner")) {
                    //get runner id from selected row in view runner.jsp using getparameter method and asign into runnerId variable 
                    String runnerId = request.getParameter("user_id");
                    try {
                        //pass selected runnerid into runner controler to delete runner method and delete selected runner
                        int res_runner = RunnerController.DeleteRunnerById(runnerId);
                        
                        int result = 0;
                        if (res_runner > 0) {
                            result = 2;
                        }
                        //redirect the page ViewRunners.jsp and pass result value from runner controller acording to delete runner
                       // HttpSession session = request.getSession();
                        response.sendRedirect("View/Runner/ViewRunners.jsp?runnerResult=" + result);
                    } catch (Exception ex) {
                        Logger.getLogger(AddRunner.class.getName()).log(Level.SEVERE, null, ex);
                    }
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
