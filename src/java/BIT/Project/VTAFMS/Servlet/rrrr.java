/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.json.stream.JsonParser;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.nashorn.internal.parser.JSONParser;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Chamil
 */
@WebServlet(name = "rrrr", urlPatterns = {"/rrrr"})
public class rrrr extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // static String data;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String chitnum = request.getParameter("chitnum");
            String cnumber = request.getParameter("cnumber");

            String cnum = request.getParameter("cname");
            String btnAdd = request.getParameter("Add");
         //   System.out.print(" data osssssbsdt : " + chitnum + " : " + cnumber + " :" + cnum + " : " + btnAdd);
            //JSONArray arrayObj=null;
            //   JSONParser jsonParser=new JSONParser();

                            String data = request.getParameter("chtNum");
                            
//                              JSONObject jobj;
//                        try {
//                            jobj = new JSONObject(data);
//                        
                     //       System.out.print(" data dddddd : " + data.toString());
//                            Iterator it=jobj.keys();
//                            while (it.hasNext()) {
//                               String key=(String) it.next();
//                               Object o=jobj.get(key);
//                            //   String list = jobj.key;
//                              System.out.print(" data osssssbsdt : " + key.toString());
//                                
//                            }
//                           } catch (JSONException ex) {
//                            Logger.getLogger(rrrr.class.getName()).log(Level.SEVERE, null, ex);
//                        }
//
//             JSONObject obj=new JSONObject(data);
//                         JSONArray jarray=obj.getJSONArray(data);
//                         
//
//            ;
          //   System.out.print(" data osssss : " + data);
                             System.out.print(" aaa : "+data);
              if (data != null) {
//             String data = request.getParameter("chtNum");

                //if (btnAdd.equals("AddCenter")) {
                      String rowTokens[] = data.split(",");
                String chitnumber = "", amount = " ", payment = "";
                for (int x = 0; x < rowTokens.length; x++) {
                    String columnTokens[] = rowTokens[x].split(":");
                    for (int y = 0; y < columnTokens.length; y++) {
                        chitnumber = columnTokens[0];
                        amount = columnTokens[1];
                        payment = columnTokens[2];
                    }
                   System.out.print(chitnumber + "" + amount + "" + payment); 
                }
                    
                    
                   // System.out.print("name is palamuwa : " + btnAdd + " data os : " + data);
                    //response.sendRedirect("center.jsp");

               // }

              
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
