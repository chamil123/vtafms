/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.ExcessDAO;
import BIT.Project.VTAFMS.DaoImpl.ExcessDAOImpl;
import BIT.Project.VTAFMS.Model.Excess;

/**
 *
 * @author Chamil
 */
public class ExcessController {

    private static ExcessDAO excessDao = new ExcessDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertExcess(Excess excess) throws Exception {

        return excessDao.insert(excess);

    }

    public static Excess searchExcessById(String id) throws Exception {
        return excessDao.getAllExcessByID(id);
    }

    public static Object getAllExcess() throws Exception {
        return excessDao.viewAll();
    }

    public static int updateExcess(Excess excess) throws Exception {
        return excessDao.update(excess);
    }

    public static int DeleteExcessById(String id) throws Exception {
        return excessDao.delete(id);
    }

    public static int getMaxId() throws Exception {
        return excessDao.getMaxId();
    }

    public static double getexcessTotalByidandDate(String id, String date) throws Exception {
        return excessDao.getexcessTotalByidandDate(id, date);
    }

    public static double getexcessTotalByid(String id) throws Exception {
        return excessDao.getexcessTotalByid(id);
    }

    public static Excess getExcessById(String id) throws Exception {
        return excessDao.getExcessById(id);
    }

}
