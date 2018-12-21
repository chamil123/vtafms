/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.CenterExpensesDAO;
import BIT.Project.VTAFMS.DaoImpl.CenterExpensesDAOImpl;
import BIT.Project.VTAFMS.Model.CenterExpenses;

/**
 *
 * @author Chamil
 */
public class CenterExpensesController {

    private static CenterExpensesDAO centerExp = new CenterExpensesDAOImpl();

    public static int insertCenterExpenses(CenterExpenses center) throws Exception {
        return centerExp.insert(center);
    }

    public static Object getAllCenterExpensess() throws Exception {
        return centerExp.viewAll();
    }

    public static int updateCenterExpenses(CenterExpenses center) throws Exception {
        return centerExp.update(center);
    }

    public static int DeleteCenterExpensesById(String id) throws Exception {
        return centerExp.delete(id);
    }
    public static Object getAllcenterExpensesByCenterID(String id) throws Exception {
        return centerExp.getAllcenterExpensesByCenterID(id);
    }

}
