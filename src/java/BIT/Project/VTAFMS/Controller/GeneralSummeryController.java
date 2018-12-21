/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.GeneralSummeryDAO;
import BIT.Project.VTAFMS.DaoImpl.GeneralSummeryDAOImpl;
import BIT.Project.VTAFMS.Model.GeneralSummery;

/**
 *
 * @author Chamil
 */
public class GeneralSummeryController {

    private static GeneralSummeryDAO generalsummeryDao = new GeneralSummeryDAOImpl();

    // private static UserDAO UserDao = new UserDAOImpl();
    public static int insertGeneralSummery(GeneralSummery agent) throws Exception {
        return generalsummeryDao.insert(agent);
    }

    public static GeneralSummery searchGeneralSummeryById(int id) throws Exception {
        return generalsummeryDao.getAllGeneralSummerysByID(id);
    }

    public static Object getAllGeneralSummerys() throws Exception {
        return generalsummeryDao.viewAll();
    }

    public static int updateGeneralSummery(GeneralSummery agent) throws Exception {
        return generalsummeryDao.update(agent);
    }

    public static int DeleteGeneralSummeryById(String id) throws Exception {
        return generalsummeryDao.delete(id);
    }

    public static int getMaxId() throws Exception {
        return generalsummeryDao.getMaxId();
    }

    public static Object generalsummeryBetweenDates(String fromdate, String todate, String centername) throws Exception {
        return generalsummeryDao.generalsummeryBetweenDates(fromdate, todate, centername);
    }
}
