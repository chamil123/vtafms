/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.ExcessController;
import BIT.Project.VTAFMS.Controller.ExcessLineController;
import BIT.Project.VTAFMS.Model.Excess;
import BIT.Project.VTAFMS.Model.ExcessLine;
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

/**
 *
 * @author Chamil
 */
@WebServlet(name = "AddExcess", urlPatterns = {"/AddExcess"})
public class AddExcess extends HttpServlet {

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
            String edate, cnumber, btnAdd, chitNumber, repeatCount, totalAmount, duePayment, reson, btnUpdate, lineid, excess_id, btnDelete;
            double total;

            btnAdd = request.getParameter("Add");
            btnUpdate = request.getParameter("Update");
            btnDelete = request.getParameter("delete");

            excess_id = request.getParameter("excess_id");

            if (btnAdd != null) {
                int rowcount = Integer.parseInt(request.getParameter("rowcount"));
                edate = request.getParameter("edate");
                cnumber = request.getParameter("cnumber");
                total = Double.parseDouble(request.getParameter("tot"));
                if (btnAdd.equals("Add Excess")) {
                    //  out.print("value deka " + btnAdd + " date : " + edate);

                    Excess excess = new Excess(null, cnumber, edate, total);
                    try {
                        int res_excess = ExcessController.insertExcess(excess);
                    } catch (Exception ex) {
                        Logger.getLogger(AddExcess.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    int lastID;
                    try {
                        lastID = ExcessController.getMaxId();

                        // SummeryLine summeryline;
//                    int res_summeryLine;
                        for (int i = 0; i < rowcount; i++) {
                            chitNumber = request.getParameter("chitNumber[" + i + "]");
                            repeatCount = request.getParameter("repeatCount[" + i + "]");
                            totalAmount = request.getParameter("totalAmount[" + i + "]");
                            duePayment = request.getParameter("duePayment[" + i + "]");
                            reson = request.getParameter("reson[" + i + "]");
                            //out.print("asdasdad asd a");
                            if (!chitNumber.equals("") && !repeatCount.equals("") && !totalAmount.equals("") && !duePayment.equals("") && !reson.equals("")) {
                                ExcessLine excessline = new ExcessLine(null, lastID, chitNumber, Integer.parseInt(repeatCount), Double.parseDouble(totalAmount), Double.parseDouble(duePayment), reson);
                                int res_excessyLine = ExcessLineController.insertExcessLine(excessline);

                            }
                        }
                    } catch (Exception ex) {
                        Logger.getLogger(AddExcess.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    response.sendRedirect("View/Excess/viewExcess.jsp");
                }
            }
            if (btnUpdate != null) {
                int rowcount = Integer.parseInt(request.getParameter("rowcount"));
                edate = request.getParameter("edate");
                cnumber = request.getParameter("cnumber");
                total = Double.parseDouble(request.getParameter("tot"));
                if (btnUpdate.equals("Update Excess")) {
                    //    out.print("value deka " + btnUpdate + " date : " + edate);

                    Excess excess = new Excess(Integer.parseInt(excess_id), cnumber, edate, total);
                    try {
                        int res_excess = ExcessController.updateExcess(excess);

                    } catch (Exception ex) {
                        Logger.getLogger(AddExcess.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    int lastID;
                    try {
                        //  lastID = ExcessController.getMaxId();

                        // SummeryLine summeryline;
//                    int res_summeryLine;
                        for (int i = 1; i < rowcount; i++) {
                            lineid = request.getParameter("lineid[" + i + "]");

                            chitNumber = request.getParameter("chitNumber[" + i + "]");
                            repeatCount = request.getParameter("repeatCount[" + i + "]");
                            totalAmount = request.getParameter("totalAmount[" + i + "]");
                            duePayment = request.getParameter("duePayment[" + i + "]");
                            reson = request.getParameter("reson[" + i + "]");

                            System.out.println("line id is : " + lineid + " excessId : " + excess_id);

                            out.print("asdasdad asd a  : " + chitNumber + "  repeatCount  : " + repeatCount + " totalAmount :" + totalAmount + " duePayment :" + duePayment + " reson :" + reson + " lineid : " + lineid + "</br>");
                            if (!chitNumber.equals("") && !repeatCount.equals("") && !totalAmount.equals("") && !duePayment.equals("") && !reson.equals("")) {
                                ExcessLine excessline = new ExcessLine(Integer.parseInt(lineid), Integer.parseInt(excess_id), chitNumber, Integer.parseInt(repeatCount), Double.parseDouble(totalAmount), Double.parseDouble(duePayment), reson);
                                int res_excessyLine = ExcessLineController.updateExcess(excessline);
                                res_excessyLine = ExcessLineController.insertExcessLine(excessline);
                            }
                        }
                    } catch (Exception ex) {
                        Logger.getLogger(AddExcess.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    response.sendRedirect("View/Excess/viewExcess.jsp");
                }
            }
            if (btnDelete != null) {
                if (btnDelete.equals("Delete Excess")) {
                    String runnerId = request.getParameter("excess_id");
                    System.out.println(" update runner button eka :" + runnerId);
                    // Runner runner = new Runner(Integer.parseInt(runnerId), fname, lname, nic, pnumber, hnumber, email, address);
                    try {
                        int res_excessLine = ExcessLineController.DeleteExcessLineById(runnerId);
                        int res_excess = ExcessController.DeleteExcessById(runnerId);
                        int result = 0;
                        if (res_excess > 0) {
                            result = 2;
                        }
                        response.sendRedirect("View/Excess/viewExcess.jsp?ExcessResult=" + result);
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
