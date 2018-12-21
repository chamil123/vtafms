/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import BIT.Project.VTAFMS.Controller.CenterController;
import BIT.Project.VTAFMS.Controller.CenterExpensesController;
import BIT.Project.VTAFMS.Model.Center;
import BIT.Project.VTAFMS.Model.CenterExpenses;
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
@WebServlet(name = "AddCenter", urlPatterns = {"/AddCenter"})
public class AddCenter extends HttpServlet {

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

            String count = request.getParameter("rowcount");
            int rowcount = 0;
            if (!count.equals("")) {
                rowcount = Integer.parseInt(request.getParameter("rowcount"));
            }

            //out.print(rowcount);
            String cnumber, cname, type, pnumber, onumber, address, expensesname, value, tot;
            double pcash;
            int expences, agent, comision = 0, nocomision, lesscommision, cnum;
            cnumber = request.getParameter("cnumber");
            cnum = Integer.parseInt(request.getParameter("cnum"));
            cname = request.getParameter("cname");
            type = request.getParameter("type");
            agent = Integer.parseInt(request.getParameter("agent"));
            pnumber = request.getParameter("pnumber");
            onumber = request.getParameter("onumber");
            address = request.getParameter("address");
            pcash = Double.parseDouble(request.getParameter("pcash"));
            comision = Integer.parseInt(request.getParameter("comision"));
            nocomision = Integer.parseInt(request.getParameter("nocomision"));
            lesscommision = Integer.parseInt(request.getParameter("lcomision"));
            // expences = Integer.parseInt(request.getParameter("expences"));
            //out.println(cname);
            tot = request.getParameter("tot");
            String btnAdd = request.getParameter("Add");

            if (btnAdd != null) {
                if (btnAdd.equals("AddCenter")) {
                    try {

                        Center center = new Center(cnumber, cnum, cname, comision, nocomision, lesscommision, pcash, pnumber, onumber, type, "Activate", address, agent, Double.parseDouble(tot));
                        int res_center = CenterController.insertCenter(center);
                        //  System.out.println("Add center : "+res_center);

                        CenterExpenses centerExp;
                        int res_centerExp;
                        for (int i = 1; i < rowcount; i++) {
                            expensesname = request.getParameter("expensesname[" + i + "]");
                            value = request.getParameter("value[" + i + "]");
                            out.println(expensesname + " " + value + " " + tot);
//                            payment = request.getParameter("country[" + i + "]");
//                            if (!chitNumber.equals("") && !amount.equals("") && !payment.equals("")) {
                            centerExp = new CenterExpenses(null, expensesname, Double.parseDouble(value), cnumber);
                            res_centerExp = CenterExpensesController.insertCenterExpenses(centerExp);
//                            }
                        }
                        response.sendRedirect("View/Center/center.jsp?res_center=" + res_center);
                    } catch (Exception ex) {
                        Logger.getLogger(AddCenter.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    // response.sendRedirect("center.jsp");
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
